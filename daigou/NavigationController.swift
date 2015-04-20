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
        setupNavigationBar()
        setupSolidStatusBar()
    }

    func setupNavigationBar() {
        self.setNavigationBarHidden(false, animated: true)
        self.hidesBarsOnSwipe = true
        self.navigationBar.barTintColor = Color.blue
        self.navigationBar.tintColor = Color.white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color.white]
        self.navigationBar.translucent = false
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
    }

    func setupSolidStatusBar() {
        let statusFrame = CGRectMake(0, 0, self.view.bounds.size.width, UIApplication.sharedApplication().statusBarFrame.size.height)
        var statusBar = UIView(frame: statusFrame)
        statusBar.backgroundColor = Color.blue
        self.view.addSubview(statusBar)
    }

}
