
import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    func setup(category: CategoryDish){
        categoryLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image.asUrl)
    }
    
}
