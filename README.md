# SPLarkController

<a href="https://github.com/Ramotion/animated-tab-bar">
<img align="left" src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Preview.gif" width="440"/></a>

<p><h2>About</h2></p>
<p>Make <b>settings screen</b> for application. You can add <b>buttons and switches</b>. The amount cells is not limited. You can start using project with just two lines of code and easy customisation. For implement settings as in preiew, see section <a href="https://github.com/IvanVorobei/SPLarkController#settings-controller">Settings Controller</a>. If you want to <b>buy source code</b> of app from preview, please, go to <a href="https://xcode-shop.com">xcode-shop.com</a>
<br><br>
You can download example app <a href="https://itunes.apple.com/app/id1453325619">Code - Learn Swift & Design</a> from AppStore. If you like the project, do not forget to <b>put star ★</b> or donate:

[![Patron](https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Patron%20Button.svg)](https://patreon.com/ivanvorobei)
</p><br><br>

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
    - [Presenting](#presenting)
    - [Custom Height](#custom-height)
    - [Settings Controller](#settings-controller)
    - [Snapshots](#snapshots)
- [Other Projects (+gif)](#my-projects)
    - [SPStorkController](#spstorkcontroller)
    - [SPAlert](#spalert)
    - [SPPermission](#sppermission)
    - [Xcode Shop](#xcode-shop)
- [License](#license)
- [Contact or Order Develop](#contact)

## Requirements

Swift 4.2 & **5.0**. Ready for use on iOS 10+

## Installation

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPLarkController` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPLarkController'
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate `SPLarkController` into your project manually. Put `Source/SPLarkController` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## Usage

### Presenting

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

### Custom Height

Parameter `customHeight` sets custom height for modal controller. Default is `nil`:

```swift
transitionDelegate.customHeight = 350
```

### Settings Controller

You can simple implement settings controller as in preview. You need extend from `SPLarkSettingsController` and implement all methods for it. See class for more details.

```swift
class SettingsController: SPLarkSettingsController {}
```

### Snapshots

The project uses a snapshot of the screen in order to avoid compatibility and customisation issues. Before controller presentation, a snapshot of the parent view is made, and size and position are changed for the snapshot. Sometimes you will need to update the screenshot of the parent view, for that use static func:

```swift
SPLarkController.updatePresentingController(modal: controller)
```

and pass the controller, which is modal and uses `SPLarkTransitioningDelegate`

### Modal presentation of other controller

If you want to present modal controller on SPLarkController, please set:

```swift
controller.modalPresentationStyle = .custom
```

It’s needed for correct presentation and dismissal of all modal controllers.

## My projects

### SPStorkController

[SPStorkController](https://github.com/IvanVorobei/SPStorkController) is very similar to the modal **controller displayed in Apple Music, Podcasts and Mail** apps. Customizable height of view. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.

<img src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="440">

If you want to **buy source code** of this apps, please, go to [xcode-shop.com](https://xcode-shop.com).

### SPAlert

Native popup [SPAlert](https://github.com/IvanVorobei/SPAlert) is **similar to Apple Music or Feedback in AppStore** app. Support animations. I tried to repeat Apple alert as much as possible. 

<p float="left">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="250">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Heart.gif" width="250">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Message.gif" width="250">
</p>

You can download example app [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) from AppStore. If you want to **buy source code** of example apps, please, go to [xcode-shop.com](https://xcode-shop.com).

### SPPermission

[SPPermission](https://github.com/IvanVorobei/SPPermission) allow request permissions **with native dialog** UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation. 

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="500">

### Xcode Shop

If you want **buy apps with source code**, you can visit my [xcode-shop.com](https://xcode-shop.com). Here I am sale apps, modules, 3D elements and other. In applications you can find many cool UI that will be useful for your projects. Also by buying, **you support me** and my free GitHub development.

## License
`SPLarkController` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by or via [telegram](https://t.me/ivanvorobei). I develop iOS apps and designs. I use `swift` for development. To request more functionality, you should create a new issue. You can see my [apps in AppStore](https://itunes.apple.com/developer/id1446635817).
