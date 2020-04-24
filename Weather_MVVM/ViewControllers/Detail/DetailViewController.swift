//
//  DetailViewController.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

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
        configure(viewModel: viewModel)
    }

    // MARK: - Configuring -
    private func configureView() {
        self.view = detailView
        
        title = "Detail"
        
        detailView.tableView.dataSource = self
        detailView.tableView.delegate = self
        detailView.tableView.register(DetailDayCell.self, forCellReuseIdentifier: cellIdentifireTable)

        detailView.collectionView.dataSource = self
        detailView.collectionView.delegate = self
        detailView.collectionView.register(DetailTimeCell.self, forCellWithReuseIdentifier: cellIdentifireCollection)

    }
    
    private func configure(viewModel: DetailViewModelType) {
        _ = viewModel.viewIsReady()
            .sink { detail in
                self.detail = detail
                
                self.detailView.topView.configure(viewModel: detail.topView)
                self.detailView.tableView.reloadData()
                self.detailView.collectionView.reloadData()
            }
            .store(in: &cancellableSet)
    }
}

//MARK: - extension for UITableView -
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let detail = detail {
          return detail.dayCells.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifireTable) as! DetailDayCell
        let day = detail.dayCells[indexPath.row]
        cell.configure(viewModel: day)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

//MARK: - extension for UICollectionView -
extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let detail = detail {
            return detail.dayCells.first!.hours.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifireCollection, for: indexPath as IndexPath) as! DetailTimeCell
        let hour = detail.dayCells.first!.hours[indexPath.row]
        cell.configure(viewModel: hour)
        return cell
    }
}

