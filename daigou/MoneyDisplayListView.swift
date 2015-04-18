import UIKit
import Foundation

class MoneyDisplayListView : UIView {

    var moneyDisplayList: [MoneyDisplay] = [MoneyDisplay]()

    var moneyDisplayViewList: [MoneyDisplayView] = [MoneyDisplayView]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(moneyDisplayList: [MoneyDisplay]) {
        self.init()
        self.moneyDisplayList = moneyDisplayList
        setup()

        var totalHeight = moneyDisplayViewList.reduce(0) { $0 + $1.frame.height }
        self.frame.size.height = totalHeight
    }

    func setup() {
        for(index, moneyDisplay) in enumerate(moneyDisplayList) {
            createMoneyDisplay(moneyDisplay.amountText, description: moneyDisplay.description)
        }
    }

    func createMoneyDisplay(amountText: String, description: String) {
        var moneyDisplayView = MoneyDisplayView(description: description, amountText: amountText)
        self.moneyDisplayViewList.append(moneyDisplayView)
        self.addSubview(moneyDisplayView)
    }

    override func layoutSubviews() {
        var totalHeight: CGFloat = 0
        for(index, moneyDisplayView) in enumerate(moneyDisplayViewList) {
            moneyDisplayView.frame = CGRectMake(0, CGFloat(moneyDisplayView.frame.height * CGFloat(index)), self.frame.width, moneyDisplayView.frame.height)
            totalHeight = totalHeight + moneyDisplayView.frame.height
        }
    }

}
