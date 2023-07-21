import Foundation

struct Dish:Decodable{
    let id, label, image, description:String?
    let calories:Double?
    
    var formattedCalories:String{
        return String(format: "%.2f calories",calories ?? 0)
    }
}
