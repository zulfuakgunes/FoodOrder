import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell{
    
    //static let identifier = String(describing: OnboardingCollectionViewCell.self)

    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide:OnboardingSlide){
        slideDescriptionLabel.text = slide.description
        slideTitleLabel.text = slide.title
        slideImageView.image = slide.image
    }
    
    
}
