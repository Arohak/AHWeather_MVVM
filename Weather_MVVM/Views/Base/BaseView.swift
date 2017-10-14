//
//  BaseView.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import PureLayout

//MARK: - BaseTableViewCell -
class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Initializing -
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
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
        super.init(frame: CGRectZero)
        
        font = LA_LBL_FONT
        textColor = WHITE
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
        
        self.exclusiveTouch = true
        self.titleLabel?.font = DE_TITLE_FONT
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
