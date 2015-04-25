import UIKit
import Foundation

class ScrollBoxesView : UIScrollView {

    var views: NSMutableOrderedSet = NSMutableOrderedSet()

    override func addSubview(view: UIView) {
        super.addSubview(view)
        self.views.addObject(view)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var currentTotalHeight = CGFloat(0)
        self.views.enumerateObjectsUsingBlock { (view, index, stop) -> Void in
            (view as! UIView).frame = CGRectMake(0, currentTotalHeight, self.frame.width, view.frame.height)
            currentTotalHeight = currentTotalHeight + view.frame.height
        }
        self.contentSize.height = currentTotalHeight
    }

}
