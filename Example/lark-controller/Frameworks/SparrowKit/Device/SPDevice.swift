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

struct SPDevice {
    
    static var iphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var ipad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    struct Orientation {
        
        static var isPortrait: Bool {
            var isPortraitOrientation = true
            if UIDevice.current.orientation.isValidInterfaceOrientation {
                if UIDevice.current.orientation.isPortrait {
                    isPortraitOrientation = true
                } else {
                    isPortraitOrientation = false
                }
            } else {
                if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
                    isPortraitOrientation = true
                } else {
                    isPortraitOrientation = false
                }
            }
            return isPortraitOrientation
        }
        
        private init() {}
    }
    
    private init() {}
}

