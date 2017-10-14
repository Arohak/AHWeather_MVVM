//
//  LandingCell.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class LandingCell: BaseTableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = LandingCellContentView()
    
    // MARK: - Initializing -
    override func initialize() {
        backgroundColor = CLEAR
        selectionStyle = .None
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    // MARK: - Configuring -
    func configure(viewModel: LandingCellModelType) {
        cellContentView.cityNameLabel.text  = viewModel.name
        cellContentView.titleLabel.text     = viewModel.desc
        cellContentView.tempLabel.text      = viewModel.temp
        cellContentView.sysLabel.text       = "Sunrise:  " + viewModel.sunrise + "\nSunset:  " + viewModel.sunset
        cellContentView.mphLabel.text       = "\nHumidity:  " + viewModel.humidity + "\nPressure:  " + viewModel.pressure
        cellContentView.kphLabel.text       = "\nTempMax:  " + viewModel.tempMax + "\nTempMin:  " + viewModel.tempMin
    }
}

//MARK: - LandingCellContentView -
final class LandingCellContentView: UIView {
    
    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = CLEAR
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods -
    func addAllUIElements() {
        addSubview(cityNameLabel)
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        addSubview(sysLabel)
        addSubview(mphLabel)
        addSubview(kphLabel)

        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        cityNameLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: LA_INSET/2)
        cityNameLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        
        iconImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        iconImageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: cityNameLabel, withOffset: LA_INSET)
        iconImageView.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE, height: LA_ICON_SIZE))
        
        titleLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: cityNameLabel, withOffset: 0)
        titleLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        
        tempLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel, withOffset: LA_INSET/2)
        tempLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        
        sysLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        sysLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: tempLabel, withOffset: 0)
        
        mphLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        mphLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: sysLabel, withOffset: 0)
        
        kphLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        kphLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: mphLabel, withOffset: 0)
        kphLabel.autoPinEdgeToSuperviewEdge(.Bottom, withInset: LA_INSET)
    }
    
    //MARK: - Create UIElements -
    lazy var cityNameLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_NAME_FONT
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var titleLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = TITLE_LBL_FONT
        
        return view
    }()
    
    lazy var tempLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = LA_TEMP_FONT
        
        return view
    }()
    
    lazy var mphLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        
        return view
    }()
    
    lazy var kphLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        
        return view
    }()
    
    lazy var sysLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        
        return view
    }()
}

