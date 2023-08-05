import Foundation

enum Route{
    
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    case placeOrder(String)
    case fetchListDishes(String)
    
    var description: String{
        switch self{
        case .fetchAllCategories : return "/dish-categories"
        case .placeOrder(let dishId): return "/orders/\(dishId)"
        case .fetchListDishes(let listDishes):
            return "/dishes/\(listDishes)"
        }
    }
    
}
