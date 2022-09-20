//
//  ProductDetailInteractor.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import Foundation

protocol ProductDetailModuleInteractor: AnyObject {
    
    // MARK: Properties
    var presenter: ProductDetailModule.Presenter? { get set }
    
    // MARK: Functions
    func fetchProduct()
    func fetchSocial()
}

final class ProductDetailInteractor: ProductDetailModule.Interactor {
    
    var presenter: ProductDetailModule.Presenter?
    
    func fetchProduct() {
        ProductAPI.shared.product(request: ProductRequestType.getAllProducts.rawValue) {[weak self] result in
            switch result {
            case .success(let response):
                self?.presenter?.productResponse = response
                self?.presenter?.didFetch(product: response)
            case .failure(let error):
                AlertManager.shared.showAlert(with: error)
            }
        }
    }
    
    func fetchSocial() {
        SocialAPI.shared.social(request: SocialRequestType.getAllSocial.rawValue) { result in
            switch result {
            case .success(let response):
                self.presenter?.didFetch(social: response)
            case .failure(let error):
                AlertManager.shared.showAlert(with: error)
            }
        }
    }
}
