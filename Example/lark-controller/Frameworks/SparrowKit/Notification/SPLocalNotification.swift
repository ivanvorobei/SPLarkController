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
import UserNotifications

struct SPLocalNotification {
    
    var identificator: String? = nil
    var text: String
    var title: String? = nil
    var badge: Int = 0
    var timeInterval: TimeInterval
    var soundEnabled: Bool = true
    var category: SPLocalNotificationCategory? = nil
    
    init(after timeInterval: TimeInterval, text: String) {
        self.text = text
        self.timeInterval = timeInterval
    }
    
    func add() {
        let identificator = self.identificator ?? "\(self.timeInterval)\(self.text)\(Int.random(min: 0, max: 1000))"
        
        let notification = UNNotificationRequest(
            identifier: identificator,
            content: self.content,
            trigger: self.trigger
        )
        
        let center = UNUserNotificationCenter.current()
        center.add(notification) { (error) in
            if let error = error {
                print("SPLocalNotification - \(error)")
            }
        }
    }
    
    private var content: UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.body = self.text
        content.title = self.title ?? ""
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + self.badge)
        content.sound = self.soundEnabled ? UNNotificationSound.default : nil
        
        if let category = self.category {
            if #available(iOS 12.0, *) {
                let notificationCategory = UNNotificationCategory(identifier: category.identifier, actions: [], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: nil, categorySummaryFormat: category.summary, options: [])
                UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
                content.categoryIdentifier = notificationCategory.identifier
            }
        }
        
        return content
    }
    
    private var trigger: UNTimeIntervalNotificationTrigger {
        return UNTimeIntervalNotificationTrigger(timeInterval: self.timeInterval, repeats: false)
    }
}

struct SPLocalNotificationCategory {
    
    var identifier: String
    var summary: String
    
    var countSymbol: String {
        return "%u"
    }
}
