import UIKit
import Foundation

class DetailViewController: UIViewController {

    var salesOrder: SalesOrder?
    var salesOrderView: DetailView?

    convenience init(salesOrder: SalesOrder) {
        self.init()
        self.salesOrder = salesOrder
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initSelf()
    }

    func initSelf() {
        self.title = "代购宝详细"
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        salesOrderView = DetailView(salesOrder: salesOrder!)
        self.view.addSubview(salesOrderView!)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        salesOrderView!.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    }

}
