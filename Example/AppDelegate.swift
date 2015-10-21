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
        let filePath = NSBundle.mainBundle().pathForResource("Albums", ofType: "plist")
        let albums = NSArray(contentsOfFile: filePath!)
        let albumViewController = AlbumViewController()
        albumViewController.album = albums?.firstObject as? [String : AnyObject]
        self.window?.rootViewController = albumViewController
//        self.window?.rootViewController = PageViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

