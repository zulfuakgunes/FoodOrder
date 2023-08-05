import UIKit
import ProgressHUD

class HomeViewController: UIViewController{
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefCollectionView: UICollectionView!
    
    var categories:[CategoryDish] = []
    var popularDishes:[Dish] = []
    var specials:[Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let allDishes):
                
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.popularDishes = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                 
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.chefCollectionView.reloadData()
            case .failure(let error):
                print("The error is : \(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
        }

    }
    
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        chefCollectionView.register(UINib(nibName: ChefCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefCollectionViewCell.identifier)
    }
    
}

extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDishes.count
        case chefCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            cell.setup(category: categories[indexPath.row])
            
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            
            cell.setup(dish: popularDishes[indexPath.row])
            return cell
        case chefCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefCollectionViewCell.identifier, for: indexPath) as! ChefCollectionViewCell
            
            cell.setup(dish: popularDishes[indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }else{
            let controller = DishDetailsViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? popularDishes[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
