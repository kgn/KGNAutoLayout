//
//  PageViewController.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/20/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit
import KGNAutoLayout

class PageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let filePath = NSBundle.mainBundle().pathForResource("Albums", ofType: "plist")
        let albums = NSArray(contentsOfFile: filePath!)

        let albumViewController = AlbumViewController()
        albumViewController.album = albums?.firstObject as? [String : AnyObject]
        self.view.addSubview(albumViewController.view)
        albumViewController.didMoveToParentViewController(self)
        albumViewController.view.pinToEdgesOfSuperview()

//        let pageScrollView = UIScrollView()
//        pageScrollView.pagingEnabled = true
//        self.view.addSubview(pageScrollView)
//        pageScrollView.pinToEdgesOfSuperview()
//
//        var pageViews: [UIView] = []
//        for album in albums! {
//            let albumViewController = AlbumViewController()
//            albumViewController.album = album as? [String : AnyObject]
//            pageScrollView.addSubview(albumViewController.view)
//            albumViewController.didMoveToParentViewController(self)
//            albumViewController.view.pinToTopEdgeOfSuperview()
//            albumViewController.view.pinToBottomEdgeOfSuperview()
//            albumViewController.view.sizeWidthToWidthOfItem(pageScrollView)            
//            albumViewController.view.clipsToBounds = true
//            pageViews.append(albumViewController.view)
//        }
//        pageScrollView.boundHorizontally(pageViews)

        let statusBarBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        self.view.addSubview(statusBarBlurView)
        statusBarBlurView.pinToTopEdgeOfSuperview()
        statusBarBlurView.pinToSideEdgesOfSuperview()
        statusBarBlurView.sizeHeightToHeightOfItem(self.topLayoutGuide)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
