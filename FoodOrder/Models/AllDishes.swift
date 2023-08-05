import Foundation

struct AllDishes: Decodable{
    let categories: [CategoryDish]?
    let populars: [Dish]?
    let specials: [Dish]?
}


