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

    // BUG: 8.0 beta (8S128d) can't be `lazy`
    // https://bugs.swift.org/browse/SR-1825
    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main().bounds)
        window.tintColor = .white()
        return window
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window?.rootViewController = PageViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

