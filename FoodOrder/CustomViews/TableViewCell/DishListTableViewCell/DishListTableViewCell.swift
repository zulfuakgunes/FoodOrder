//
//  DishListTableViewCell.swift
//  FoodOrder
//
//  Created by Zülfü Akgüneş on 22.07.2023.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = "DishListTableViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        //setup(<#DishListTableViewCell#>)
    }
    
    func setup(dish:Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.label
        descriptionLbl.text = dish.description
    }
}
