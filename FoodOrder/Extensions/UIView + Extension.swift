import UIKit

extension UIView{
     @IBInspectable var cornerRadius: CGFloat{
        get{
            self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
