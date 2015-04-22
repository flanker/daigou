import UIKit
import Foundation

class DetailViewController: UIViewController {

    var salesOrder: SalesOrder?

    convenience init(salesOrder: SalesOrder) {
        self.init()
        self.salesOrder = salesOrder
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initSelf()
        initDateView()
        initAmountView()
    }

    func initSelf() {
        self.title = "代购宝详细"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // TODO: Fix these two
    func initDateView() {
        var label = UILabel(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height / 2))
        label.font = UIFont(name: label.font.fontName, size: 26)
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = Color.white
        label.textColor = Color.darkBlue

        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        label.text = formatter.stringFromDate(salesOrder!.saleDate)
        self.view.addSubview(label)
    }

    func initAmountView() {
        var label = UILabel(frame: CGRectMake(0, self.view.frame.height / 2, self.view.frame.width, self.view.frame.height / 2))
        label.font = UIFont(name: label.font.fontName, size: 26)
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = Color.white
        label.textColor = Color.darkBlue
        label.text = String(format: "￥%.2f", salesOrder!.amount)
        self.view.addSubview(label)
    }

}
