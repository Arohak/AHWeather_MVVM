//
//  DetailTimeCell.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class DetailTimeCell: BaseCollectionViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = DetailTimeCellContentView()
    
    // MARK: - Initializing -
    override func initialize() {
        backgroundColor = CLEAR
        
        addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    // MARK: - Configuring -
    func configure(viewModel: DetailTimeCellModelType) {
        cellContentView.timeLabel.text      = viewModel.time
        cellContentView.tempLabel.text      = viewModel.temp
        cellContentView.iconImageView.kf_setImageWithURL(NSURL(string: viewModel.iconImage), placeholderImage: UIImage(named: ""))
    }
}


//MARK: - DetailTimeCellContentView
class DetailTimeCellContentView: UIView {
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods -
    private func addAllUIElements() {
        addSubview(timeLabel)
        addSubview(iconImageView)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
    func setConstraints() {
        timeLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        timeLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        
        iconImageView.autoCenterInSuperview()
        iconImageView.autoSetDimensionsToSize(CGSize(width: DE_TIME_CELL_SIZE/2, height: DE_TIME_CELL_SIZE/2))
        
        tempLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        tempLabel.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0)
    }
    
    //MARK: - Create UIElements -
    lazy var timeLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var tempLabel: MLabel = {
        let view = MLabel.newAutoLayoutView()
        
        return view
    }()
}