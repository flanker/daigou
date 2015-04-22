import UIKit
import Foundation

class MoneyDisplayView : UIView {

    var selfHeight : CGFloat = CGFloat(100)

    var moneyDescriptionViewOffset : CGFloat = CGFloat(30)
    var moneyDescriptionViewHeight : CGFloat = CGFloat(20)
    var moneyTextViewOffset : CGFloat = CGFloat(50)
    var moneyTextViewHeight : CGFloat = CGFloat(50)

    var moneyText : String = ""
    var moneyDescription : String = ""

    var moneyTextView : UILabel = UILabel()
    var moneyDescriptionView : UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(description: String, amount: Float) {
        self.init(description: description, amountText: amount.toString())
    }

    convenience init(description: String, amountText: String) {
        self.init()
        self.moneyText = amountText
        self.moneyDescription = description
        setup()
    }

    func setup() {
        setupMoneyDescription()
        setupMoneyText()
        self.frame.size.height = self.selfHeight
    }

    func setupMoneyDescription() {
        self.moneyDescriptionView.font = UIFont(name: self.moneyDescriptionView.font.fontName, size: 14)
        self.moneyDescriptionView.textAlignment = NSTextAlignment.Center
        self.moneyDescriptionView.backgroundColor = Color.white
        self.moneyDescriptionView.textColor = Color.darkBlue
        self.moneyDescriptionView.text = self.moneyDescription
        self.addSubview(self.moneyDescriptionView)
    }

    func setupMoneyText() {
        self.moneyTextView.font = UIFont(name: self.moneyTextView.font.fontName, size: 36)
        self.moneyTextView.textAlignment = NSTextAlignment.Center
        self.moneyTextView.backgroundColor = Color.white
        self.moneyTextView.textColor = Color.blue
        self.moneyTextView.text = self.moneyText
        self.addSubview(self.moneyTextView)
    }

    override func layoutSubviews() {
        self.moneyDescriptionView.frame = CGRectMake(0, self.moneyDescriptionViewOffset, self.frame.width, self.moneyDescriptionViewHeight)
        self.moneyTextView.frame = CGRectMake(0, self.moneyTextViewOffset, self.frame.width, self.moneyTextViewHeight)
    }

}
