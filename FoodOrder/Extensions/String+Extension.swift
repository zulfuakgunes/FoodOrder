//
//  String+Extension.swift
//  FoodOrder
//
//  Created by Zülfü Akgüneş on 20.07.2023.
//

import Foundation

extension String{
    var asUrl: URL? {
        return URL(string: self)
    }
}
