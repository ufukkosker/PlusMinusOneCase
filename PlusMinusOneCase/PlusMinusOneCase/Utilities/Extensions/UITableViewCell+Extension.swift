//
//  UITableViewCell+Extension.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 18.09.2022.
//

import UIKit

public extension UITableViewCell {
    /// Creates a generic identifier for the UITableViewCell depending on it's name/title.
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    /// Returns potential UIImageView for the reorder control
    ///
    /// Use this if you want to provide a custom image on the darg accessory functionality.
    var reorderControlImageView: UIImageView? {
        let reorderControl = self.subviews.first { view -> Bool in
            view.classForCoder.description() == "UITableViewCellReorderControl"
        }
        return reorderControl?.subviews.first { view -> Bool in
            view is UIImageView
        } as? UIImageView
    }
}
