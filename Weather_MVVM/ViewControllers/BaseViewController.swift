//
//  BaseViewController.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    // MARK: - Initializing -
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
}