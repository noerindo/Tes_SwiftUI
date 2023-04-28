//
//  ProducViewModel.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 28/04/2566 BE.
//

import Foundation
import CoreData

class ProducViewModel : ObservableObject {
    @Published var allProducts : [Product] = [Product]()
    @Published var loading : Bool = false
    init(){
        getAllProduct()
    }
    
    private func getAllProduct() {
        self.loading = true
        APIService.shared.getAllProduct { result in
            switch result {
            case .success(let products) :
                self.loading = false
                self.allProducts.append(contentsOf: products)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}

class ListProducViewModel : ObservableObject {
    @Published var savedEntities : [FavoriteProduct] = []
    let container : NSPersistentContainer
    var isFavoriteProduct : Bool = false
    
    init() {
        container = NSPersistentContainer(name : "Tes_SwftUI")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error loading core data : \(error)")
            }
        }
        fetchFavoriteProduct()
    }
    
    func fetchFavoriteProduct() {
        let req = NSFetchRequest<FavoriteProduct>(entityName: "FavoriteProduct")
        do {
            savedEntities = try container.viewContext.fetch(req)
        } catch let error {
            print("Error fetching : \(error)")
        }
        print(savedEntities)
    }
    
    func checkProductFavorite(id : Int) -> Bool {
        for faveItem in savedEntities {
            if faveItem.id == Int16(id) {
                isFavoriteProduct = true
                return true
            }
        }
        return false
    }
}
