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
        "Pin: Superview - pinToEdgesOfSuperview_offset10:",
        "Pin: Superview - pinToTopEdgeOfSuperview_offset10:",
        "Pin: Superview - pinToRightEdgeOfSuperview_offset10:",
        "Pin: Superview - pinToBottomEdgeOfSuperview_offset10:",
        "Pin: Superview - pinToLeftEdgeOfSuperview_offset10:",
        "Pin: Superview - pinToSideEdgesOfSuperview_offset10:",
        "Pin: Superview - pinToTopAndBottomEdgesOfSuperview_offset10:",
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

    func pinToEdgesOfSuperview_offset10(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToEdgesOfSuperview(offset: 10)
        
        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToEdgesOfSuperview(offset: 10)"
        )
    }

    func pinToTopEdgeOfSuperview_offset10(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToTopEdgeOfSuperview(offset: 10)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(80)

        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToTopEdgeOfSuperview(offset: 10)",
            "",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidthAndHeight(80)"
        )
    }

    func pinToRightEdgeOfSuperview_offset10(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToRightEdgeOfSuperview(offset: 10)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(80)

        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToRightEdgeOfSuperview(offset: 10)",
            "",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidthAndHeight(80)"
        )
    }

    func pinToBottomEdgeOfSuperview_offset10(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToBottomEdgeOfSuperview(offset: 10)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(80)

        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToBottomEdgeOfSuperview(offset: 10)",
            "",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidthAndHeight(80)"
        )
    }

    func pinToLeftEdgeOfSuperview_offset10(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToLeftEdgeOfSuperview(offset: 10)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(80)

        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToLeftEdgeOfSuperview(offset: 10)",
            "",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidthAndHeight(80)"
        )
    }

    func pinToSideEdgesOfSuperview_offset10(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToSideEdgesOfSuperview(offset: 10)
        view.centerVerticallyInSuperview()

        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToSideEdgesOfSuperview(offset: 10)",
            "",
            "view.centerVerticallyInSuperview()"
        )
    }

    func pinToTopAndBottomEdgesOfSuperview_offset10(snapshotView: SnapshotView) {
        let view = ItemView()
        snapshotView.addSubview(view)
        view.pinToTopAndBottomEdgesOfSuperview(offset: 10)
        view.centerHorizontallyInSuperview()

        snapshotView.saveSnapshot(__FUNCTION__,
            "view.pinToTopAndBottomEdgesOfSuperview(offset: 10)",
            "",
            "view.centerHorizontallyInSuperview()"
        )
    }

}
