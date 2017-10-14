//
//  DetailView.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import PureLayout

class DetailView: UIView {
        
    //MARK: - Create UIElements
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()

    lazy var topView: DetailTopView = {
        let view = DetailTopView.newAutoLayoutView()
        view.backgroundColor = BLACK
        view.hidden = true
        
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        layout.scrollDirection = .Horizontal
        layout.itemSize = CGSize(width: DE_TIME_CELL_SIZE, height: DE_TIME_CELL_SIZE)
        layout.sectionInset = UIEdgeInsetsZero
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        view.backgroundColor = BLACK
        view.showsHorizontalScrollIndicator = false
        view.hidden = true

        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView.newAutoLayoutView()
        view.backgroundColor = BLACK
        view.separatorStyle = .None
        view.showsVerticalScrollIndicator = false
        view.hidden = true

        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = WHITE
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Methods -
    func showViews() {
        topView.hidden              = false
        collectionView.hidden       = false
        tableView.hidden            = false
    }
    
    //MARK: - Privat Methods -
    private func addAllUIElements() {
        addSubview(bgImageView)
        addSubview(topView)
        addSubview(collectionView)
        addSubview(tableView)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        topView.autoPinEdgeToSuperviewEdge(.Top, withInset: NAV_HEIGHT)
        topView.autoPinEdgeToSuperviewEdge(.Left)
        topView.autoPinEdgeToSuperviewEdge(.Right)
        topView.autoSetDimension(.Height, toSize: DE_TOP_HEIGHT)
        
        collectionView.autoPinEdge(.Top, toEdge: .Bottom, ofView: topView, withOffset: DE_OFFSET/2)
        collectionView.autoPinEdgeToSuperviewEdge(.Left)
        collectionView.autoPinEdgeToSuperviewEdge(.Right)
        collectionView.autoSetDimension(.Height, toSize: DE_TIME_CELL_SIZE)
        
        tableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: collectionView, withOffset: DE_OFFSET/2)
        tableView.autoPinEdgeToSuperviewEdge(.Left)
        tableView.autoPinEdgeToSuperviewEdge(.Right)
        tableView.autoPinEdgeToSuperviewEdge(.Bottom)
    }
}
