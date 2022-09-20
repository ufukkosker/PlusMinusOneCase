//
//  NetworkManager.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import Foundation

// MARK: - Networking
protocol Networking {
    func request<T: Codable>(request: String, completion: @escaping (Result<T, ApiError>) -> Void)
}

// MARK: - NetowrkManager
final class NetworkManager: Networking {
    
    /// Use this function to making a network call request
    /// - Parameters:
    ///   - request: json file name `String`
    ///   - completion: Escaping closure
    func request<T: Codable>(request: String, completion: @escaping (Result<T, ApiError>) -> Void) {
        LoadingManager.shared.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard let requestURL = self.getFileURL(request) else {
                LoadingManager.shared.hide()
                completion(.failure(.badRequest))
                return
            }
            
            guard let data = self.getData(with: requestURL) else {
                LoadingManager.shared.hide()
                completion(.failure(.dataNotFound))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                LoadingManager.shared.hide()
                completion(.success(result))
            } catch {
                LoadingManager.shared.hide()
                completion(.failure(.decodeError))
            }
        }
    }
    
    private func getFileURL(_ request: String) -> URL? {
        if let filePath = Bundle.main.path(forResource: request, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            return fileUrl
        }
        return nil
    }
    
    private func getData(with url: URL) -> Data? {
        if let data = try? Data(contentsOf: url) {
            return data
        }
        return nil
    }
}
