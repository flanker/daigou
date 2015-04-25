import UIKit

class HomeViewController: UIViewController {

    var salesOrders: SalesOrders = SalesOrders()
    var scrollView: ScrollBoxesView = ScrollBoxesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initSalesOrders()

        initSelf()
        initScrollView()
        initMoneyDisplayList(salesOrders)
        initFakeView()
        initHomeTable()
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
        let moneyDisplayList = MoneyDisplayListView(moneyDisplayList: MoneyDisplay.fromSalesOrders(salesOrders))
        self.scrollView.addSubview(moneyDisplayList)
    }

    func initFakeView() {
        let fakeView = FakeView()
        self.scrollView.addSubview(fakeView)
    }

    func initHomeTable() {
        let homeTableController = HomeTableController(salesOrders: salesOrders)
        self.addChildViewController(homeTableController)
        self.scrollView.addSubview(self.childViewControllers.first!.view!!)
        self.childViewControllers.first!.didMoveToParentViewController(self)
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = true
    }

}
