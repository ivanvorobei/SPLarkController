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

class SPSocialButton: UIButton {
    
    let iconView = SPSocialIconView.init()
    var widthIconFactor: CGFloat = 0.5
    var heightIconFactor: CGFloat = 0.5
    
    var type: SPSocialNetwork {
        didSet {
            self.iconView.type = self.type
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.iconView.color = self.iconView.color.withAlphaComponent(0.7)
            } else {
                self.iconView.color = self.iconView.color.withAlphaComponent(1)
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.alpha = 1
            } else {
                self.alpha = 0.5
            }
        }
    }
    
    init() {
        self.type = .facebook
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    init(type: SPSocialNetwork) {
        self.type = type
        super.init(frame: CGRect.zero)
        self.commonInit()
        defer {
            self.type = type
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func commonInit() {
        self.iconView.isUserInteractionEnabled = false
        self.addSubview(self.iconView)
        self.backgroundColor = SPNativeColors.blue
        self.iconView.color = SPNativeColors.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.iconView.setBounds(self, withWidthFactor: self.widthIconFactor, withHeightFactor: self.heightIconFactor, withCentering: true)
        self.round()
    }
}

