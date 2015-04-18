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
}
