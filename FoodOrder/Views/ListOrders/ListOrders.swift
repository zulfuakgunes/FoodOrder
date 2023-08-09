import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController{
    @IBOutlet weak var tableView:UITableView!
    
    var orders:[Orders] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Order"
        registerCells()

        ProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
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
        cell.setup(order: orders[indexPath.row])
        return cell
    }
}

extension ListOrdersViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
