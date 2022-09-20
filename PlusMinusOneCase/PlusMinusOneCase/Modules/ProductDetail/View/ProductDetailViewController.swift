//
//  ProductDetailViewController.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 17.09.2022.
//

import UIKit

protocol ProductDetailModuleView: AnyObject {
    var presenter: ProductDetailModule.Presenter? { get set }
    
    func updateProductTableView(_ model: [ProductDetailModule.ProductDetailTableItem])
}

final class ProductDetailViewController: UIViewController, ProductDetailModule.View {
    
    @IBOutlet weak var productDetailTableView: UITableView!
    private var dataSource: ProductDetailDataSource!
    
    var presenter: ProductDetailModule.Presenter?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        dataSource = .init(productDetailTableView)
        dataSource.presenter = presenter
    }
}
// MARK: - Extension
extension ProductDetailViewController {
    
    func updateProductTableView(_ model: [ProductDetailModule.ProductDetailTableItem]) {
        dataSource.setItems(model)
    }
}
