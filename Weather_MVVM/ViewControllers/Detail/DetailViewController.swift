//
//  DetailViewController.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: BaseViewController {
    
    // MARK: - Properties -
    private var detailView = DetailView()
    private let cellIdentifireTable = "cellIdentifireTable"
    private let cellIdentifireCollection = "cellIdentifireCollection"
    private var detail: DetailModelType!
    private var viewModel: DetailViewModelType!

    // MARK: - Initializing -
    init(viewModel: DetailViewModelType) {
        super.init()
        
        self.viewModel = viewModel
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configure(viewModel)
    }

    // MARK: - Configuring -
    private func configureView() {
        self.view = detailView
        
        title = "Detail"
        
        detailView.tableView.dataSource = self
        detailView.tableView.delegate = self
        detailView.tableView.registerClass(DetailDayCell.self, forCellReuseIdentifier: cellIdentifireTable)

        detailView.collectionView.dataSource = self
        detailView.collectionView.delegate = self
        detailView.collectionView.registerClass(DetailTimeCell.self, forCellWithReuseIdentifier: cellIdentifireCollection)

    }
    
    private func configure(viewModel: DetailViewModelType) {
        _ = viewModel.viewIsReady()
            .subscribeNext { detail in
                self.detail = detail
                
                self.detailView.showViews()
                self.detailView.topView.configure(detail.topView)
                self.detailView.tableView.reloadData()
                self.detailView.collectionView.reloadData()
        }
    }
}

//MARK: - extension for UITableView -
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let detail = detail {
          return detail.dayCells.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifireTable) as! DetailDayCell
        let day = detail.dayCells[indexPath.row]
        cell.configure(day)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return LA_CELL_HEIGHT/4
    }
}

//MARK: - extension for UICollectionView -
extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let detail = detail {
            return detail.dayCells.first!.hours.count
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifireCollection, forIndexPath: indexPath) as! DetailTimeCell
        let hour = detail.dayCells.first!.hours[indexPath.row]
        cell.configure(hour)
        
        return cell
    }
}

