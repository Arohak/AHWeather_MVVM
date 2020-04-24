//
//  LandingViewController.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import Combine

final class LandingViewController: BaseViewController {
    
    // MARK: - Properties -
    var landingView = LandingView()
    
    private var viewModel: LandingViewModelType!
    private let cellIdentifire = "cellIdentifire"
    private var cities = [LandingCellModelType]()
    
    // MARK: - Initializing -
    init(viewModel: LandingViewModelType) {
        super.init()
        
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configure(viewModel: viewModel)
    }
    
    // MARK: - Configuring -
    private func configureView() {
        self.view = landingView
        
        title = "Landing"
        
        landingView.tableView.dataSource = self
        landingView.tableView.delegate = self
        landingView.tableView.register(LandingCell.self, forCellReuseIdentifier: cellIdentifire)
    }
    
    private func configure(viewModel: LandingViewModelType) {
        _ = viewModel.viewIsReady()
            .sink { cities in
                self.cities = cities
                self.landingView.tableView.reloadData()
        }
            .store(in: &cancellableSet)
    }
}

//MARK: - extension for UITableView -
extension LandingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as! LandingCell
        let city = cities[indexPath.row]
        cell.configure(viewModel: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = cities[indexPath.row]
        
        _ = viewModel.cityDidSelect(cellModel: city)
            .sink { viewModel in
                let vc = DetailViewController(viewModel: viewModel)
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
