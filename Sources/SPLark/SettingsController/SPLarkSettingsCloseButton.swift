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

class SPLarkSettingsCloseButton: UIButton {
    
    private let iconView = SPLarkSettingsCloseIconButton()
    
    override public var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.iconView.color = self.color.withAlphaComponent(0.7)
            } else {
                self.iconView.color = self.color.withAlphaComponent(1)
            }
        }
    }
    
    var color = UIColor.lightGray {
        didSet {
            self.iconView.color = self.color
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.iconView.isUserInteractionEnabled = false
        self.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        self.color = UIColor.lightGray
        self.addSubview(self.iconView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(bottomX: CGFloat, y: CGFloat) {
        self.sizeToFit()
        self.frame.origin.x = bottomX - self.frame.width
        self.frame.origin.y = y
        self.layoutSubviews()
    }
    
    override public func sizeToFit() {
        super.sizeToFit()
        self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: 30, height: 30)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        self.iconView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width * 0.36, height: self.frame.height * 0.36)
        self.iconView.center = CGPoint.init(x: self.frame.width / 2, y: self.frame.height / 2)
    }
}

class SPLarkSettingsCloseIconButton: UIView {
    
    var color = UIColor.lightGray {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        SPLarkSettingsCodeDraw.SystemIconPack.drawClose(frame: rect, resizing: .aspectFit, color: self.color)
    }
}

struct SPLarkSettingsCodeDraw {
    
    public class SystemIconPack : NSObject {
        
        private struct Cache {
            static let gradient: CGGradient = CGGradient(colorsSpace: nil, colors: [UIColor.red.cgColor, UIColor.red.cgColor] as CFArray, locations: [0, 1])!
        }
        
        @objc dynamic public class var gradient: CGGradient { return Cache.gradient }
        
        @objc dynamic public class func drawClose(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)) {
            
            let context = UIGraphicsGetCurrentContext()!
            
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 100, height: 100), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 100, y: resizedFrame.height / 100)
            
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 92.02, y: 22.92))
            bezierPath.addLine(to: CGPoint(x: 64.42, y: 50.52))
            bezierPath.addLine(to: CGPoint(x: 92.02, y: 78.13))
            bezierPath.addCurve(to: CGPoint(x: 92.02, y: 92.99), controlPoint1: CGPoint(x: 96.13, y: 82.23), controlPoint2: CGPoint(x: 96.13, y: 88.89))
            bezierPath.addCurve(to: CGPoint(x: 84.59, y: 96.07), controlPoint1: CGPoint(x: 89.97, y: 95.05), controlPoint2: CGPoint(x: 87.28, y: 96.07))
            bezierPath.addCurve(to: CGPoint(x: 77.16, y: 92.99), controlPoint1: CGPoint(x: 81.9, y: 96.07), controlPoint2: CGPoint(x: 79.22, y: 95.05))
            bezierPath.addLine(to: CGPoint(x: 49.55, y: 65.38))
            bezierPath.addLine(to: CGPoint(x: 21.95, y: 92.99))
            bezierPath.addCurve(to: CGPoint(x: 14.51, y: 96.07), controlPoint1: CGPoint(x: 19.89, y: 95.05), controlPoint2: CGPoint(x: 17.2, y: 96.07))
            bezierPath.addCurve(to: CGPoint(x: 7.08, y: 92.99), controlPoint1: CGPoint(x: 11.82, y: 96.07), controlPoint2: CGPoint(x: 9.13, y: 95.05))
            bezierPath.addCurve(to: CGPoint(x: 7.08, y: 78.13), controlPoint1: CGPoint(x: 2.97, y: 88.89), controlPoint2: CGPoint(x: 2.97, y: 82.23))
            bezierPath.addLine(to: CGPoint(x: 34.69, y: 50.52))
            bezierPath.addLine(to: CGPoint(x: 7.08, y: 22.92))
            bezierPath.addCurve(to: CGPoint(x: 7.08, y: 8.04), controlPoint1: CGPoint(x: 2.97, y: 18.8), controlPoint2: CGPoint(x: 2.97, y: 12.15))
            bezierPath.addCurve(to: CGPoint(x: 21.94, y: 8.04), controlPoint1: CGPoint(x: 11.18, y: 3.94), controlPoint2: CGPoint(x: 17.84, y: 3.94))
            bezierPath.addLine(to: CGPoint(x: 49.55, y: 35.65))
            bezierPath.addLine(to: CGPoint(x: 77.16, y: 8.04))
            bezierPath.addCurve(to: CGPoint(x: 92.02, y: 8.04), controlPoint1: CGPoint(x: 81.26, y: 3.94), controlPoint2: CGPoint(x: 87.92, y: 3.94))
            bezierPath.addCurve(to: CGPoint(x: 92.02, y: 22.92), controlPoint1: CGPoint(x: 96.13, y: 12.15), controlPoint2: CGPoint(x: 96.13, y: 18.8))
            bezierPath.close()
            color.setFill()
            bezierPath.fill()
            
            context.restoreGState()
            
        }
        
        @objc(StyleKitNameResizingBehavior)
        public enum ResizingBehavior: Int {
            case aspectFit /// The content is proportionally resized to fit into the target rectangle.
            case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
            case stretch /// The content is stretched to match the entire target rectangle.
            case center /// The content is centered in the target rectangle, but it is NOT resized.
            
            public func apply(rect: CGRect, target: CGRect) -> CGRect {
                if rect == target || target == CGRect.zero {
                    return rect
                }
                
                var scales = CGSize.zero
                scales.width = abs(target.width / rect.width)
                scales.height = abs(target.height / rect.height)
                
                switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
                }
                
                var result = rect.standardized
                result.size.width *= scales.width
                result.size.height *= scales.height
                result.origin.x = target.minX + (target.width - result.width) / 2
                result.origin.y = target.minY + (target.height - result.height) / 2
                return result
            }
        }
        
        private override init() {}
    }
}
