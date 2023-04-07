////
////  FavoritViewModel.swift
////  Tes_SwiftUI
////
////  Created by Indah Nurindo on 07/04/2566 BE.
////
//
//import Foundation
//
//class FavoritViewModel {
//    var favoriteProd: FavoriteProduct
//    init(favoriteProd: FavoriteProduct) {
//        self.favoriteProd = favoriteProd
//    }
//    var title: String {
//        self.favoriteProd.title ?? ""
//    }
//    var description: String {
//        self.favoriteProd.description
//    }
//    var price: Int32 {
//        Int32(self.favoriteProd.price)
//    }
//        
//    var  discountPercentage: Double {
//        self.favoriteProd.discountPercentage
//    }
//    var rating: Double {
//        self.favoriteProd.rating
//    }
//    var stock: Int32 {
//        Int32(self.favoriteProd.stock)
//    }
//    var brand: String {
//        self.favoriteProd.brand ?? ""
//    }
//    var category: String {
//        self.favoriteProd.category ?? ""
//    }
//    var thumbnail: String {
//        self.favoriteProd.thumbnail ?? ""
//    }
//}
//
////add Favorite
//class AddFavorite: ObservableObject {
//    var id: Int32 = 0
//    var title: String = ""
//    var description: String = ""
//    var price: Int32 = 0
//    var discountPercentage: Double = 0.0
//    var rating: Double = 0.0
//    var stock: Int32 = 0
//    var brand: String = ""
//    var category: String = ""
//    var thumbnail: String = ""
//    
//    private var favoriteProd: FavoriteProduct {
//        let favoritePro = FavoriteProduct(context: ManagerCoreData.shared.managedObjectContext)
//        favoritePro.id = id
//        favoritePro.title = title
//        favoritePro.descriptionn = description
//        favoritePro.price = price
//        favoritePro.discountPercentage = discountPercentage
//        favoritePro.rating = rating
//        favoritePro.stock = stock
//        favoritePro.thumbnail = thumbnail
//        return favoritePro
//        
//    }
//    func addFavoriteProd() -> Bool {
//        do {
//            try ManagerCoreData.shared.addFavortitePro(favoritePro: favoriteProd)
//            return true
//        } catch {
//            print(error.localizedDescription)
//        }
//        return false
//    }
//}
//
////delete
//class DeleteFavorite: ObservableObject {
//    var id: Int32 = 0
//    func deleteFavorite() -> Bool {
//        do {
//            try ManagerCoreData.shared.deleteFavoriteProd(id: id)
//            return true
//        } catch {
//            print(error.localizedDescription)
//        }
//        return false
//    }
//}
//
//class FavoriteProdByIdViewModel: ObservableObject {
//    
//    @Published
//    var favoriteProd = FavoriteModel(id: 0, title: "", description: "", price: 0, discountPercentage: 0.0, rating: 0.0, stock: 0, brand: "", category: "", thumbnail: "")
//    @Published var loading : Bool = false
//    func fetchFavoriteProById(id: Int32) {
//        self.loading = true
//        ManagerCoreData.shared.getFavoriteProById(id){
//            favoriteProd in
//            self.loading = false
//            guard let favoriteProd = favoriteProd else{
//                return
//            }
//            
//        }
//    }
//}
