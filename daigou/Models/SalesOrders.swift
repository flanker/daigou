import Foundation

class SalesOrders {
    var salesOrders = [SalesOrder]()

    init() {

    }

    func add(salesOrder: SalesOrder) {
        salesOrders.append(salesOrder)
    }

    func totalCost() -> Float {
        return salesOrders.reduce(0) { $0 + $1.cost }
    }

    func totalAmount() -> Float {
        return salesOrders.reduce(0) { $0 + $1.amount }
    }

    func count() -> Int {
        return salesOrders.count
    }

    subscript(index: Int) -> SalesOrder {
        get {
            return salesOrders[index]
        }
        set(newValue) {
            salesOrders[index] = newValue
        }
    }

}
