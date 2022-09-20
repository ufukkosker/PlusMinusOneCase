//
//  ProductDetailBuilder.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import UIKit

final class ProductDetailBuilder {
    
    static func build() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ProductDetailViewController")
        if let view = navController.children.first as? ProductDetailViewController {
            let interactor = ProductDetailInteractor()
            let presenter = ProductDetailPresenter()
            let router = ProductDetailRouter()
            
            view.presenter = presenter
            interactor.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            router.presenterVC = view
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ProductDetail", bundle: Bundle.main)
    }
}
