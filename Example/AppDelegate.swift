//
//  AppDelegate.swift
//  KGNAutoLayoutExample
//
//  Created by David Keegan on 10/20/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.tintColor = UIColor.whiteColor()
        return window
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window?.rootViewController = ReadmeViewController() // Generate readme examples
//        self.window?.rootViewController = PageViewController() // Example music app
        self.window?.makeKeyAndVisible()
        return true
    }

}

