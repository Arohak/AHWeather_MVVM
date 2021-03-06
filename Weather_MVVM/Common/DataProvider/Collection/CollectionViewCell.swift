//
//  CollectionViewCell.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

class CollectionViewCell<View: ContainerView>: UICollectionViewCell {
    public lazy var view: View = {
        let view = View()
        contentView.addSubview(view)
        view.edgesToSuperview()
        return view
    }()
    
    public var model: View.Model! {
        didSet {
            view.update(with: model)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() { /* Override point */ }
}
