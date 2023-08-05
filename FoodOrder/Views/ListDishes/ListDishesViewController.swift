import UIKit
import ProgressHUD

class ListDishesViewController:UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: CategoryDish!

    var dishes:[Dish] = []
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(dishId: category.id ?? "") {[weak self] result in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
                
            }
        }
        
        registerCells()
    }
    
}

extension ListDishesViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier,for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
}

extension ListDishesViewController:UITableViewDelegate{
    
}
