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

struct SPLayout {
    
    static func sizeWith(widthFactor: CGFloat, maxWidth: CGFloat?, heightFactor: CGFloat, maxHeight: CGFloat?, relativeSideFactor: CGFloat?, from size: CGSize) -> CGSize {
        
        var widthArea = size.width * widthFactor
        var heightArea = size.height * heightFactor
        
        if let maxWidth = maxWidth {
            widthArea.setIfMore(when: maxWidth)
        }
        
        if let maxHeight = maxHeight {
            heightArea.setIfMore(when: maxHeight)
        }
        
        var prepareWidth = widthArea
        var prepareHeight = heightArea
        
        if let relativeSideFactor = relativeSideFactor {
            prepareHeight = widthArea / relativeSideFactor
            if prepareHeight > heightArea {
                prepareHeight = heightArea
                prepareWidth = heightArea * relativeSideFactor
            }
        }
        
        return CGSize.init(width: prepareWidth, height: prepareHeight)
    }
    
    private init() {}
}
