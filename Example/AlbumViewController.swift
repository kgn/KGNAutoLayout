//
//  AlbumViewController.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/20/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit
import KGNAutoLayout

private extension Selector {
    static let statusBarFrameDidChange = #selector(AlbumViewController.statusBarFrameDidChange(_:))
}

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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .white
        return label
    }()

    private lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .white
        return label
    }()

    private lazy var tableView: UITableView = {
        let screenWidth = UIScreen.main.bounds.width
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.identifier())
        tableView.scrollIndicatorInsets = UIEdgeInsetsMake(statusBarHeight+self.navbarHeight, 0, 0, 0)
        tableView.separatorColor = UIColor.white.withAlphaComponent(0.1)
        tableView.backgroundColor = .clear
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: screenWidth+statusBarHeight+self.navbarHeight))
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

        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        self.view.addSubview(blurView)
        blurView.pinToEdgesOfSuperview()

        // Setup our custom "nav bar"
        let titleView = UIView()
        self.view.addSubview(titleView)
        titleView.pinToSideEdgesOfSuperview()
        titleView.size(toHeight: self.navbarHeight)
        titleView.positionBelow(self.topLayoutGuide as! LayoutItem)

        self.view.addSubview(self.artistLabel)
        self.artistLabel.centerHorizontallyInSuperview()

        self.view.addSubview(self.albumLabel)
        self.albumLabel.centerHorizontallyInSuperview()

        [self.artistLabel, self.albumLabel].centerVertically(to: titleView)

        let navbarBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        self.view.insertSubview(navbarBlurView, belowSubview: titleView)
        navbarBlurView.pinToTopEdgeOfSuperview()
        navbarBlurView.pinToSideEdgesOfSuperview()
        navbarBlurView.pinBottomEdgeToBottomEdge(of: titleView)

        // Setup the album artwork image view
        self.view.insertSubview(self.albumArtImageView, belowSubview: navbarBlurView)
        self.albumArtTopConstraint = self.albumArtImageView.positionBelow(navbarBlurView)
        self.albumArtHeightConstraint = self.albumArtImageView.sizeHeightToWidth(of: self.view)
        self.albumArtImageView.pinToSideEdgesOfSuperview()

        // Setup the table view
        self.view.insertSubview(self.tableView, belowSubview: navbarBlurView)
        self.tableView.pinToEdgesOfSuperview()

        // Becuase we're making a totally custom "nav bar" handle the status bar frame change
        NotificationCenter.default.addObserver(
            self, selector: .statusBarFrameDidChange,
            name: .UIApplicationDidChangeStatusBarFrame,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func statusBarFrameDidChange(_ notification: Notification) {
        let screenWidth = UIScreen.main.bounds.width
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        if let frame = (notification as NSNotification).userInfo?[UIApplicationStatusBarFrameUserInfoKey] as? CGRect {
            let height = frame.height
            self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(height+self.navbarHeight, 0, 0, 0)
            self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: screenWidth+statusBarHeight+self.navbarHeight))
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tracks = self.album?["tracks"] as? [String]
        return tracks?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableViewCell.identifier(), for: indexPath) as! TrackTableViewCell
        let tracks = self.album?["tracks"] as? [String]
        cell.textLabel?.text = tracks?[(indexPath as NSIndexPath).row]
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // Custom stretch scroll effect
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            self.albumArtTopConstraint.constant = -scrollView.contentOffset.y
            self.albumArtHeightConstraint.constant = 0
        } else {
            self.albumArtHeightConstraint.constant = -scrollView.contentOffset.y
            self.albumArtTopConstraint.constant = 0
        }
    }

}
