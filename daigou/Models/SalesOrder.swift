import Foundation

class SalesOrder {
    var saleDate: NSDate
    var amount: Float
    var cost: Float

    init(saleDate: NSDate, cost: Float, amount: Float) {
        self.saleDate = saleDate
        self.cost = cost
        self.amount = amount
    }

    func description() -> String {
        return String(format: saleDate.toString() + " - 收入：￥%.2f", amount)
    }

}
