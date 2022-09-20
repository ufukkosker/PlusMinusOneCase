//
//  ProductDetailEntity.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import Foundation

// MARK: - ProductResponse
struct ProductResponse: Codable {
    
    // MARK: Properties
    let id: Int
    let name, desc: String
    let image: String
    let price: Price
}

// MARK: - Price
struct Price: Codable {
    
    // MARK: Properties
    let value: Int
    let currency: String
}

// MARK: - SocialResponse
struct SocialResponse: Codable {
    
    // MARK: Properties
    let likeCount: Int
    let commentCounts: CommentCounts
}

// MARK: - CommentCounts
struct CommentCounts: Codable {
    
    // MARK: Properties
    let averageRating, anonymousCommentsCount, memberCommentsCount: Int
}

