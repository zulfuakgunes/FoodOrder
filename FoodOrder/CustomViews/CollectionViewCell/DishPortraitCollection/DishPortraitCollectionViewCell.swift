import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static var identifier = String(describing: DishPortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(_ dish:Dish){
        titleLabel.text = dish.label
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.image?.asUrl)
    }
    
}
