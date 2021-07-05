//
//  ForecastViewController.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2021 AroHak. All rights reserved.
//

import SwiftUI

class ForecastViewController: UIHostingController<ForecastView> {
    
    private var viewModel: ForecastViewModel!
    
    init(viewModel: ForecastViewModel) {
        super.init(rootView: ForecastView(viewModel: .init()))
        
        self.viewModel = viewModel
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
