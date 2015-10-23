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

        let pageScrollView = UIScrollView()
        pageScrollView.pagingEnabled = true
        self.view.addSubview(pageScrollView)
        pageScrollView.pinToEdgesOfSuperview()

        var pageViews: [UIView] = []
        for album in albums! {
            // adding a sub view controller is breaking the sub view...
            let albumViewController = AlbumViewController()
            albumViewController.album = album as? [String : AnyObject]
            pageScrollView.addSubview(albumViewController.view)
            albumViewController.didMoveToParentViewController(self)
            albumViewController.view.sizeWidthAndHeightToWidthAndHeightOfItem(pageScrollView)
            albumViewController.view.clipsToBounds = true
            pageViews.append(albumViewController.view)
        }
        pageScrollView.boundHorizontally(pageViews)

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
