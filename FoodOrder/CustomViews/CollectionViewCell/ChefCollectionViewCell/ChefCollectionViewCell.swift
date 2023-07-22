
import UIKit

class ChefCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ChefCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish:Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.label
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
}
