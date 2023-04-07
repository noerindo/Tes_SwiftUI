//
//  ServiceAPI.swift
//  Tes_SwiftUI
//
//  Created by Indah Nurindo on 07/04/2566 BE.
//

import Foundation

class ServiceAPI{
    static var shared = ServiceAPI()
    private init(){}
    
    private func createURL() -> URL? {
        let urlStr = "https://dummyjson.com/products"
        
        return URL(string: urlStr)
    }
    
    func fetchData(completion: @escaping (Result<Post, Error>) -> Void) {
        guard let url = createURL() else { completion(.failure(Errors.badUrl)); return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let usersDate = try decoder.decode(Post.self, from: data)
                completion(.success(usersDate))
            } catch {
                completion(.failure(Errors.invalidDate))
            }
            
        }.resume()
    }
}

enum Errors: Error {
    case badUrl, invalidDate
}
