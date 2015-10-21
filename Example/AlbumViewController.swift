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

            let artwork = album["artwork"] as! String
            self.albumArtImageView.image = UIImage(named: artwork)
            self.backgroundImageView.image = UIImage(named: artwork)

            self.tableView.reloadData()
        }
    }

    var albumArtTopConstraint: NSLayoutConstraint!
    var albumArtHeightConstraint: NSLayoutConstraint!
    private lazy var albumArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "The Resistance.jpg")
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "The Resistance.jpg")
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.registerClass(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.identifier())
        tableView.scrollIndicatorInsets = UIEdgeInsetsMake(CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame), 0, 0, 0)
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        tableView.separatorColor = UIColor.whiteColor().colorWithAlphaComponent(0.1)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, 0, screenWidth))
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.backgroundImageView)
        self.backgroundImageView.pinToEdgesOfSuperview()

        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        self.view.addSubview(blurView)
        blurView.pinToEdgesOfSuperview()

        self.view.addSubview(self.albumArtImageView)
        self.albumArtTopConstraint = self.albumArtImageView.pinToTopEdgeOfSuperview()
        self.albumArtHeightConstraint = self.albumArtImageView.sizeHeightToWidthOfItem(self.view)
        self.albumArtImageView.pinToSideEdgesOfSuperview()

        self.view.addSubview(self.tableView)
        self.tableView.pinToEdgesOfSuperview()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "statusBarFrameDidChange:", name: UIApplicationDidChangeStatusBarFrameNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func statusBarFrameDidChange(notification: NSNotification) {
        if let frame = notification.userInfo?[UIApplicationStatusBarFrameUserInfoKey] as? CGRect {
            let height = CGRectGetHeight(frame)
            self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(height, 0, 0, 0)
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
