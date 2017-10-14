//
//  LandingView.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import PureLayout

class LandingView: UIView {
    
    //MARK: - Create UIElements -
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView.newAutoLayoutView()
        view.estimatedRowHeight = 44
        view.rowHeight = UITableViewAutomaticDimension
        view.showsVerticalScrollIndicator = false
        view.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        view.backgroundColor = BLACK

        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = BLACK
        addAllUIElements()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods -
    private func addAllUIElements() {
        addSubview(bgImageView)
        addSubview(tableView)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: NAV_HEIGHT, left: 0, bottom: 0, right: 0))
    }
}
