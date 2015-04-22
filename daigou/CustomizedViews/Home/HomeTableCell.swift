import UIKit
import Foundation

class HomeTableCell : UITableViewCell {

    var salesOrder: SalesOrder?

    var dateLabel: UILabel?
    var costKeyLabel: UILabel?
    var costValueLabel: UILabel?
    var amountKeyLabel: UILabel?
    var amountValueLabel: UILabel?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(salesOrder: SalesOrder) {
        self.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        self.salesOrder = salesOrder
        setup()
    }

    func setup() {
        self.dateLabel = createDate()
        self.costKeyLabel = createMoneyKey("成本: ")
        self.costValueLabel = createMoneyValue(self.salesOrder!.cost.toString())
        self.amountKeyLabel = createMoneyKey("收入: ")
        self.amountValueLabel = createMoneyValue(self.salesOrder!.amount.toString())
        setupContent()
    }

    func setupContent() {
        self.contentView.addSubview(self.dateLabel!)
        self.contentView.addSubview(self.costKeyLabel!)
        self.contentView.addSubview(self.costValueLabel!)
        self.contentView.addSubview(self.amountKeyLabel!)
        self.contentView.addSubview(self.amountValueLabel!)
    }

    func createDate() -> UILabel {
        let label = UILabel()
        label.text = self.salesOrder!.saleDate.toString()
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = Color.darkBlue
        return label
    }

    func createMoneyKey(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = Color.gray
        return label
    }

    func createMoneyValue(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFontOfSize(16)
        label.textColor = Color.darkBlue
        return label
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.height = 50
        self.contentView.frame.size.height = 50

        let heightFirstLine: CGFloat = 20
        let heightSecondLine: CGFloat = 30
        self.dateLabel?.frame = CGRectMake(20, 5, 100, heightFirstLine)
        self.costKeyLabel?.frame = CGRectMake(20, heightFirstLine, 30, heightSecondLine)
        self.costValueLabel?.frame = CGRectMake(50, heightFirstLine, 120, heightSecondLine)
        self.amountKeyLabel?.frame = CGRectMake(170, heightFirstLine, 30, heightSecondLine)
        self.amountValueLabel?.frame = CGRectMake(200, heightFirstLine, 120, heightSecondLine)
    }

}
