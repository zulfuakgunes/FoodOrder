import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController{
    @IBOutlet weak var tableView:UITableView!
    
    var orders:[Orders] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
            case .failure(let error):
                ProgressHUD.show(error.localizedDescription)
            }
        }
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}

extension ListOrdersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        //cell.setup(dish: orders[indexPath.row])
        return cell
    }
    
    
}
