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

@available(iOS 8.2, *)
open class SPLarkSettingsController: UIViewController {
    
    public let titleLabel = UILabel()
    let closeButton = SPLarkSettingsCloseButton()
    let collectionView = SPLarkSettingsCollectionView()
    
    override open var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return .slide }
    
    open func settingsCount() -> Int {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    open func settingTitle(index: Int, highlighted: Bool) -> String {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    open func settingSubtitle(index: Int, highlighted: Bool) -> String? {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    open func settingHighlighted(index: Int) -> Bool {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    open func settingColorHighlighted(index: Int) -> UIColor {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    open func settingDidSelect(index: Int, completion: @escaping () -> ()) {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    open func reload(index: Int) {
        self.collectionView.reloadItems(at: [IndexPath.init(row: index, section: 0)])
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "Settings"
        self.titleLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        self.titleLabel.textAlignment = .left
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.numberOfLines = 0
        self.view.addSubview(self.titleLabel)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(self.collectionView)
        
        self.closeButton.sizeToFit()
        self.closeButton.addTarget(self, action: #selector(self.tapCloseButton), for: .touchUpInside)
        self.view.addSubview(self.closeButton)
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.titleLabel.sizeToFit()
        self.titleLabel.frame = CGRect.init(x: 27, y: 40, width: self.view.frame.width - 27 * 2, height: self.titleLabel.frame.height)
        self.collectionView.layout(y: self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 24)
        self.closeButton.layout(bottomX: self.view.frame.width - 19, y: 19)
    }
    
    @objc func tapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

@available(iOS 8.2, *)
extension SPLarkSettingsController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.collectionView:
            return self.settingsCount()
        default:
            return 0
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.collectionView:
            let cell = self.collectionView.dequeueCell(indexPath: indexPath)
            let highlighted = self.settingHighlighted(index: indexPath.row)
            cell.titleLabel.text = self.settingTitle(index: indexPath.row, highlighted: highlighted)
            cell.subtitleLabel.text = self.settingSubtitle(index: indexPath.row, highlighted: highlighted)
            cell.setHighlighted(
                highlighted,
                color: highlighted ? self.settingColorHighlighted(index: indexPath.row) : UIColor.white.withAlphaComponent(0.1)
            )
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SPLarkSettingsCollectionViewCell {
            self.settingDidSelect(index: indexPath.row) {
                let highlighted = self.settingHighlighted(index: indexPath.row)
                cell.titleLabel.text = self.settingTitle(index: indexPath.row, highlighted: highlighted)
                cell.subtitleLabel.text = self.settingSubtitle(index: indexPath.row, highlighted: highlighted)
                cell.setHighlighted(
                    highlighted,
                    color: highlighted ? self.settingColorHighlighted(index: indexPath.row) : UIColor.white.withAlphaComponent(0.1)
                )
            }
        }
    }
}
