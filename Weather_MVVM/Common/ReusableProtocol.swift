//
//  ReusableProtocol.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

protocol Reusable { }

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: Reusable {}

extension Reusable where Self: UITableViewHeaderFooterView {
    static var reuseId: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable {}

extension Reusable where Self: UICollectionViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
}
