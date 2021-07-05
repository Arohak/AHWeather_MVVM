//
//  DetailView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import TinyConstraints

class DetailView: BaseView {
    private let cellHeight: CGFloat = 70
    
    private lazy var tableDataProvider = TableDataProvider<DetailDayCellContentView, DetailDayCell>(with: .init(heightForRow: 44), tableView: tableView)
    private lazy var collectionDataProvider = CollectionDataProvider<DetailTimeCellContentView, DetailTimeCell>(collectionView: collectionView)
    
    private lazy var bgImageView = UIImageView()

    private lazy var topView: DetailTopView = {
        let view = DetailTopView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
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
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setupViewConfiguration()
    }
    
    public func update(with detail: DetailModelType) {
        topView.configure(viewModel: detail.topView)
        tableDataProvider.update(with: detail.dayCells)
        collectionDataProvider.update(with: detail.dayCells.first?.hours ?? [])
    }
}

extension DetailView: ViewConfiguration {
    func configureViews() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        addSubview(bgImageView)
        addSubview(topView)
        addSubview(collectionView)
        addSubview(tableView)
    }
    
    func setupConstraints() {
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
