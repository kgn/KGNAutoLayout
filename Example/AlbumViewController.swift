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

    private lazy var albumArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.registerClass(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.identifier())
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
        self.albumArtImageView.pinToTopEdgeOfSuperview()
        self.albumArtImageView.centerHorizontallyInSuperview()
        self.albumArtImageView.sizeHeightToWidthOfItem(self.view)

        self.view.addSubview(self.tableView)
        self.tableView.pinToEdgesOfSuperview()
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

}
