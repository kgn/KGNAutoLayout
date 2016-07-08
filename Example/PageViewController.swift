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

        // Read the data from disk
        let filePath = Bundle.main().pathForResource("Albums", ofType: "plist")
        let albums = NSArray(contentsOfFile: filePath!)

        // Setup the paging scroll view
        let pageScrollView = UIScrollView()
        pageScrollView.isPagingEnabled = true
        pageScrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(pageScrollView)
        pageScrollView.pinToEdgesOfSuperview()

        // Add the album view controllers to the scroll view
        var pageViews: [UIView] = []
        for album in albums! {
            let pageView = UIView()
            pageScrollView.addSubview(pageView)
            pageView.clipsToBounds = true
            pageView.sizeWidthAndHeightToWidthAndHeight(ofItem: pageScrollView)
            pageViews.append(pageView)

            let albumViewController = AlbumViewController()
            albumViewController.album = album as? [String : AnyObject]
            self.addSubViewController(albumViewController, toView: pageView)

        }
        pageScrollView.boundHorizontally(views: pageViews)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .lightContent
    }

    func addSubViewController(_ viewController: UIViewController, toView: UIView? = nil, belowSubview: UIView? = nil) {
        self.addChildViewController(viewController)
        var parentView = self.view
        if let view = toView {
            parentView = view
        }
        if let subview = belowSubview {
            parentView?.insertSubview(viewController.view, belowSubview: subview)
        } else {
            parentView?.addSubview(viewController.view)
        }
        viewController.didMove(toParentViewController: self)
        viewController.view.pinToEdgesOfSuperview()
    }

}
