//
//  ProductDetailModule.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import Foundation

// MARK: - ProductDetailModule
struct ProductDetailModule {
    typealias View = ProductDetailModuleView
    typealias Interactor = ProductDetailModuleInteractor
    typealias Presenter = ProductDetailModulePresenter
    typealias Router = ProductDetailModuleRouter
}

extension ProductDetailModule {
    
    enum ProductDetailTableItem {
        
        case image(model: ImageItemViewModel)
        case detail(model: DetailItemViewModel)
    }
    
    struct ImageItemViewModel {
        var imageURL: String
    }
    
    struct DetailItemViewModel {
        var id: Int
        var name: String
        var desc: String
        var price: Price
        var likeCount: Int
        var commentCounts: CommentCounts
    }
}
