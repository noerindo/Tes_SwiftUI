////
////  Favorite.swift
////  Tes_SwiftUI
////
////  Created by Indah Nurindo on 07/04/2566 BE.
////
//
//import Foundation
//
//struct FavoriteModel{
//    let id: Int32?
//    let title: String?
//    let description: String?
//    let price: Int?
//    let discountPercentage: Double?
//    let rating: Double?
//    let stock: Int?
//    let brand: String?
//    let category: String?
//    let thumbnail: String?
//}
//
//class FavoriteList: ObservableObject {
//    
//    @Published
//    var favoriteProd = [FavoritViewModel]()
//    @Published var loading : Bool = false
//    init() {
//        fetchAllFavoriteProd()
//    }
//    func fetchAllFavoriteProd() {
//        self.loading = true
//        DispatchQueue.main.async {
//            self.loading = false
//            self.favoriteProd = ManagerCoreData.shared.getAllFavoritePro().map(FavoritViewModel.init)
//        }
//    }
//}
//
