//
//  DetailTopView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import TinyConstraints
import Kingfisher

class DetailTopView: UIView {

    private let nameFont = UIFont.systemFont(ofSize: 22)
    private let titleFont = UIFont.systemFont(ofSize: 18)
    private let tempFont = UIFont.boldSystemFont(ofSize: 22)
    
    //MARK: - Create UIElements -
    lazy var cityNameLabel: MLabel = {
        let view = MLabel()
        view.font = nameFont
        view.textAlignment = .center
        return view
    }()
    
    lazy var iconImageView = UIImageView()
    
    lazy var titleLabel: MLabel = {
        let view = MLabel()
        view.font = titleFont
        return view
    }()
    
    lazy var tempLabel: MLabel = {
        let view = MLabel()
        view.font = tempFont
        view.textAlignment = .center
        return view
    }()
    
    lazy var weekLabel: MLabel = {
        let view = MLabel()
        view.font = titleFont
        return view
    }()
    
    lazy var tempAverageLabel: MLabel = {
        let view = MLabel()
        view.font = titleFont
        return view
    }()
    
    //MARK: - Initialize -
    init() {
        super.init(frame: .zero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuring -
    func configure(viewModel: DetailTopViewModelType) {
        cityNameLabel.text      = viewModel.cityName
        titleLabel.text         = viewModel.title
        tempLabel.text          = viewModel.temp
        weekLabel.text          = viewModel.week
        tempAverageLabel.text   = viewModel.tempAverage
        iconImageView.kf.setImage(with: URL(string: viewModel.icon))
    }
    
    //MARK: - Privat Methods -
    func addAllUIElements() {
        addSubview(cityNameLabel)
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        addSubview(weekLabel)
        addSubview(tempAverageLabel)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        let inset: CGFloat = 15
        let iconSize: CGFloat = 50

        cityNameLabel.topToSuperview(offset: inset)
        cityNameLabel.leadingToSuperview()
        cityNameLabel.trailingToSuperview()
        
        iconImageView.topToBottom(of: cityNameLabel)
        iconImageView.centerXToSuperview(offset: inset)
        iconImageView.size(CGSize(width: iconSize, height: iconSize))
        
        tempLabel.centerY(to: iconImageView)
        tempLabel.trailingToLeading(of: iconImageView)
        
        titleLabel.topToBottom(of: iconImageView)
        titleLabel.centerXToSuperview()
        
        weekLabel.bottomToSuperview(offset: -inset)
        weekLabel.leadingToSuperview(offset: inset)

        tempAverageLabel.centerY(to: weekLabel)
        tempAverageLabel.trailingToSuperview(offset: inset)
    }
}
