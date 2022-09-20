//
//  Nibloadable.swift
//  PlusMinusOneCase
//
//  Created by Ufuk on 18.09.2022.
//

import UIKit

/// `NibLoadable` is abstract protocol that wraps nib object that would be initialized with it's class name by default.
public protocol NibLoadable: AnyObject {
    /// Nib object of the confirmed class.
    ///
    /// Note that this object would be instantiated by the class name by default.
    static var nib: UINib { get }
}

public extension NibLoadable {
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
