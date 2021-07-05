//
//  AppDelegate.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configurateApplicationApperance()
        startApplication()
        return true
    }
}

// MARK: - Private Method -
extension AppDelegate {
    private func startApplication() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = LandingViewController(viewModel: LandingViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func configurateApplicationApperance() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = .orange
        navBarAppearance.tintColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 22)]
    }
}

