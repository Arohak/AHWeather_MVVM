//
//  ViewConfiguration.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 05.07.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import Foundation

protocol ViewConfiguration: AnyObject {
    func setupViewConfiguration()
    func configureViews()
    func buildViewHierarchy()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        configureViews()
        buildViewHierarchy()
        setupConstraints()
    }
}
