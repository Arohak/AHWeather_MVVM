//
//  Wireframe.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import UIKit

struct Wireframe {
    
    static var window = appDelegate.window

    static func root() -> UINavigationController {
        let rootViewController = window!.rootViewController as! UINavigationController
        return rootViewController
    }
    
    static func instantiateViewControllerWith(identifier: String) -> UIViewController {
        return UIStoryboard(name: identifier, bundle: nil).instantiateViewControllerWithIdentifier(identifier)
    }
    
    static func dismissViewController() {
        if let nav = root().presentedViewController as? UINavigationController {
            nav.dismissViewControllerAnimated(true, completion: nil)
        } else {
            root().dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    static func presentViewController(vc: UIViewController) {
        if let nav = root().presentedViewController as? UINavigationController {
            nav.presentViewController(vc, animated: true, completion: nil)
        } else {
            root().presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    static func modalPresentViewController(vc: UIViewController) {
        vc.modalTransitionStyle = .CrossDissolve
        vc.modalPresentationStyle = .OverCurrentContext
        root().presentViewController(vc, animated: true, completion: nil)
    }
    
    static func presentNavigationController(vc: UIViewController) {
        let nav = UINavigationController(rootViewController: vc)
        root().presentViewController(nav, animated: true, completion: nil)
    }
    
    static func pushViewController(vc: UIViewController) {
        root().pushViewController(vc, animated: true)
    }
}

