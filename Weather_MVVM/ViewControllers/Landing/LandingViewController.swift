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
    
    private var landingView = LandingView()
    private var viewModel: LandingViewModelType!    
    private var dataProvider: TableDataProvider<LandingCellContentView, LandingCell>?

    
    init(viewModel: LandingViewModelType) {
        super.init()
        
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configNavigationBar()
        configDataProvider()
        viewIsReady()
    }
}

// MARK: - Private Methods
extension LandingViewController {
        
    private func configUI() {
        view = landingView
        title = "Landing"
    }
    
    private func configNavigationBar() {
        let rightButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func configDataProvider() {
        dataProvider = TableDataProvider(tableView: landingView.tableView)
        dataProvider?.didSelect = { [weak self] city in
            self?.didSelect(city: city)
        }
    }
    
    private func viewIsReady() {
        viewModel.viewIsReady()
            .sink { cities in
                self.dataProvider?.update(with: cities)
            }
            .store(in: &cancellableSet)
        
        
    }

    private func didSelect(city: LandingCellModelType) {
        viewModel.cityDidSelect(cellModel: city)
            .sink { viewModel in
                let vc = DetailViewController(viewModel: viewModel)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            .store(in: &cancellableSet)
    }
    
    @objc private func addAction() {
        let vc = ForecastViewController(viewModel: .init())
        present(vc, animated: true, completion: nil)
    }
}
