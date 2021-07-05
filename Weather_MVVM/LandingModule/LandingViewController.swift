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
    private let _view = LandingView()
    private var viewModel: LandingViewModelType!    

    convenience init(viewModel: LandingViewModelType) {
        self.init()
        self.viewModel = viewModel
    }

    override func loadView() {
        super.loadView()
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        viewIsReady()
    }
}

// MARK: - Private Methods
extension LandingViewController {
    private func configNavigationBar() {
        title = "Landing"
        let rightButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = rightButton
    }

    private func viewIsReady() {
        viewModel.viewIsReady()
            .sink { [weak self] cities in
                self?._view.update(items: cities, didSelect: self?.didSelect)
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
