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

@available(iOS 8.2, *)
class SPLarkSettingsCollectionViewCell: UICollectionViewCell {

    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override var isHighlighted: Bool{
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.27, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: [.curveEaseOut, .beginFromCurrentState], animations: {
                    self.transform = self.transform.scaledBy(x: 0.92, y: 0.92)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.27, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: [.curveEaseOut, .beginFromCurrentState], animations: {
                    self.transform = CGAffineTransform.identity
                }, completion: nil)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 13

        self.titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .left
        self.titleLabel.baselineAdjustment = .alignBaselines
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.text = "Title"
        self.addSubview(self.titleLabel)
        
        self.subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        self.subtitleLabel.numberOfLines = 1
        self.subtitleLabel.textAlignment = .left
        self.subtitleLabel.textColor = UIColor.white
        self.subtitleLabel.text = "Subtitle"
        self.addSubview(self.subtitleLabel)
    }
    
    func setHighlighted(_ state: Bool, color: UIColor) {
        self.backgroundColor = color
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = "Title"
        self.subtitleLabel.text = "Subtitle"
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.isHighlighted {
            return
        }
        
        if self.subtitleLabel.text == nil {
            let topInset: CGFloat = 19 / 2
            let sideInset: CGFloat = 19 / 1.5
            
            self.titleLabel.sizeToFit()
            self.titleLabel.frame = CGRect.init(
                x: sideInset,
                y: topInset,
                width: self.frame.width - sideInset * 2,
                height: self.frame.height - topInset * 2
            )
        } else {
            let topInset: CGFloat = 19 / 2
            let sideInset: CGFloat = 19 / 1.5
            
            self.subtitleLabel.sizeToFit()
            self.subtitleLabel.frame.origin.x = sideInset
            self.subtitleLabel.frame = CGRect.init(x: self.subtitleLabel.frame.origin.x, y: self.subtitleLabel.frame.origin.y, width: self.frame.width - sideInset * 2, height: self.subtitleLabel.frame.height)
            self.subtitleLabel.frame.origin.y = self.frame.height - topInset * 1.2 - self.subtitleLabel.frame.height
            
            self.titleLabel.sizeToFit()
            self.titleLabel.frame = CGRect.init(x: self.titleLabel.frame.origin.x, y: self.titleLabel.frame.origin.y, width: self.frame.width - sideInset * 2, height: self.subtitleLabel.frame.origin.y - topInset - topInset / 2)
            
            self.titleLabel.frame.origin.x = sideInset
            self.titleLabel.frame.origin.y = topInset * 1.3
        }
    }
}
