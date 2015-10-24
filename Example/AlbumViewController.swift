//
//  AlbumViewController.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/20/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit
import KGNAutoLayout

class AlbumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var album: [String: AnyObject]? {
        didSet {
            guard let album = self.album else {
                return
            }

            // Update the album data
            let artwork = album["artwork"] as! String
            self.albumArtImageView.image = UIImage(named: artwork)
            self.backgroundImageView.image = UIImage(named: artwork)
            self.artistLabel.text = album["artist"] as? String
            self.albumLabel.text = album["album"] as? String
            self.tableView.reloadData()
        }
    }

    private let navbarHeight: CGFloat = 44

    private var albumArtTopConstraint: NSLayoutConstraint!
    private var albumArtHeightConstraint: NSLayoutConstraint!
    private lazy var albumArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()

    private lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        label.textColor = UIColor.whiteColor()
        return label
    }()

    private lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        label.textColor = UIColor.whiteColor()
        return label
    }()

    private lazy var tableView: UITableView = {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let statusBarHeight = CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.registerClass(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.identifier())
        tableView.scrollIndicatorInsets = UIEdgeInsetsMake(statusBarHeight+self.navbarHeight, 0, 0, 0)
        tableView.separatorColor = UIColor.whiteColor().colorWithAlphaComponent(0.1)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, 0, screenWidth+statusBarHeight+self.navbarHeight))
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the blurred background image
        self.view.addSubview(self.backgroundImageView)
        self.backgroundImageView.pinToEdgesOfSuperview()

        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        self.view.addSubview(blurView)
        blurView.pinToEdgesOfSuperview()

        // Setup our custom "nav bar"
        let titleView = UIView()
        self.view.addSubview(titleView)
        titleView.pinToSideEdgesOfSuperview()
        titleView.sizeToHeight(self.navbarHeight)
        titleView.positionBelowItem(self.topLayoutGuide)

        self.view.addSubview(self.artistLabel)
        self.artistLabel.centerHorizontallyInSuperview()

        self.view.addSubview(self.albumLabel)
        self.albumLabel.centerHorizontallyInSuperview()

        titleView.centerViewsVertically([self.artistLabel, self.albumLabel])

        let navbarBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        self.view.insertSubview(navbarBlurView, belowSubview: titleView)
        navbarBlurView.pinToTopEdgeOfSuperview()
        navbarBlurView.pinToSideEdgesOfSuperview()
        navbarBlurView.pinBottomEdgeToBottomEdgeOfItem(titleView)

        // Setup the album artwork image view
        self.view.insertSubview(self.albumArtImageView, belowSubview: navbarBlurView)
        self.albumArtTopConstraint = self.albumArtImageView.positionBelowItem(navbarBlurView)
        self.albumArtHeightConstraint = self.albumArtImageView.sizeHeightToWidthOfItem(self.view)
        self.albumArtImageView.pinToSideEdgesOfSuperview()

        // Setup the table view
        self.view.insertSubview(self.tableView, belowSubview: navbarBlurView)
        self.tableView.pinToEdgesOfSuperview()

        // Becuase we're making a totally custom "nav bar" handle the status bar frame change
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "statusBarFrameDidChange:", name: UIApplicationDidChangeStatusBarFrameNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func statusBarFrameDidChange(notification: NSNotification) {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let statusBarHeight = CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
        if let frame = notification.userInfo?[UIApplicationStatusBarFrameUserInfoKey] as? CGRect {
            let height = CGRectGetHeight(frame)
            self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(height+self.navbarHeight, 0, 0, 0)
            self.tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, 0, screenWidth+statusBarHeight+self.navbarHeight))
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tracks = self.album?["tracks"] as! [String]
        return tracks.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TrackTableViewCell.identifier(), forIndexPath: indexPath) as! TrackTableViewCell
        let tracks = self.album?["tracks"] as! [String]
        cell.textLabel?.text = tracks[indexPath.row]
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    // Custom stretch scroll effect
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            self.albumArtTopConstraint.constant = -scrollView.contentOffset.y
            self.albumArtHeightConstraint.constant = 0
        } else {
            self.albumArtHeightConstraint.constant = -scrollView.contentOffset.y
            self.albumArtTopConstraint.constant = 0
        }
    }

}
