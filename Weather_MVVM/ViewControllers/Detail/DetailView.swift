//
//  DetailView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import TinyConstraints

class DetailView: UIView {
    let cellHeight: CGFloat = 70
    
    //MARK: - Create UIElements
    lazy var bgImageView = UIImageView()

    lazy var topView: DetailTopView = {
        let view = DetailTopView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: cellHeight, height: cellHeight)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .black
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let inset: CGFloat = 10
        let topHeight: CGFloat = 170

        bgImageView.edgesToSuperview()
        
        topView.topToSuperview(usingSafeArea: true)
        topView.leadingToSuperview()
        topView.trailingToSuperview()
        topView.height(topHeight)
        
        collectionView.topToBottom(of: topView, offset: inset)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.height(cellHeight)
        
        tableView.topToBottom(of: collectionView, offset: inset)
        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        tableView.bottomToSuperview()
    }
}
