import UIKit
import Foundation

class DetailView : BoxesView {

    let header = UIImageView()
    let footer = UIImageView()
    var body: DetailBodyView?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(salesOrder: SalesOrder) {
        self.init()
        self.backgroundColor = Color.gray
        header.image = UIImage(named: "page_detail_header")
        header.frame.size.height = 32.5
        body = DetailBodyView(salesOrder: salesOrder)
        body!.frame.size.height = 450
        footer.image = UIImage(named: "page_detail_footer")
        footer.frame.size.height = 10
        self.addSubview(header)
        self.addSubview(body!)
        self.addSubview(footer)
    }

}
