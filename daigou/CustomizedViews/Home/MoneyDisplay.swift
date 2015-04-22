import Foundation

class MoneyDisplay {

    var description : String = ""
    var amountText : String = ""

    init(description: String, amount: Float) {
        self.description = description
        self.amountText = String(format: "￥%.2f", amount)
    }

    class func fromSalesOrders(salesOrders: SalesOrders) -> [MoneyDisplay] {
        var totalCost = MoneyDisplay(description: "累计成本", amount: salesOrders.totalCost())
        var totalAmount = MoneyDisplay(description: "累计收入", amount: salesOrders.totalAmount())
        return [totalCost, totalAmount]
    }

}
