//
//  LandingCell.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

final class LandingCell: BaseTableViewCell {

    //MARK: - Create UIElements -
    var cellContentView = LandingCellContentView()
    
    // MARK: - Initializing -
    override func initialize() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(cellContentView)
        cellContentView.edgesToSuperview()
    }
    
    // MARK: - Configuring -
    func configure(viewModel: LandingCellModelType) {
        cellContentView.cityNameLabel.text  = viewModel.name
        cellContentView.tempLabel.text      = viewModel.temp
        cellContentView.sysLabel.text       = "Sunrise:  " + viewModel.sunrise + "\nSunset:  " + viewModel.sunset
        cellContentView.mphLabel.text       = "\nHumidity:  " + viewModel.humidity + "\nPressure:  " + viewModel.pressure
        cellContentView.kphLabel.text       = "\nTempMax:  " + viewModel.tempMax + "\nTempMin:  " + viewModel.tempMin
    }
}

//MARK: - LandingCellContentView -
final class LandingCellContentView: UIView {
    let nameFont: UIFont = .boldSystemFont(ofSize: 22)
    let titleFont: UIFont = .systemFont(ofSize: 18)

    //MARK: - Create UIElements -
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
    
    //MARK: - Initialize -
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods -
    func addAllUIElements() {
        addSubview(cityNameLabel)
        addSubview(tempLabel)
        addSubview(sysLabel)
        addSubview(mphLabel)
        addSubview(kphLabel)

        setConstraints()
    }
    
    //MARK: - Constraints -
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
}

