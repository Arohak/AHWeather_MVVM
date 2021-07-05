//
//  LandingCell.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

final class LandingCell: TableViewCell<LandingCellContentView> {
    
    override func initialize() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}

final class LandingCellContentView: UIView, ContainerView {
    private let nameFont: UIFont = .boldSystemFont(ofSize: 22)
    private let titleFont: UIFont = .systemFont(ofSize: 18)

    lazy var cityNameLabel: MLabel = {
        let view = MLabel()
        view.font = nameFont
        return view
    }()
    
    lazy var tempLabel: MLabel = {
        let view = MLabel()
        view.font = nameFont
        return view
    }()
    
    lazy var mphLabel = MLabel()
    lazy var kphLabel = MLabel()
    lazy var sysLabel = MLabel()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAllUIElements() {
        addSubview(cityNameLabel)
        addSubview(tempLabel)
        addSubview(sysLabel)
        addSubview(mphLabel)
        addSubview(kphLabel)

        setConstraints()
    }
    
    func setConstraints() {
        let offset: CGFloat = 4
        let inset: CGFloat = 20

        cityNameLabel.topToSuperview(offset: inset)
        cityNameLabel.centerXToSuperview()
        
        tempLabel.topToBottom(of: cityNameLabel, offset: offset)
        tempLabel.centerXToSuperview()
        
        sysLabel.leadingToSuperview(offset: inset)
        sysLabel.topToBottom(of: tempLabel, offset: inset)
        
        mphLabel.leadingToSuperview(offset: inset)
        mphLabel.topToBottom(of: sysLabel)
        
        kphLabel.leadingToSuperview(offset: inset)
        kphLabel.topToBottom(of: mphLabel)
        kphLabel.bottomToSuperview()
    }

    func update(with model: LandingCellModelType) {
        cityNameLabel.text  = model.name
        tempLabel.text      = model.temp
        sysLabel.text       = "Sunrise:  " + model.sunrise + "\nSunset:  " + model.sunset
        mphLabel.text       = "\nHumidity:  " + model.humidity + "\nPressure:  " + model.pressure
        kphLabel.text       = "\nTempMax:  " + model.tempMax + "\nTempMin:  " + model.tempMin
    }
}

