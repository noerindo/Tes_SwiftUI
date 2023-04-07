////
////  ManagerCoreData.swift
////  Tes_SwiftUI
////
////  Created by Indah Nurindo on 07/04/2566 BE.
////
//
//import Foundation
//import CoreData
//
//class ManagerCoreData{
//    static let shared = ManagerCoreData(managedObjectContext: NSManagedObjectContext.current)
//    var managedObjectContext: NSManagedObjectContext
//    private init(managedObjectContext: NSManagedObjectContext){
//        self.managedObjectContext = managedObjectContext
//    }
//    
//    func addFavortitePro(favoritePro: FavoriteProduct) throws {
//        self.managedObjectContext.insert(favoritePro)
//        try self.managedObjectContext.save()
//    }
//    
//    func deleteFavoriteProd(id: Int32) throws {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteProduct")
//        fetchRequest.fetchLimit = 1
//        fetchRequest.predicate = NSPredicate(format: "id == \(id.self)")
//        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        batchDeleteRequest.resultType = .resultTypeCount
//        do {
//            try self.managedObjectContext.execute(batchDeleteRequest)
//        } catch let error as NSError {
//            print(error)
//        }
//    }
//
//    func getFavoriteProById(_ id: Int32, completion: @escaping(FavoriteModel?) -> ()) {
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteProduct")
//        fetchRequest.fetchLimit = 1
//        fetchRequest.predicate = NSPredicate(format: "id == \(id)")
//        do {
//            if let result = try self.managedObjectContext.fetch(fetchRequest).first{
//                let favoritePro = FavoriteModel(id: result.value(forKeyPath: "id") as? Int32, title: result.value(forKeyPath: "title") as? String, description: result.value(forKeyPath: "descriptionn") as? String, price: result.value(forKeyPath: "price") as?  Int, discountPercentage: result.value(forKeyPath: "discountPercentage") as? Double, rating: result.value(forKeyPath: "rating") as? Double, stock: result.value(forKeyPath: "stock") as? Int, brand: result.value(forKeyPath: "brand") as? String, category: result.value(forKeyPath: "category") as? String, thumbnail: result.value(forKeyPath: "thumbnail") as? String)
//                DispatchQueue.main.async {
//                    completion(favoritePro)
//                }
//            }
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }
//    
//    func getAllFavoritePro() -> [FavoriteProduct] {
//        var favoritePro = [FavoriteProduct]()
//        let postRequest: NSFetchRequest<FavoriteProduct> = FavoriteProduct.fetchRequest()
//        do {
//            favoritePro = try self.managedObjectContext.fetch(postRequest)
//        } catch let error as NSError {
//            print(error)
//        }
//        return favoritePro
//    }
//}
//
