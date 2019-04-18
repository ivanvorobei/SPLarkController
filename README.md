<img src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Banner.svg"/>

This controller help you implement setting screen easy. You can add both buttons and switches. The amount cells is not limited.

Preview GIF is loading `3mb`. Please, wait.

<img src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Preview.gif" width="440">

If you want to buy source code of the app from preview, please go to [xcode-shop.com](https://xcode-shop.com). Price for GitHub users - $300. `With copyright - $4.900`. Also you can see [detailed preview](https://xcode-shop.com/assets/preview/code.mov) with all the features and screens of the application.

<img src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Shop.svg"/>

I have a store where I sell applications and modules for Xcode projects. You can find source codes of applications or custom animations / UI. I regularly update the code. Visit my website to see all items for sale: [xcode-shop.com](https://xcode-shop.com). On the website you can find previews and for some items links to AppStore.

<img src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Shop.svg"/>

## Requirements
Swift 4.2 & 5.0. Ready for use on iOS 10+

## Installation

#### CocoaPods:

You can use [CocoaPods](http://cocoapods.org/) to install `SPLarkController` by adding it to your `Podfile`:

```ruby
pod 'SPLarkController'
```

#### Manually

Put `Source/SPLarkController` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## How to use

Create controller and call func `presentAsLark`:

```swift
import UIKit
import SPLarkController

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let controller = UIViewController()
        self.presentAsLark(controller)
    }
}
```

If you want customize controller (set custom height and other), create controller and set `transitioningDelegate` to `SPLarkTransitioningDelegate` object. Use `present` or `dismiss` functions:

```swift
let controller = UIViewController()
let transitionDelegate = SPLarkTransitioningDelegate()
controller.transitioningDelegate = transitionDelegate
controller.modalPresentationStyle = .custom
controller.modalPresentationCapturesStatusBarAppearance = true
self.present(controller, animated: true, completion: nil)
```

Please, do not init `SPLarkTransitioningDelegate` like this:

```swift
controller.transitioningDelegate = SPLarkTransitioningDelegate()
```

You will get an error about weak property.

### Parameters

- Parameter `customHeight` sets custom height for modal controller. Default is `nil`:
```swift
transitionDelegate.customHeight = 350
```

### Snapshots

The project uses a snapshot of the screen in order to avoid compatibility and customization issues. Before controller presentation, a snapshot of the parent view is made, and size and position are changed for the snapshot. Sometimes you will need to update the screenshot of the parent view, for that use static func:

```swift
SPLarkController.updatePresentingController(modal: controller)
```

and pass the controller, which is modal and uses `SPLarkTransitioningDelegate`

### Modal presentation of different controller

If you want to present modal controller on SPLarkController, please set:

```swift
controller.modalPresentationStyle = .custom
```

It’s needed for correct presentation and dismissal of all modal controllers.

## My projects

Here I would like to offer you my other projects.

### SPStorkController
I created [SPStorkController](https://github.com/IvanVorobei/SPStorkController). It is a modal controller like in Mail or Apple Music application. Similar animation and transition. You can see an example of using controller in app [in AppStore](https://itunes.apple.com/app/id1446635818).

<img src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="440">

You can buy source code of this app on [xcode-shop.com](https://xcode-shop.com). Price - $200. You can download app [from AppStore](https://itunes.apple.com/app/id1446635818) or see [detailed preview](https://xcode-shop.com/assets/preview/debts.mov). 

### SPPermission
Project [SPPermission](https://github.com/IvanVorobei/SPPermission) for managing permissions with customizable visual effects. Beautiful dialog increases the chance of approval (which is important when we request notification). Simple control of this module saves you hours of development. You can start using project with just two lines of code and easy customization!

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="500">

## License
`SPLarkController` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by. I develop iOS apps and create designs, too. I use `swift` for development. To request more functionality, you should create a new issue.
