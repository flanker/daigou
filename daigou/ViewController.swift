import UIKit

class ViewController: UIViewController {

    var salesOrders:SalesOrders = SalesOrders()
    var header: HeaderView?
    var moneyDisplayList: MoneyDisplayListView?
    var fakeView: FakeView?

    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = self.view as! UIScrollView
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        initSalesOrders()
        initHeader()
        initMoneyDisplayList(salesOrders)
        initFakeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initSalesOrders() {
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 800, amount: 1000))
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 700, amount: 1200))
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 687, amount: 1260))
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 901, amount: 1390))
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 847, amount: 1100))
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 746, amount: 1290))
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 729, amount: 1220))
        salesOrders.add(SalesOrder(saleDate: NSDate(), cost: 803, amount: 1330))
    }

    func initHeader() {
        self.header = HeaderView()
        self.view.addSubview(self.header!)
    }

    func initMoneyDisplayList(salesOrders: SalesOrders) {
        self.moneyDisplayList = MoneyDisplayListView(moneyDisplayList: MoneyDisplay.fromSalesOrders(salesOrders))
        self.view.addSubview(self.moneyDisplayList!)
    }

    func initFakeView() {
        self.fakeView = FakeView()
        self.view.addSubview(self.fakeView!)
    }

    override func viewWillLayoutSubviews() {
        self.header!.frame = CGRectMake(0, 0, self.view.frame.width, self.header!.frame.height)
        self.moneyDisplayList!.frame = CGRectMake(0, self.header!.frame.height, self.view.frame.width, self.moneyDisplayList!.frame.height)
        self.fakeView!.frame = CGRectMake(0, self.header!.frame.height + self.moneyDisplayList!.frame.height, self.view.frame.width, self.fakeView!.frame.height)
        (self.view as! UIScrollView).contentSize.height = self.header!.frame.height +  self.moneyDisplayList!.frame.height + self.fakeView!.frame.height
    }

}
