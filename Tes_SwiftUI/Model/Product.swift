//
//  Product.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 07/04/2566 BE.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

extension Post{
    func example() -> Product {
        return products.first!
    }
}
