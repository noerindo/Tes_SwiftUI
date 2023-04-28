//
//   APIService.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 28/04/2566 BE.
//

import Foundation

enum APIError : Error {
    case failedToGetData
}

class APIService {
    static let shared = APIService()
    
    func getAllProduct(completion : @escaping (Result<[Product], Error>) -> Void) {
        if let url = URL(string: "https://dummyjson.com/products") {
            
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else { return }
                do {
                    let results = try JSONDecoder().decode(Products.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(results.products))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
}

