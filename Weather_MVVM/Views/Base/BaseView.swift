//
//  BaseView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit
import TinyConstraints

//MARK: - BaseTableViewCell -
class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Initializing -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() { /* Override point */ }
}

//MARK: - BaseCollectionViewCell -
class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initializing -
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() { /* Override point */ }
}

//MARK: - MLabel -
class MLabel: UILabel {
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        font = .systemFont(ofSize: 14)
        textColor = .white
        numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - MButton -
class MButton: UIButton {
    
    var indexPath = NSIndexPath()
    
    //MARK: - Initialize -
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.isExclusiveTouch = true
        self.titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
