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

class SPSystemIconButton: SPButton {
    
    let iconView = SPSystemIconView.init()
    
    var widthIconFactor: CGFloat = 1
    var heightIconFactor: CGFloat = 1
    
    var icon: SPSystemIcon {
        didSet {
            self.iconView.icon = self.icon
        }
    }
    
    var color = SPNativeColors.blue {
        didSet {
            self.iconView.color = self.color
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.iconView.color = self.color.withAlphaComponent(0.7)
            } else {
                self.iconView.color = self.color.withAlphaComponent(1)
            }
        }
    }
    
    override init() {
        self.icon = .share
        super.init()
        self.commonInit()
    }
    
    init(type: SPSystemIcon) {
        self.icon = type
        super.init()
        self.iconView.icon = self.icon
        self.icon = type
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func commonInit() {
        super.commonInit()
        self.iconView.isUserInteractionEnabled = false
        self.addSubview(self.iconView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.iconView.setBounds(self, withWidthFactor: self.widthIconFactor, withHeightFactor: self.heightIconFactor, withCentering: true)
    }
}
