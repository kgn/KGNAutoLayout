//
//  ReadmeViewController.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/23/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

// To generate the images @1x use the iPad 2 simulator

import UIKit
import KGNAutoLayout

class ReadmeViewController: UIViewController {

    let snapshots = [
        "Pin: Superview - pinToEdgesOfSuperview_offset20:",
        "Pin: Superview - pinToTopEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToRightEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToBottomEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToLeftEdgeOfSuperview_offset20:",
        "Pin: Superview - pinToSideEdgesOfSuperview_offset20:",
        "Pin: Superview - pinToTopAndBottomEdgesOfSuperview_offset20:",

        "Pin: Edges - pinTopEdgeToTopEdgeOfItem_offset20:",
        "Pin: Edges - pinRightEdgeToRightEdgeOfItem_offset20:",
        "Pin: Edges - pinBottomEdgeToBottomEdgeOfItem_offset20:",
        "Pin: Edges - pinLeftEdgeToLeftEdgeOfItem_offset20:",

        "Center - centerInSuperview:",
        "Center - centerHorizontallyInSuperview:",
        "Center - centerVerticallyInSuperview:",
        "Center - centerViewsHorizontally:",
        "Center - centerViewsVertically:",
        "Center - centerHorizontallyToItem:",
        "Center - centerVerticallyToItem:"
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
                print("--")
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

    // MARK: - Pin: Superview

    func pinToEdgesOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToEdgesOfSuperview(offset: 20)
        
        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.pinToEdgesOfSuperview(offset: 20)"
        )
    }

    func pinToTopEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopEdgeOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.pinToTopEdgeOfSuperview(offset: 20)",
            "",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidthAndHeight(160)"
        )
    }

    func pinToRightEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToRightEdgeOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.pinToRightEdgeOfSuperview(offset: 20)",
            "",
            "view.centerVerticallyInSuperview()",
            "view.sizeToWidthAndHeight(160)"
        )
    }

    func pinToBottomEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToBottomEdgeOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.pinToBottomEdgeOfSuperview(offset: 20)",
            "",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidthAndHeight(160)"
        )
    }

    func pinToLeftEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToLeftEdgeOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.pinToLeftEdgeOfSuperview(offset: 20)",
            "",
            "view.centerVerticallyInSuperview()",
            "view.sizeToWidthAndHeight(160)"
        )
    }

    func pinToSideEdgesOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToSideEdgesOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToHeight(100)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.pinToSideEdgesOfSuperview(offset: 20)",
            "",
            "view.centerVerticallyInSuperview()",
            "view.sizeToHeight(100)"
        )
    }

    func pinToTopAndBottomEdgesOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopAndBottomEdgesOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidth(100)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.pinToTopAndBottomEdgesOfSuperview(offset: 20)",
            "",
            "view.centerHorizontallyInSuperview()",
            "view.sizeToWidth(100)"
        )
    }

    // MARK: - Pin: Edges

    func pinTopEdgeToTopEdgeOfItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    func pinRightEdgeToRightEdgeOfItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    func pinBottomEdgeToBottomEdgeOfItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    func pinLeftEdgeToLeftEdgeOfItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    // MARK: - Center

    func centerInSuperview(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.centerInSuperview()",
            "",
            "view.sizeToWidthAndHeight(160)"
        )
    }

    func centerHorizontallyInSuperview(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.centerHorizontallyInSuperview()
        view.pinToTopEdgeOfSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.centerHorizontallyInSuperview()",
            "",
            "view.pinToTopEdgeOfSuperview()",
            "view.sizeToWidthAndHeight(160)"
        )
    }

    func centerVerticallyInSuperview(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.centerVerticallyInSuperview()
        view.pinToLeftEdgeOfSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "let view = UIView()",
            "parentView.addSubview(view)",
            "",
            "view.centerVerticallyInSuperview()",
            "",
            "view.pinToLeftEdgeOfSuperview()",
            "view.sizeToWidthAndHeight(160)"
        )
    }

    func centerViewsHorizontally(parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.sizeToWidthAndHeight(60)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.sizeToWidthAndHeight(80)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.sizeToWidthAndHeight(50)

        parentView.centerViewsHorizontally([view1, view2, view3])

        parentView.saveSnapshot(__FUNCTION__,
            "let view1 = UIView()",
            "parentView.addSubview(view1)",
            "view1.centerVerticallyInSuperview()",
            "view1.sizeToWidthAndHeight(60)",
            "",
            "let view2 = UIView()",
            "parentView.addSubview(view2)",
            "view2.centerVerticallyInSuperview()",
            "view2.sizeToWidthAndHeight(80)",
            "",
            "let view3 = UIView()",
            "parentView.addSubview(view3)",
            "view3.centerVerticallyInSuperview()",
            "iew3.sizeToWidthAndHeight(50)",
            "",
            "parentView.centerViewsHorizontally([view1, view2, view3])"
        )
    }

    func centerViewsVertically(parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.sizeToWidthAndHeight(60)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.sizeToWidthAndHeight(80)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.sizeToWidthAndHeight(50)

        parentView.centerViewsVertically([view1, view2, view3])

        parentView.saveSnapshot(__FUNCTION__,
            "let view1 = UIView()",
            "parentView.addSubview(view1)",
            "view1.centerHorizontallyInSuperview()",
            "view1.sizeToWidthAndHeight(60)",
            "",
            "let view2 = UIView()",
            "parentView.addSubview(view2)",
            "view2.centerHorizontallyInSuperview()",
            "view2.sizeToWidthAndHeight(80)",
            "",
            "let view3 = UIView()",
            "parentView.addSubview(view3)",
            "view3.centerHorizontallyInSuperview()",
            "iew3.sizeToWidthAndHeight(50)",
            "",
            "parentView.centerViewsVertically([view1, view2, view3])"
        )
    }

    func centerHorizontallyToItem(parentView: SnapshotView) {
        // TODO
//        let itemView = ItemView()
//        parentView.addSubview(itemView)
//        itemView.centerInSuperview()
//        itemView.sizeToWidthAndHeight(60)
//
//        let view = LayoutView()
//        parentView.addSubview(view)
//        view.positionToTheRightOfItem(itemView)
//        view.centerHorizontallyToItem(itemView)
//        view.sizeToWidth(40)
//        view.sizeToHeight(80)
//
//        parentView.saveSnapshot(__FUNCTION__,
//            "let itemView = UIView()",
//            "parentView.addSubview(itemView)",
//            "itemView.centerInSuperview()",
//            "itemView.sizeToWidthAndHeight(60)",
//            "",
//            "let view = UIView()",
//            "parentView.addSubview(view)",
//            "view.positionToTheRightOfItem(itemView)",
//            "",
//            "view.centerHorizontallyToItem(itemView)",
//            "",
//            "view.sizeToWidth(40)",
//            "view.sizeToHeight(80)"
//        )
    }

    func centerVerticallyToItem(parentView: SnapshotView) {
        // TODO
    }

    // MARK: - Size

    // MARK: - Position

    // MARK: - Between

    // MARK: - Fill

    // MARK: - Bound

}
