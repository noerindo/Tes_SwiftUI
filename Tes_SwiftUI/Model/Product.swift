//
//  Product.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 19/04/2566 BE.
//

import Foundation

// MARK: - Product
struct Product: Codable, Hashable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

// MARK: - Products
struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

extension Products{
    func example() -> Product {
        return products.first!
    }
}


