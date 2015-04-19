import UIKit
import Foundation

class FakeView : UIView {

    var paddingView : UIView = UIView()
    var dateView : UIImageView = UIImageView()
    var chartView : UIImageView = UIImageView()
    var detailsView : UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: CGRectZero)
        setup()
        self.frame.size.height =  self.paddingView.frame.height + self.dateView.frame.height + self.chartView.frame.size.height + self.detailsView.frame.size.height
    }

    func setup() {
        createPadding()
        createDate()
        createChart()
        createDetails()
    }

    func createPadding() {
        self.paddingView.frame.size.height = 20
        self.addSubview(paddingView)
    }

    func createDate() {
        self.dateView.image = UIImage(named: "date")
        self.dateView.frame.size.height = 100
        self.dateView.contentMode = UIViewContentMode.Center
        self.addSubview(dateView)
    }

    func createChart() {
        self.chartView.image = UIImage(named: "chart")
        self.chartView.frame.size.height = 190
        self.chartView.contentMode = UIViewContentMode.Center
        self.addSubview(chartView)
    }

    func createDetails() {
        self.detailsView.image = UIImage(named: "details")
        self.detailsView.frame.size.height = 140
        self.detailsView.contentMode = UIViewContentMode.Center
        self.addSubview(detailsView)
    }

    override func layoutSubviews() {
        self.paddingView.frame = CGRectMake(0, 0, self.frame.width, self.paddingView.frame.size.height)
        self.dateView.frame = CGRectMake(0, self.paddingView.frame.size.height, self.frame.width, self.dateView.frame.size.height)
        self.chartView.frame = CGRectMake(0, self.paddingView.frame.size.height + dateView.frame.size.height, self.frame.width, self.chartView.frame.size.height)
        self.detailsView.frame = CGRectMake(0, self.paddingView.frame.size.height + dateView.frame.size.height + self.chartView.frame.size.height, self.frame.width, self.detailsView.frame.size.height)
    }
}
