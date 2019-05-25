# SPLarkController

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Preview.gif" width="440"/>
</p>

<p><h3>About</h3>
Make <b>settings screen</b> for application. You can add <b>buttons and switches</b>. The amount cells is not limited. You can start using project with just two lines of code and easy customisation.<br>
For implement settings as in preiew, see section <a href="https://github.com/IvanVorobei/SPLarkController#settings-controller">Settings Controller</a>. If you want to <b>buy source code</b> of app from preview, please, go to <a href="https://xcode-shop.com" target="_blank">xcode-shop.com</a>
<br><br>
You can download example app <a href="https://itunes.apple.com/app/id1453325619" target="_blank">Code - Learn Swift & Design</a> from AppStore.
<br><br>
If you like the project, do not forget to <b>put star ★</b> or donate:<br>

[![Patron](https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Patron%20Button.svg)](https://patreon.com/ivanvorobei)

See project's backers in <a href="https://github.com/IvanVorobei/SPLarkController#sponsors">Sponsors</a> section.</p>

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
    - [Presenting](#presenting)
    - [Custom Height](#custom-height)
    - [Settings Controller](#settings-controller)
    - [Snapshots](#snapshots)
- [Sponsors](#sponsors)
- [Other Projects (+gif)](#my-projects)
    - [SPStorkController](#spstorkcontroller)
    - [SPAlert](#spalert)
    - [SPPermission](#sppermission)
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

## Sponsors

Support me with a monthly donation and help me continue activities: [Become a sponsors](https://www.patreon.com/ivanvorobei)

<a href="https://github.com/zubara21/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/zubara21.jpg" width="100"></a>
<a href="https://github.com/sparrowganz/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/sparrowganz.jpg" width="100"></a>

## My projects

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="220"/>
</p>

### SPStorkController

<p><a href="https://github.com/IvanVorobei/SPStorkController" target="_blank">SPStorkController</a> is transition controller <b>as in Apple Music, Podcasts and Mail</b> apps. Customizable height. Simple adding close button and centering arrow indicator. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example <a href="https://itunes.apple.com/app/id1446635818">Debts - Spending tracker</a> app from AppStore.<br><br>
Alert you can find in <a href="https://github.com/IvanVorobei/SPAlert">SPAlert</a> project. If you want to <b>buy source code</b> of app in preview, please, go to <a href="https://xcode-shop.com">xcode-shop.com</a>.</p>

---

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="220"/>
</p>

### SPAlert

<p><a href="https://github.com/IvanVorobei/SPAlert" target="_blank">SPAlert</a> is <b>popup from Apple Music & Feedback in AppStore</b>. Contains `Done` & `Heart` presets. `Done` preset present with animation. I clone Apple's alerts as much as possible. You can find this alerts in AppStore after feedback, after added song to library in Apple Music. I am also add alert without icon, as simple message.
<br><br>
You can download example <a href="https://itunes.apple.com/app/id1446635818">Debts - Spending tracker</a> app from AppStore. If you want to <b>buy source code</b> of app in preview, please, go to <a href="https://xcode-shop.com">xcode-shop.com</a>.</p>

---

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="220"/>
</p>

### SPPermission

<p><a href="https://github.com/IvanVorobei/SPPermission" target="_blank">SPPermission</a> allow request permissions <b>with native dialog</b> UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation.
<br><br>
If your app uses SPPermission, write me. I am adding you app as example of usage.

## License
`SPLarkController` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by or via [telegram](https://t.me/ivanvorobei). I develop iOS apps and designs. I use `swift` for development. To request more functionality, you should create a new issue. You can see my [apps in AppStore](https://itunes.apple.com/developer/id1446635817).
