//
//  SocialProviderable.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import Foundation

// MARK: - SocialProviderable
protocol SocialProviderable {
    func social(request: String, completion: @escaping (Result<SocialResponse, ApiError>) -> Void)
}

// MARK: - SocialAPI
final class SocialAPI: SocialProviderable {

    // MARK: Properties
    static let shared = SocialAPI()
    private let networkManager = NetworkManager()
    
    func social(request: String, completion: @escaping (Result<SocialResponse, ApiError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
}
