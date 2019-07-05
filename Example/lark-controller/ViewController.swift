import UIKit

class ViewController: UIViewController {
    
    var button = UIButton.init(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.button.setTitle("Open Controller", for: .normal)
        self.view.addSubview(self.button)
        self.button.sizeToFit()
        self.button.center.x = self.view.frame.width / 2
        self.button.frame.origin.y = 100
        self.button.addTarget(self, action: #selector(self.presentLarkController), for: .touchUpInside)
    }
    
    @objc func presentLarkController() {
        let controller = DetailController()
        let transitionDelegate = SPLarkTransitioningDelegate()
        transitionDelegate.customHeight = 300
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .custom
        controller.modalPresentationCapturesStatusBarAppearance = true
        self.present(controller, animated: true, completion: nil)
    }
}

class DetailController: UIViewController {
    
    var button = UIButton.init(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.button.setTitle("Change height", for: .normal)
        self.view.addSubview(self.button)
        self.button.sizeToFit()
        self.button.center.x = self.view.frame.width / 2
        self.button.frame.origin.y = 100
        self.button.addTarget(self, action: #selector(self.changeHeight), for: .touchUpInside)
    }
    
    @objc func changeHeight() {
        if let presentationController = self.presentationController as? SPLarkPresentationController {
            if self.view.frame.height == 300 {
                presentationController.updateHeight(600)
            } else {
                presentationController.updateHeight(300)
            }
        }
    }
}

