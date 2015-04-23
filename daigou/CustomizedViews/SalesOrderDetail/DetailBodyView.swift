import UIKit
import Foundation

class DetailBodyView : UIView {
    var content: DetailBodyContentView?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(salesOrder: SalesOrder) {
        self.init(frame: CGRectZero)
        content = DetailBodyContentView(salesOrder: salesOrder)
        self.addSubview(content!)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let leftOffset = 20 / 640 * self.frame.width
        let width = 600 / 640 * self.frame.width
        content!.frame = CGRectMake(leftOffset, 0, width, self.frame.height)
    }

}
