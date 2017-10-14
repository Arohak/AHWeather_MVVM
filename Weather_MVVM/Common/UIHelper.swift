//
//  UIHelper.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import PKHUD
import SwiftLoader

struct UIHelper {
    
    static func configurateApplicationApperance() {
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = WHITE
        navBarAppearance.tintColor = BLACK
        navBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: BLACK, NSFontAttributeName : NAV_FONT]
    }
    
    static func showHUD(message: String) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: message)
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = true
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0);
    }

    static func showProgressHUD() {
        var config = SwiftLoader.Config()
        config.size = 100
        config.spinnerColor = WHITE
        config.backgroundColor = BLACK
        config.foregroundAlpha = 0.3
        SwiftLoader.setConfig(config)
        SwiftLoader.show(animated: true)
    }
    
    static func hideProgressHUD() {
        SwiftLoader.hide()
    }
}