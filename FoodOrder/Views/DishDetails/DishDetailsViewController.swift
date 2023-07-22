import UIKit

class DishDetailsViewController:UIViewController{
    
    var dish:Dish!
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.label
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
    
    @IBAction func placeOrderBtnClicked(_ sender: Any) {
        
        
        
    }
    
}
