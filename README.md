# SPLarkController

<a href="https://itunes.apple.com/app/id1453325619" target="_blank"><img align="left" src="https://github.com/ivanvorobei/SPLarkController/blob/master/Resources/Preview.gif" width="440"/></a>

### About
Transition between controllers to top. You can change animatable height after presentation controller. For implement settings as in preiew, see section [Settings Controller](https://github.com/ivanvorobei/SPLarkController#settings-controller).

You can download example app [Code - Learn Swift & Design](https://itunes.apple.com/app/id1453325619) from AppStore. For **buy source code** of app in preview, go to:

[![xcode-shop.com](https://github.com/ivanvorobei/SPPermissions/blob/master/Assets/Buttons/xcode-shop.svg)](https://xcode-shop.com)

If you like the project, do not forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/SPPermissions/blob/master/Assets/Buttons/follow-me-on-github.svg)](https://github.com/ivanvorobei)

See project's backers in [Sponsors](https://github.com/ivanvorobei/SPLarkController#sponsors) section.

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
    - [Presenting](#presenting)
    - [Height](#height)
    - [Change height after presentation](#change-height)
    - [Settings Controller](#settings-controller)
    - [Snapshots](#snapshots)
- [Sponsors](#sponsors)
- [Other Projects (+gif)](#my-projects)
    - [SPStorkController](#spstorkcontroller)
    - [SPAlert](#spalert)
    - [SPPermission](#sppermission)
    - [Awesome iOS UI](https://github.com/ivanvorobei/awesome-ios-ui)
- [License](#license)

## Requirements

Swift `4.2` & `5.0`. Ready for use on iOS 10+

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

### Height

Parameter `customHeight` sets custom height for modal controller. Default is `nil`:

```swift
transitionDelegate.customHeight = 350
```

### Change Height

For change height after presenting use with code:

```swift
if let presentationController = self.presentationController as? SPLarkPresentationController {
    presentationController.updateHeight(600)
}
```

You can see how it work in `Example` folder. I am plase ready-use project.

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

## Sponsors

Support me with a monthly donation and help me continue activities. After payment I add you to list of sponsor **in my all projects** with link to your profile. [Become a sponsors](https://www.patreon.com/ivanvorobei)

<a href="https://github.com/zubara21/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/zubara21.jpg" width="100"></a>
<a href="https://github.com/sparrowganz/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/sparrowganz.jpg" width="100"></a>
<a href="https://github.com/shatk0vskiy/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/shatk0vskiy.jpg" width="100"></a>
<a href="https://www.patreon.com/ivanvorobei" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/add.jpg" width="100"></a>

## My projects

<img align="left" src="https://github.com/ivanvorobei/SPStorkController/blob/master/Resources/Preview.gif" width="220"/>

### SPStorkController

[SPStorkController](https://github.com/ivanvorobei/SPStorkController) is сontroller **as in Apple Music, Podcasts and Mail** apps. Simple adding close button and centering arrow indicator. Customizable height. Using custom TransitionDelegate. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.

Alert you can find in [SPAlert](https://github.com/ivanvorobei/SPAlert) project. If you want to **buy source code** of app in preview, please, go to [xcode-shop.com](https://xcode-shop.com)

---

<img align="left" src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20Done.gif" width="220"/>

### SPAlert

[SPAlert](https://github.com/ivanvorobei/SPAlert) is **popup from Apple Music & Feedback in AppStore**. Contains `Done` & `Heart` presets. `Done` present with draw path animation. I clone Apple's alerts as much as possible.  
You can find this alerts in AppStore after feedback, after added song to library in Apple Music. I am also add alert without icon, as simple message.

You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore. If you want to **buy source code** of app in preview, please, go to [xcode-shop.com](https://xcode-shop.com).

---

<img align="left" src="https://github.com/ivanvorobei/SPPermissions/blob/master/Assets/Readme/Preview%20-%205.0.jpg" width="220"/>

### SPPermission

[SPPermission](https://github.com/ivanvorobei/SPPermissions) allow request permissions **with native dialog** UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation.

You can buy example Dialog & Dinamic animations in [xcode-shop.com](https://xcode-shop.com/ui-elements), see [preview](https://xcode-shop.com/assets/preview/dinamic-alert.mov).


## License

`SPLarkController` is released under the MIT license. Check `LICENSE.md` for details.
