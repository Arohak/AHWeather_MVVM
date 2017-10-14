//
//  AppDelegate.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        startApplication()
        
        return true
    }
    
    // MARK: - Private Method -
    private func startApplication() {
        UIHelper.configurateApplicationApperance()

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let viewController = LandingViewController(viewModel: LandingViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

