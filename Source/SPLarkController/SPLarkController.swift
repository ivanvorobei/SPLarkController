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
public struct SPLarkController {
    
    static public func updatePresentingController(parent controller: UIViewController) {
        if let presentationController = controller.presentedViewController?.presentationController as? SPLarkPresentationController {
            presentationController.updatePresentingController()
        }
    }
    
    static public func updatePresentingController(modal controller: UIViewController) {
        if let presentationController = controller.presentationController as? SPLarkPresentationController {
            presentationController.updatePresentingController()
        }
    }
    
    static private func controller(for view: UIView) -> UIViewController? {
        var nextResponder = view.next
        while nextResponder != nil && !(nextResponder! is UIViewController) {
            nextResponder = nextResponder!.next
        }
        return nextResponder as? UIViewController
    }
    
    private init() {}
}
