//
//  DetailDayCell.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import Kingfisher

final class DetailDayCell: BaseTableViewCell {
    
    //MARK: - Create UIElements -
    var cellContentView = DetailDayCellContentView()
    
    // MARK: - Initializing -
    override func initialize() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(cellContentView)
        cellContentView.edgesToSuperview()
    }
    
    // MARK: - Configuring -
    func configure(viewModel: DetailDayCellModelType) {
        cellContentView.titleLabel.text = viewModel.title
        cellContentView.tempLabel.text  = viewModel.temp
        cellContentView.iconImageView.kf.setImage(with: URL(string: viewModel.icon))
    }
}

//MARK: - DetailDayCellContentView
class DetailDayCellContentView: UIView {
    
    let font: UIFont = .systemFont(ofSize: 16)
    
    //MARK: - Create UIElements -
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
    private func addAllUIElements() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints -
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
}
