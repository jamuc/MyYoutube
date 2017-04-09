import UIKit

extension UIColor {
    static func rgb(colorLiteralRed: Float, green: Float, blue: Float) -> UIColor {
        return UIColor(colorLiteralRed: colorLiteralRed/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraints(withFormat format:String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict[key] = view
        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}

