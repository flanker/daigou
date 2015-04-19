import UIKit

class ViewController: UIViewController {

    var salesOrders:SalesOrders = SalesOrders()

    var scrollView: UIScrollView = UIScrollView()
    var moneyDisplayList: MoneyDisplayListView?
    var fakeView: FakeView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initSalesOrders()

        initSelf()
        initScrollView()
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

    func initSelf() {
        self.title = "代购宝"

        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true

        let backButton = UIButton()
        backButton.frame = CGRectMake(0, 10, 20, 20)
        backButton.setImage(UIImage(named: "menu")!, forState: UIControlState.Normal)

        var leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: false)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    func initScrollView() {
        self.scrollView.frame = self.view.frame
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(self.scrollView)
    }

    func initMoneyDisplayList(salesOrders: SalesOrders) {
        self.moneyDisplayList = MoneyDisplayListView(moneyDisplayList: MoneyDisplay.fromSalesOrders(salesOrders))
        self.scrollView.addSubview(self.moneyDisplayList!)
    }

    func initFakeView() {
        self.fakeView = FakeView()
        self.scrollView.addSubview(self.fakeView!)
    }

    override func viewWillLayoutSubviews() {
        self.moneyDisplayList!.frame = CGRectMake(0, 0, self.view.frame.width, self.moneyDisplayList!.frame.height)
        self.fakeView!.frame = CGRectMake(0, self.moneyDisplayList!.frame.height, self.view.frame.width, self.fakeView!.frame.height)
        self.scrollView.contentSize.height = self.moneyDisplayList!.frame.height + self.fakeView!.frame.height
    }

}
