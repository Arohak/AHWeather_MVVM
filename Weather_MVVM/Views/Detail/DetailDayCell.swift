//
//  DetailDayCell.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class DetailDayCell: BaseTableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = DetailDayCellContentView()
    
    // MARK: - Initializing -
    override func initialize() {
        backgroundColor = CLEAR
        selectionStyle = .None
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    // MARK: - Configuring -
    func configure(viewModel: DetailDayCellModelType) {
        cellContentView.titleLabel.text     = viewModel.title
        cellContentView.tempLabel.text      = viewModel.temp
        cellContentView.iconImageView.kf_setImageWithURL(NSURL(string: viewModel.iconImage), placeholderImage: UIImage(named: ""))
    }
}

//MARK: - DetailDayCellContentView
class DetailDayCellContentView: UIView {
    
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
    private func addAllUIElements() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        titleLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        
        iconImageView.autoCenterInSuperview()
        iconImageView.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE, height: LA_ICON_SIZE))
        
        tempLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        tempLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: LA_INSET)
    }
    
    //MARK: - Create UIElements -
    lazy var titleLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var tempLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        
        return view
    }()
}