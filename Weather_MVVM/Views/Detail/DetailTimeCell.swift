//
//  DetailTimeCell.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import Kingfisher

final class DetailTimeCell: BaseCollectionViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = DetailTimeCellContentView()
    
    // MARK: - Initializing -
    override func initialize() {
        backgroundColor = .clear
        
        addSubview(cellContentView)
        cellContentView.edgesToSuperview()
    }
    
    // MARK: - Configuring -
    func configure(viewModel: DetailTimeCellModelType) {
        cellContentView.timeLabel.text  = viewModel.time
        cellContentView.tempLabel.text  = viewModel.temp
        cellContentView.iconImageView.kf.setImage(with: URL(string: viewModel.icon))
    }
}


//MARK: - DetailTimeCellContentView
class DetailTimeCellContentView: UIView {
    
    //MARK: - Create UIElements -
    lazy var timeLabel = MLabel()
    
    lazy var iconImageView = UIImageView()
    
    lazy var tempLabel = MLabel()
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
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
        let inset: CGFloat = 5
        let iconSize = CGSize(width: 30, height: 30)

        timeLabel.centerXToSuperview()
        timeLabel.topToSuperview(offset: inset)
        
        iconImageView.centerInSuperview()
        iconImageView.size(iconSize)
        
        tempLabel.centerXToSuperview()
        tempLabel.bottomToSuperview(offset: -inset)
    }
}
