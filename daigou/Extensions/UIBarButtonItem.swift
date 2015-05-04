import UIKit
import Foundation

extension UIBarButtonItem{
    convenience init(name: String) {
        self.init(
            image: UIImage(named: name)!,
            style: UIBarButtonItemStyle.Plain,
            target: nil,
            action: nil)
    }

    convenience init(name: String, target: AnyObject?, action: Selector) {
         self.init(
            image: UIImage(named: name)!,
            style: UIBarButtonItemStyle.Plain,
            target: target,
            action: action)
    }

}
