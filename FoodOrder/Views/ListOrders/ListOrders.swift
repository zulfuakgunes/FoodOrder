//
//  ListOrders.swift
//  FoodOrder
//
//  Created by Zülfü Akgüneş on 23.07.2023.
//

import UIKit

class ListOrdersViewController: UIViewController{
    @IBOutlet weak var tableView:UITableView!
    
    var orders:[Orders] = [
        .init(id: "id", name: "Emanuel", dish: .init(id: "id2", label: "Larrys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 17.934)),

        .init(id: "id", name: "Emanuel", dish: .init(id: "id2", label: "Larrys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 17.934)),

        .init(id: "id", name: "Emanuel", dish: .init(id: "id2", label: "Larrys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 17.934)),

        .init(id: "id", name: "Emanuel", dish: .init(id: "id2", label: "Larrys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 17.934)),

        .init(id: "id", name: "Emanuel", dish: .init(id: "id2", label: "Larrys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 17.934)),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}
