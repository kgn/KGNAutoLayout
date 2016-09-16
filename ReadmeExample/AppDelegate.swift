//
//  AppDelegate.swift
//  ReadmeExample
//
//  Created by David Keegan on 7/8/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.tintColor = .white
        return window
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = ReadmeViewController() // Generate readme examples
        self.window?.makeKeyAndVisible()
        return true
    }

}

