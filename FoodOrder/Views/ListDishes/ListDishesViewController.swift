import UIKit

class ListDishesViewController:UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: CategoryDish!
    let dishes:[Dish] = [
        .init(id: "id2", label: "Larrys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 17.934),
        .init(id: "id3", label: "Daires", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 14.760),
        .init(id: "id4", label: "Ladys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 13.895)
    ]
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
