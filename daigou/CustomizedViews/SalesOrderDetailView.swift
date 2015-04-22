import UIKit
import Foundation

class BoxesView : UIScrollView {

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
    }

}

class BodyView : UIView {
    let label: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: CGRectZero)
        setup()
    }

    func setup() {
        label.font = UIFont(name: label.font.fontName, size: 26)
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = Color.white
        label.textColor = Color.darkBlue
        label.text = "TEST"
        self.addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let leftOffset = 20 / 640 * self.frame.width
        let width = 600 / 640 * self.frame.width
        label.frame = CGRectMake(leftOffset, 0, width, self.frame.height)
    }

}

class SalesOrderDetailsView : BoxesView {

    let header = UIImageView()
    let footer = UIImageView()
    let body = BodyView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(salesOrder: SalesOrder) {
        self.init()
        self.backgroundColor = Color.gray
        header.image = UIImage(named: "page_detail_header")
        header.frame.size.height = 32.5
        body.frame.size.height = 450
        footer.image = UIImage(named: "page_detail_footer")
        footer.frame.size.height = 11
        self.addSubview(header)
        self.addSubview(body)
        self.addSubview(footer)
    }

}
