//
//  LandingView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import TinyConstraints

class LandingView: BaseView {
    private lazy var dataProvider = TableDataProvider<LandingCellContentView, LandingCell>(tableView: tableView)
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.estimatedRowHeight = 44
        view.rowHeight = UITableView.automaticDimension
        view.showsVerticalScrollIndicator = false
        view.contentInset = .zero
        view.backgroundColor = .black
        addSubview(view)
        view.edgesToSuperview()
        return view
    }()
    
    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .black
    }
    
    public func update(items: [LandingCellModelType], didSelect: Completion<LandingCellModelType>?) {
        dataProvider.update(with: items)
        dataProvider.didSelect = didSelect
    }
}
