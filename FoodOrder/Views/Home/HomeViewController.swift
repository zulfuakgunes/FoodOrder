import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var chefCollectionView: UICollectionView!
    var categories:[CategoryDish] = [
        .init(id: "id1", name: "Africa Dish", image: "https://via.placeholder.com/150/92c952"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://via.placeholder.com/150/92c952"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://via.placeholder.com/150/92c952"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://via.placeholder.com/150/92c952"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://via.placeholder.com/150/92c952")
    ]
    
    var popularDishes:[Dish] = [
        .init(id: "id1", label: "Garri", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 15.834),
        .init(id: "id2", label: "Larrys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 17.934),
        .init(id: "id3", label: "Daires", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 14.760),
        .init(id: "id4", label: "Ladys", image: "https://via.placeholder.com/150/92c952", description: "lorem ipsum dolor sit amet consectetur adipiscing elit", calories: 13.895)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
    
    
}

extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDishes.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            cell.setup(category: categories[indexPath.row])
            
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            
            cell.setup( popularDishes[indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate{
    
}
