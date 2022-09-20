//
//  ProductDetailPresenter.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import Foundation

// MARK: - ProductDetailModulePresenter
protocol ProductDetailModulePresenter: AnyObject {
    
    // MARK: Properties
    var view: ProductDetailModule.View? { get set }
    var interactor: ProductDetailModule.Interactor? { get set }
    var router: ProductDetailModule.Router? { get set }
    var productResponse: ProductResponse? { get set }
    var tableItems: [ProductDetailModule.ProductDetailTableItem] { get set }
    
    //MARK: Functions
    func viewDidLoad()
    func didFetch(product: ProductResponse)
    func didFetch(social: SocialResponse)
    func fetchSocialAfterFinishTimer()
}

// MARK: - ProductDetailPresenter
final class ProductDetailPresenter: ProductDetailModule.Presenter {
    
    var view: ProductDetailModule.View?
    var interactor: ProductDetailModule.Interactor?
    var router: ProductDetailModule.Router?
    var productResponse: ProductResponse?
    var tableItems: [ProductDetailModule.ProductDetailTableItem] = []
    
    func viewDidLoad() {
        interactor?.fetchProduct()
    }
    
    func didFetch(product: ProductResponse) {
        tableItems.append(.image(model: makeProductItem(product)))
        interactor?.fetchSocial()
    }
    
    func didFetch(social: SocialResponse) {
        
        if let index = tableItems.firstIndex(where: { if case .detail = $0 { return true }; return false }) {
            tableItems.remove(at: index)
        }
        if let productResponse = productResponse {
            tableItems.append(makeSocialItem(model: social, model: productResponse))
        } else {
            tableItems.append(makeSocialItem(model: social, model: nil))
        }
        view?.updateProductTableView(tableItems)
    }
    
    func fetchSocialAfterFinishTimer() {
        interactor?.fetchSocial()
    }
}

// MARK: - Extension
extension ProductDetailPresenter {
    
    private func makeProductItem(_ model: ProductResponse) -> ProductDetailModule.ImageItemViewModel {
        .init(imageURL: model.image)
    }
    
    private func makeSocialItem(model social: SocialResponse, model product: ProductResponse?) -> ProductDetailModule.ProductDetailTableItem {
        .detail(model: ProductDetailModule.DetailItemViewModel(id: product?.id ?? 0, name: product?.name ?? "", desc: product?.desc ?? "", price: product?.price ?? Price(value: 0, currency: ""), likeCount: social.likeCount, commentCounts: social.commentCounts))
    }
}
