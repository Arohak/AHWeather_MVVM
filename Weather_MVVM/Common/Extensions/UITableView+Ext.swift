//
//  UITableView+Ext.swift
//  MG2
//
//  Created by Ara Hakobyan on 4/25/19.
//  Copyright © 2019 Marktguru. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: Cell.reuseId)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(_ indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell else {
            fatalError("fatal error for cell at \(indexPath)")
        }
        return cell
    }

    func registerHeaderFooter<View: UITableViewHeaderFooterView>(_ viewClass: View.Type) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: View.reuseId)
    }

    func dequeueReusableHeaderFooter<View: UITableViewHeaderFooterView>() -> View {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: View.reuseId) as? View else {
            fatalError("fatal error for HeaderFooter View)")
        }
        return view
    }
}
