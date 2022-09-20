//
//  ProductDetailRouter.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import UIKit

protocol ProductDetailModuleRouter: AnyObject {
    
}

class ProductDetailRouter: ProductDetailModule.Router {
    weak var presenterVC: UIViewController?
}
