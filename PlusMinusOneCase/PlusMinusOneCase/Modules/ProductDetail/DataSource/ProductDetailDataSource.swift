//
//  ProductDetailDataSource.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 18.09.2022.
//

import UIKit

final class ProductDetailDataSource: NSObject {
    
    typealias RowItem = ProductDetailModule.ProductDetailTableItem
    
    // MARK: Properties
    weak var tableView: UITableView?
    weak var presenter: ProductDetailModule.Presenter?
    
    private var items: [RowItem] = []
    
    required init(_ tableView: UITableView) {
        super.init()
        self.tableView = tableView
        registerCells()
        self.tableView?.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView?.separatorStyle = .none
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.sectionHeaderHeight = 30
        self.tableView?.estimatedRowHeight = 40
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.tableFooterView = .init()
        self.tableView?.contentInsetAdjustmentBehavior = .never
        self.tableView?.reloadData()
    }
    
    private func registerCells() {
        tableView?.register(
            ProductImageCell.nib,
            forCellReuseIdentifier: ProductImageCell.reuseIdentifier
        )
        tableView?.register(
            ProductDetailCell.nib,
            forCellReuseIdentifier: ProductDetailCell.reuseIdentifier
        )
    }
}

extension ProductDetailDataSource {
  
  public func setItems(_ items: [RowItem]) {
    self.items = items
    DispatchQueue.main.async {
      self.tableView?.reloadData()
    }
  }
}

extension ProductDetailDataSource: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return items.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row] {
            
        case .image(model: let model):
            if let cell = tableView.cellDequeue(with: ProductImageCell.self, indexPath: indexPath) {
                cell.prepareProductImage(with: model.imageURL)
                return cell
            } else {
                return UITableViewCell()
            }
        case .detail(model: let model):
            if let cell = tableView.cellDequeue(with: ProductDetailCell.self, indexPath: indexPath) {
                cell.timerCallbackable = self
                cell.prepareProductDetail(model)
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
}

extension ProductDetailDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch items[indexPath.row] {
        case .image(model: _):
            return 215
        case .detail(model: _):
            return 105
        }
    }
}

extension ProductDetailDataSource: TimerCallbackable {
    
    func didFinishTimer() {
        presenter?.fetchSocialAfterFinishTimer()
    }
}
