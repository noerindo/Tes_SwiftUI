//
//  ProducDetailViewModel.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 28/04/2566 BE.
//

import CoreData
import SwiftUI

class ProducDetailViewModel : ObservableObject {
    @Published var savedEntities : [FavoriteProduct] = []
    let container : NSPersistentContainer
    var isFavoriteProduct : Bool = false
    
  
    init() {
        container = NSPersistentContainer(name : "Tes_SwiftUI")
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
    
    func addFavorite(id : Int) {
        let favoriteProduct = FavoriteProduct(context: container.viewContext)
        favoriteProduct.id = Int16(id)
        saveData()
    }
    
    func deleteFavorite(id : Int) {
        for product in savedEntities {
            if product.id == Int16(id) {
                container.viewContext.delete(product)
            }
        }
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFavoriteProduct()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
    func checkFavoriteProduct(id : Int) -> Bool {
        for favoriteProduct in savedEntities {
            if favoriteProduct.id == Int(id) {
                isFavoriteProduct = true
                return true
            }
        }
        return false
    }
}
