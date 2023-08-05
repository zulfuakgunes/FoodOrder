
import Foundation

struct CategoryDish:Decodable{
    let id, name, image:String?
    
    enum CodingKeys: String, CodingKey{

        case id
        case name = "title"
        case image
        
    }
}
