import UIKit
import Foundation

class HomeTableController : UITableViewController {

    var salesOrders: SalesOrders?

    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    override init!(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(salesOrders: SalesOrders) {
        self.init(style: UITableViewStyle.Plain)
        self.salesOrders = salesOrders
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let view = self.view as! UITableView
        let index = view.indexPathForSelectedRow()
        if (index != nil) {
            view.deselectRowAtIndexPath(index!, animated: animated)
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return self.salesOrders!.count()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return HomeTableCell(salesOrder: salesOrders![indexPath.row])
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DetailViewController(salesOrder: salesOrders![indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.5
    }


}
