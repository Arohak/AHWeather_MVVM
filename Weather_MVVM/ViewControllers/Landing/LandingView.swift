//
//  LandingView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import TinyConstraints

class LandingView: UIView {
    
    lazy var bgImageView = UIImageView()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.estimatedRowHeight = 44
        view.rowHeight = UITableView.automaticDimension
        view.showsVerticalScrollIndicator = false
        view.contentInset = .zero
        view.backgroundColor = .black

        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .black
        addAllUIElements()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addAllUIElements() {
        addSubview(bgImageView)
        addSubview(tableView)

        setConstraints()
    }
    
    func setConstraints() {
        bgImageView.edgesToSuperview()
        tableView.edgesToSuperview()
    }
}
