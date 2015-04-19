import UIKit
import Foundation

class NavigationController : UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        self.setNavigationBarHidden(false, animated: true)
        self.hidesBarsOnSwipe = true
        setupNavigationBar()
    }

    func setupNavigationBar() {
        self.navigationBar.barTintColor = Color.blue
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color.white]
        self.navigationBar.translucent = false
    }

}
