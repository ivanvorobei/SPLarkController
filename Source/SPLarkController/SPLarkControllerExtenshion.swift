// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
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

extension UIViewController {
    
    open var isPresentedAsLark: Bool {
        return transitioningDelegate is SPLarkTransitioningDelegate
            && modalPresentationStyle == .custom
            && presentingViewController != nil
    }
    
    open func presentAsLark(_ controller: UIViewController, height: CGFloat? = nil, complection: (() -> Void)? = nil) {
        if self.isPresentedAsLark { return }
        let transitionDelegate = SPLarkTransitioningDelegate()
        transitionDelegate.customHeight = height
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationCapturesStatusBarAppearance = true
        controller.modalPresentationStyle = .custom
        self.present(controller, animated: true, completion: complection)
    }
    
    open func presentLark(settings controller: SPLarkSettingsController) {
        if self.isPresentedAsLark { return }
        let transitionDelegate = SPLarkTransitioningDelegate()
        var safeArea = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            safeArea = UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
        }
        transitionDelegate.customHeight = 250 + safeArea.bottom
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationCapturesStatusBarAppearance = true
        controller.modalPresentationStyle = .custom
        self.present(controller, animated: true, completion: nil)
    }
}
