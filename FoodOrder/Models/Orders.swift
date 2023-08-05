//
//  Orders.swift
//  FoodOrder
//
//  Created by Zülfü Akgüneş on 23.07.2023.
//

import Foundation

struct Orders: Decodable{
    let id:String?
    let name:String?
    let dish: Dish?
}

