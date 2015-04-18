import UIKit
import Foundation

class HeaderView : UIView {
    let height: CGFloat = CGFloat(60)
    var headerText: UILabel = UILabel()
    var menu: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: CGRectZero)
        self.frame.size.height = self.height
        self.backgroundColor = Color.blue
        initHeaderLabel()
        initMenuBar()
    }

    func initHeaderLabel() {
        self.headerText.font = UIFont(name: headerText.font.fontName, size: 18)
        self.headerText.textAlignment = NSTextAlignment.Center
        self.headerText.textColor = UIColor.whiteColor()
        self.headerText.text = "代购宝"
        self.addSubview(headerText)
    }

    func initMenuBar() {
        self.menu.image = UIImage(named: "menu")
        self.addSubview(menu)
    }

    override func layoutSubviews() {
        self.headerText.frame = CGRectMake(40, 20, 240, 40)
        self.menu.frame = CGRectMake(10, 30, 20, 20)
    }
}
