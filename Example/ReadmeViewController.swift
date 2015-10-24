//
//  ReadmeViewController.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/23/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit
import KGNAutoLayout

class ReadmeViewController: UIViewController {

    let snapshots = [
        "Pin: Superview - pinToEdgesOfSuperview_offset20:",
        "Pin: Superview - pinToTopEdgeOfSuperview_offset20:"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        var lastTitle: String!
        for snapshot in self.snapshots {
            let values = snapshot.characters.split{$0 == "-"}.map(String.init)
            let title = values.first!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            let selector = values.last!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

            if title != lastTitle {
                print("### \(title)")
                lastTitle = title
            }

            let snapshotView = SnapshotView()
            self.view.addSubview(snapshotView)
            snapshotView.centerInSuperview()
            self.performSelector(Selector(selector), withObject: snapshotView)
            snapshotView.removeFromSuperview()
        }
        print("Cache Directory: \(SnapshotView.cacheDirectory())")
    }

    func pinToEdgesOfSuperview_offset20(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToEdgesOfSuperview(offset: 20)
        
        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToEdgesOfSuperview(offset: 20)"
        )
    }

    func pinToTopEdgeOfSuperview_offset20(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToTopEdgeOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(160)

        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToTopEdgeOfSuperview(offset: 20)",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidthAndHeight(160)"
        )
    }

}
