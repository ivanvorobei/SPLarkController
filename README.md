# SPLarkController

<a href="https://itunes.apple.com/app/id1453325619" target="_blank"><img align="left" src="https://github.com/ivanvorobei/SPLarkController/blob/master/Resources/Preview.gif" width="360"/></a>

### About
Transition between controllers to top. You can change animatable height after presentation controller. 

For presentation and dismissing using custom transition delegate. 

You can set any content to bottom controller, like buttons or even collection as in preview.
For implement settings as in preiew, see section [Settings Controller](https://github.com/ivanvorobei/SPLarkController#settings-controller).

If you like the project, don't forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/Readme/blob/main/Buttons/follow-me-ivanvorobei.svg)](https://github.com/ivanvorobei)

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
    - [Presenting](#presenting)
    - [Height](#height)
    - [Change height after presentation](#change-height)
    - [Settings Controller](#settings-controller)
    - [Snapshots](#snapshots)
- [Other Projects](#other-projects)
- [Russian Community](#russian-community)

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

## Other Projects

#### [SPAlert](https://github.com/ivanvorobei/SPAlert)
You can find this alerts in AppStore after feedback or after added song to library in Apple Music. Contains popular Done, Heart presets and many other. Done preset present with draw path animation like original. Also available simple present message without icon. Usage in one line code.

#### [SPPerspective](https://github.com/ivanvorobei/SPPerspective)
Animation of widgets from iOS 14. 3D transform with dynamic shadow. Look [video preview](https://ivanvorobei.by/github/spperspective/video-preview). Available deep customisation 3D and shadow. Also you can use static transform without animation.

#### [SPPermissions](https://github.com/ivanvorobei/SPPermissions)
Using for request and check state of permissions. Available native UI for request multiple permissions at the same time. Simple integration and usage like 2 lines code.

#### [SPDiffable](https://github.com/ivanvorobei/SPDiffable)
Simplifies working with animated changes in table and collections. Apple's diffable API required models for each object type. If you want use it in many place, you pass time to implement it and get over duplicates codes. This project help do it elegant with shared models and special cell providers. Support side bar iOS14 and already has native cell providers and views.

#### [SparrowKit](https://github.com/ivanvorobei/SparrowKit)
Collection of native Swift extensions to boost your development. Support tvOS and watchOS.

#### [Telegram Stikers](https://sparrowcode.by/telegram/stickers)
You can import stikers for Telegram about iOS Development. Stickers with Xcode elements you know.

## Russian Community

В телеграм-канале [Код Воробья](https://sparrowcode.by/telegram) пишу о iOS разработке. Видео-туториалы выклыдываю на [YouTube](https://sparrowcode.by/youtube):

[![Tutorials on YouTube](https://cdn.ivanvorobei.by/github/readme/youtube-preview.jpg)](https://sparrowcode.by/youtube)

[Стикеры в телеграм](https://sparrowcode.by/telegram/stickers) про iOS разработку:

[![Telegram Stikers](https://cdn.ivanvorobei.by/github/readme/telegram-stikers-preview.png)](https://sparrowcode.by/telegram/stickers)
