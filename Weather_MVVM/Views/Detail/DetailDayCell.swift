//
//  DetailDayCell.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import Kingfisher

final class DetailDayCell: TableViewCell<DetailDayCellContentView> {
    
    override func initialize() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}

final class DetailDayCellContentView: UIView, ContainerView {
    
    private let font: UIFont = .systemFont(ofSize: 16)
    
    lazy var iconImageView = UIImageView()

    lazy var titleLabel: MLabel = {
        let view = MLabel()
        view.font = font
        return view
    }()
        
    lazy var tempLabel: MLabel = {
        let view = MLabel()
        view.font = font
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addAllUIElements() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        let inset: CGFloat = 20
        let iconSize = CGSize(width: 30, height: 30)

        titleLabel.centerYToSuperview()
        titleLabel.leadingToSuperview(offset: inset)
        
        iconImageView.centerInSuperview()
        iconImageView.size(iconSize)
        
        tempLabel.centerYToSuperview()
        tempLabel.trailingToSuperview(offset: inset)
    }

    func update(with model: DetailDayCellModelType) {
        titleLabel.text = model.title
        tempLabel.text  = model.temp
        iconImageView.kf.setImage(with: URL(string: model.icon))
    }
}
