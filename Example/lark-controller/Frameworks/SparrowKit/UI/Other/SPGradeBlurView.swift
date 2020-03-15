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

class SPGradeBlurView: UIView {
    
    internal var gradeView: UIView = UIView()
    internal var blurView: UIView = UIView()
    
    init(gradeColor: UIColor = UIColor.black, gradeAlphaFactor: CGFloat = 0.1, blurRadius: CGFloat = 3) {
        super.init(frame: CGRect.zero)
        self.setGradeColor(gradeColor)
        self.setGradeAlpha(gradeAlphaFactor, blurRaius: blurRadius)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        if #available(iOS 9, *) {
            self.blurView = SPBlurView()
        }
        self.layer.masksToBounds = true
        self.addSubview(gradeView)
        self.addSubview(blurView)
    }
    
    func setGradeColor(_ color: UIColor) {
        self.gradeView.backgroundColor = UIColor.black
    }
    
    func setGradeAlpha(_ alpha: CGFloat) {
        self.gradeView.alpha = alpha
    }
    
    func setBlurRadius(_ radius: CGFloat) {
        if #available(iOS 9, *) {
            if let blurView = self.blurView as? SPBlurView {
                blurView.setBlurRadius(radius)
            }
        }
    }
    
    func setGradeAlpha(_ alpha: CGFloat, blurRaius: CGFloat) {
        self.setGradeAlpha(alpha)
        self.setBlurRadius(blurRaius)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradeView.frame = self.bounds
        self.blurView.frame = self.bounds
    }
}
