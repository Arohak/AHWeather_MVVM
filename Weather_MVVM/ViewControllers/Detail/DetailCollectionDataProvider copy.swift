//
//  DetailCollectionDataProvider copy.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

class DetailCollectionDataProvider: NSObject {
    private weak var collectionView: UICollectionView?
    private var items = [DetailTimeCellModelType]()

    init(with collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        config()
    }
    
    private func config() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.registerCell(DetailTimeCell.self)
    }
    
    public func update(with items: [DetailTimeCellModelType]) {
        self.items = items
        collectionView?.reloadData()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension DetailCollectionDataProvider: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(indexPath) as DetailTimeCell
        let item = items[indexPath.row]
        cell.configure(viewModel: item)
        return cell
    }
}
