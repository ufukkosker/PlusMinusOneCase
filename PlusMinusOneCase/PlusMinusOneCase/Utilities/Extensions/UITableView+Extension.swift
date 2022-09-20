//
//  UITableView+Extension.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 18.09.2022.
//

import UIKit

extension UITableView {
    /// Dequeues (by it's class name) and returns a reusable table-view cell object.
    /// - parameters:
    ///    - cell: Cell Type.
    ///    - indexPath: IndexPath of the cell.
    public func cellDequeue<T: UITableViewCell>(with cell: T.Type, indexPath: IndexPath) -> T? {
        self.dequeueReusableCell(
            withIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T
    }
}
