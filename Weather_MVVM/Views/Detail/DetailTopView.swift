//
//  DetailTopView.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import PureLayout

class DetailTopView: UIView {

    //MARK: - Initialize -
    init() {
        super.init(frame: CGRectZero)
        
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
        iconImageView.kf_setImageWithURL(NSURL(string: viewModel.iconImage), placeholderImage: UIImage(named: ""))
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
        cityNameLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: DE_OFFSET/2)
        cityNameLabel.autoPinEdgeToSuperviewEdge(.Left)
        cityNameLabel.autoPinEdgeToSuperviewEdge(.Right)
        
        iconImageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: cityNameLabel, withOffset: -DE_INSET)
        iconImageView.autoAlignAxis(.Vertical, toSameAxisOfView: cityNameLabel, withOffset: -DE_INSET)
        iconImageView.autoSetDimensionsToSize(CGSize(width: DE_ICON_SIZE, height: DE_ICON_SIZE))
        
        titleLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: iconImageView)
        titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: iconImageView)
        
        tempLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: iconImageView, withOffset: -DE_OFFSET)
        tempLabel.autoPinEdgeToSuperviewEdge(.Left)
        tempLabel.autoPinEdgeToSuperviewEdge(.Right)
        
        weekLabel.autoPinEdgeToSuperviewEdge(.Bottom, withInset: DE_INSET)
        weekLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: DE_INSET)

        tempAverageLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: weekLabel)
        tempAverageLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: DE_INSET)
    }
    
    //MARK: - Create UIElements -
    lazy var cityNameLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_NAME_FONT
        view.textAlignment = .Center
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var titleLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        
        return view
    }()
    
    lazy var tempLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_TEMP_FONT
        view.textAlignment = .Center
        
        return view
    }()
    
    lazy var weekLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        
        return view
    }()
    
    lazy var tempAverageLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        
        return view
    }()
}
