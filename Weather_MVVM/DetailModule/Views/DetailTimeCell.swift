//
//  DetailTimeCell.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import Kingfisher

final class DetailTimeCell: CollectionViewCell<DetailTimeCellContentView> {
    
    override func initialize() {
        backgroundColor = .clear
    }
}

class DetailTimeCellContentView: UIView, ContainerView {
    
    lazy var timeLabel = MLabel()
    lazy var iconImageView = UIImageView()
    lazy var tempLabel = MLabel()
    
    init() {
        super.init(frame: .zero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addAllUIElements() {
        addSubview(timeLabel)
        addSubview(iconImageView)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
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
    
    func update(with model: DetailTimeCellModelType) {
        timeLabel.text  = model.time
        tempLabel.text  = model.temp
        iconImageView.kf.setImage(with: URL(string: model.icon))
    }
}
