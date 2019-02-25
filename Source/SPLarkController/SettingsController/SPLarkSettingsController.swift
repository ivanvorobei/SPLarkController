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

public class SPLarkSettingsController: UIViewController {
    
    public let titleLabel = UILabel()
    let closeButton = SPLarkSettingsCloseButton()
    let collectionView = SPLarkSettingsCollectionView()
    
    override public var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return .fade }
    override public var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    public func settingsCount() -> Int {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    public func settingTitle(index: Int, highlighted: Bool) -> String {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    public func settingSubtitle(index: Int, highlighted: Bool) -> String {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    public func settingHighlighted(index: Int) -> Bool {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    public func settingColorHighlighted(index: Int) -> UIColor {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    public func settingDidSelect(index: Int, complection: @escaping () -> ()) {
        fatalError("SPLarkSettingsController - Need implement function")
    }
    
    override public func viewDidLoad() {
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
    
    override public func viewDidLayoutSubviews() {
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

extension SPLarkSettingsController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.collectionView:
            return self.settingsCount()
        default:
            return 0
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SPLarkSettingCollectionViewCell {
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
