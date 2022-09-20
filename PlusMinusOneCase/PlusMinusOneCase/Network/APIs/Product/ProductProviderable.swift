//
//  ProductProviderable.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import Foundation

// MARK: - ProductProviderable
protocol ProductProviderable {
    func product(request: String, completion: @escaping (Result<ProductResponse, ApiError>) -> Void)
}

// MARK: - ProductAPI
final class ProductAPI: ProductProviderable {

    // MARK: Properties
    static let shared = ProductAPI()
    private let networkManager = NetworkManager()
    
    func product(request: String, completion: @escaping (Result<ProductResponse, ApiError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
}
