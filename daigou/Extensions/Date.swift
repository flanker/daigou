import Foundation

extension NSDate {

    func toString() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        return formatter.stringFromDate(self)
    }

}
