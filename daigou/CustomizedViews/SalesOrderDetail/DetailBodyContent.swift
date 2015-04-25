import UIKit
import Foundation

class Line: UIView {
    var line: UIView = UIView()

    convenience init() {
        self.init(frame: CGRectZero)
        setup()
    }

    func setup() {
        self.backgroundColor = Color.white
        self.frame.size.height = 20
        line.backgroundColor = Color.gray
        self.addSubview(line)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let leftOffset = CGFloat(20)
        let width = self.frame.width - 40
        line.frame = CGRectMake(leftOffset, 10, width, 1)
    }
}

class BodyContentLable : UILabel {
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
}

class DetailBodyContentView : BoxesView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(salesOrder: SalesOrder) {
        self.init()
        self.backgroundColor = Color.white
        let large:CGFloat = 22
        let medium:CGFloat = 18
        let small:CGFloat = 14
        createSpace(30)
        createLable("2015 年 4 月 12 日", fontSize: small)
        createLine()
        createLable("李大雷", fontSize: medium)
        createLable("138 3456 7654", fontSize: small)
        createLine()
        createLable("陕西省 西安市", fontSize: small)
        createLable("雁塔区长安北路123号招商大厦A楼103室", fontSize: small)
        createLine()
        createLable("收入：                ￥1500", fontSize: large)
        createLable("爱他美三段   x 3     $20.95     $124.20", fontSize: small)
        createLable("爱他美四段   x 3     $19.95     $103.78", fontSize: small)
        createLable("邮费                                         $65.20", fontSize: small)
        createLable("                                 合计：   $228.35", fontSize: small)
        createLine()
    }

    func createLable(text: String, fontSize: CGFloat) {
        let label = BodyContentLable()
        label.font = UIFont(name: label.font.fontName, size: fontSize)
        label.textAlignment = NSTextAlignment.Left
        label.textColor = Color.blue
        label.text = text
        label.frame.size.height = fontSize + CGFloat(10)
        self.addSubview(label)
    }

    func createLine() {
        self.addSubview(Line())
    }

    func createSpace(height: CGFloat) {
        let view = UIView()
        view.frame.size.height = height
        self.addSubview(view)
    }

}
