// The MIT License (MIT)
// Copyright © 2017 Ivan Varabei (varabeis@icloud.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

@available(iOS 10.0, *)
class SPLarkPresentationController: UIPresentationController, UIGestureRecognizerDelegate {
    
    var transitioningDelegate: SPLarkTransitioningDelegate?
    
    var customHeight: CGFloat? = nil
    var swipeToDismissEnabled: Bool = true
    var translateForDismiss: CGFloat = 100
    
    var pan: UIPanGestureRecognizer?
    var tap: UITapGestureRecognizer?
    
    private var feedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    private var afterReleaseDismissing: Bool = false
    
    private var height: CGFloat {
        return self.customHeight ?? (250 + self.safeArea.bottom)
    }

    private var snapshotView: UIView?
    private let snapshotViewContainer = UIView()
    private var gradeView: UIView = UIView()
    
    private var workGester: Bool = false
    private var startDismissing: Bool = false
    
    private var animateCornerRadius: Bool {
        return self.safeArea.bottom == 0
    }
    
    private var cornerRadius: CGFloat {
        return self.safeArea.bottom == 0 ? 5 : 20
    }
    
    private var safeArea: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
        } else {
            return UIEdgeInsets.zero
        }
    }
    
    private var identityTransformForSnapshot: CGAffineTransform {
        return CGAffineTransform.identity.translatedBy(x: 0, y: -self.height)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return CGRect(x: 0, y: containerView.bounds.height - self.height, width: containerView.bounds.width, height: self.height)
    }
    
    public func updateHeight(_ newHeight: CGFloat) {
        guard let containerView = containerView else { return }
        
        UIView.animate(
            withDuration: 0.45,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: {
                self.presentedView?.frame.origin.y = containerView.frame.height - newHeight
                self.presentedView?.frame.size.height = newHeight
                self.snapshotViewContainer.transform = CGAffineTransform(translationX: 0, y: -newHeight)
        }
        ) { _ in
            self.customHeight = newHeight
        }
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        self.feedbackGenerator.prepare()
        
        guard let containerView = self.containerView, let window = containerView.window  else { return }

        self.updateSnapshot()
        self.snapshotViewContainer.frame = containerView.bounds
        window.addSubview(self.snapshotViewContainer)
        
        self.gradeView.backgroundColor = self.presentedView?.backgroundColor ?? UIColor.black
        containerView.addSubview(self.gradeView)
        self.constraints(view: gradeView, to: containerView)
        
        self.snapshotView?.layer.cornerRadius = 0
        self.snapshotView?.layer.masksToBounds = true
        
        if self.animateCornerRadius {
            self.addCornerRadiusAnimation(for: self.snapshotView, cornerRadius: self.cornerRadius, duration: 0.45)
        } else {
            self.snapshotView?.layer.cornerRadius = self.cornerRadius
        }
        
        presentedViewController.transitionCoordinator?.animate(
            alongsideTransition: { [weak self] context in
                guard let `self` = self else { return }
                self.snapshotViewContainer.transform = self.identityTransformForSnapshot
            }, completion: { _ in })
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.dismissAction))
        tap.cancelsTouchesInView = false
        self.snapshotViewContainer.addGestureRecognizer(tap)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        
        self.pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan))
        self.pan!.delegate = self
        self.pan!.maximumNumberOfTouches = 1
        self.pan!.cancelsTouchesInView = false
        self.snapshotViewContainer.addGestureRecognizer(self.pan!)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        self.startDismissing = true
        
        if self.animateCornerRadius {
            self.addCornerRadiusAnimation(for: self.snapshotView, cornerRadius: 0, duration: 0.45)
        } else {
            self.snapshotView?.layer.cornerRadius = self.cornerRadius
        }
        
        presentedViewController.transitionCoordinator?.animate(
            alongsideTransition: { [weak self] context in
                guard let `self` = self else { return }
                self.snapshotViewContainer.transform = .identity
            }, completion: { _ in })
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        
        self.snapshotView?.removeFromSuperview()
        self.snapshotViewContainer.removeFromSuperview()
        self.gradeView.removeFromSuperview()
    }
}

@available(iOS 10.0, *)
extension SPLarkPresentationController {
    
    @objc func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        guard gestureRecognizer.isEqual(self.pan), self.swipeToDismissEnabled else { return }
        
        switch gestureRecognizer.state {
        case .began:
            self.workGester = true
            self.presentingViewController.view.layer.removeAllAnimations()
            self.presentingViewController.view.endEditing(true)
            self.presentedViewController.view.endEditing(true)
            gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: containerView)
        case .changed:
            self.workGester = true
            if self.swipeToDismissEnabled {
                let translation = gestureRecognizer.translation(in: self.snapshotViewContainer)
                self.updateForTranslation(inVerticalDirection: translation.y)
            } else {
                gestureRecognizer.setTranslation(.zero, in: presentedView)
            }
        case .ended:
            self.workGester = false
            let translation = gestureRecognizer.translation(in: presentedView).y
            if translation >= self.translateForDismiss {
                self.presentedViewController.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(
                    withDuration: 0.6,
                    delay: 0,
                    usingSpringWithDamping: 1,
                    initialSpringVelocity: 1,
                    options: [.curveEaseOut, .allowUserInteraction],
                    animations: {
                        self.snapshotViewContainer.transform = self.identityTransformForSnapshot
                })
            }
        default:
            break
        }
    }
    
    private func updateForTranslation(inVerticalDirection translation: CGFloat) {
        if self.startDismissing { return }
        
        let elasticThreshold: CGFloat = 0
        let translationFactor: CGFloat = 1 / 2
        
        if translation >= 0 {
            let translationForModal: CGFloat = {
                if translation >= elasticThreshold {
                    let frictionLength = translation - elasticThreshold
                    let frictionTranslation = 30 * atan(frictionLength / 120) + frictionLength / 10
                    return frictionTranslation + (elasticThreshold * translationFactor)
                } else {
                    return translation * translationFactor
                }
            }()
            
            self.snapshotViewContainer.transform = self.identityTransformForSnapshot.translatedBy(x: 0, y: translationForModal)
        } else {
            self.snapshotViewContainer.transform = self.identityTransformForSnapshot
        }
        
        if self.swipeToDismissEnabled {
            let afterRealseDismissing = (translation >= self.translateForDismiss)
            if afterRealseDismissing != self.afterReleaseDismissing {
                self.afterReleaseDismissing = afterRealseDismissing
                self.feedbackGenerator.impactOccurred()
            }
        }
    }
    
    @objc func dismissAction() {
        self.presentingViewController.view.endEditing(true)
        self.presentedViewController.view.endEditing(true)
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    func updatePresentingController() {
        if self.startDismissing { return }
        self.updateSnapshot()
    }
    
    private func updateSnapshot() {
        guard let currentSnapshotView = presentingViewController.view.snapshotView(afterScreenUpdates: true) else { return }
        self.snapshotView?.removeFromSuperview()
        self.snapshotViewContainer.addSubview(currentSnapshotView)
        self.constraints(view: currentSnapshotView, to: self.snapshotViewContainer)
        self.snapshotView = currentSnapshotView
        self.snapshotView?.layer.cornerRadius = self.cornerRadius
        self.snapshotView?.layer.masksToBounds = true
    }
    
    private func constraints(view: UIView, to superView: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superView.topAnchor),
            view.leftAnchor.constraint(equalTo: superView.leftAnchor),
            view.rightAnchor.constraint(equalTo: superView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    private func addCornerRadiusAnimation(for view: UIView?, cornerRadius: CGFloat, duration: CFTimeInterval) {
        guard let view = view else { return }
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fromValue = view.layer.cornerRadius
        animation.toValue = cornerRadius
        animation.duration = duration
        view.layer.add(animation, forKey: "cornerRadius")
        view.layer.cornerRadius = cornerRadius
    }
}
