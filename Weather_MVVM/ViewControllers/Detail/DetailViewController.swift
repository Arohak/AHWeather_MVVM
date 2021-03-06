//
//  DetailViewController.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    private var detailView = DetailView()
    private var viewModel: DetailViewModelType!
    private var tableDataProvider: DetailTableDataProvider?
    private var collectionDataProvider: DetailCollectionDataProvider?
    
    init(viewModel: DetailViewModelType) {
        super.init()
        
        self.viewModel = viewModel
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configTableDataProvider()
        configCollectionDataProvider()
        viewIsReady()
    }
}

// MARK: - Private Methods
extension DetailViewController {
    
    private func configUI() {
        view = detailView
        title = "Detail"
    }
    
    private func configTableDataProvider() {
        tableDataProvider = DetailTableDataProvider(with: detailView.tableView)
    }
    
    private func configCollectionDataProvider() {
        collectionDataProvider = DetailCollectionDataProvider(with: detailView.collectionView)
    }
    
    private func viewIsReady() {
        viewModel.viewIsReady()
            .sink { detail in
                self.detailView.topView.configure(viewModel: detail.topView)
                self.tableDataProvider?.update(with: detail.dayCells)
                self.collectionDataProvider?.update(with: detail.dayCells.first?.hours ?? [])
            }
            .store(in: &cancellableSet)
    }
}

