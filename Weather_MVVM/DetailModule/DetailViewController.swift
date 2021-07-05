//
//  DetailViewController.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    private let _view = DetailView()
    private var viewModel: DetailViewModelType!
    
    convenience init(viewModel: DetailViewModelType) {
        self.init()
        
        self.viewModel = viewModel
    }
    
    override func loadView() {
        super.loadView()
        view = _view
        title = "Detail"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewIsReady()
    }
}

// MARK: - Private Methods
extension DetailViewController {
    private func viewIsReady() {
        viewModel.viewIsReady()
            .sink { [weak self] detail in
                self?._view.update(with: detail)
            }
            .store(in: &cancellableSet)
    }
}

