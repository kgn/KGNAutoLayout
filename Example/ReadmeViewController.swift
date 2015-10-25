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
        "Center - centerVerticallyToItem:",

        "Size - sizeToWidth80:",
        "Size - sizeToHeight80:",
        "Size - sizeToWidthAndHeight80:",
        "Size - sizeWidthToWidthOfItem:",
        "Size - sizeHeightToHeightOfItem:",
        "Size - sizeHeightToWidthOfItem:",
        "Size - sizeWidthToHeightOfItem:",
        "Size - sizeWidthAndHeightToWidthAndHeightOfItem:",
        "Size - sizeHeightToWidthAspectRatio16by9:",
        "Size - sizeWidthToHeightAspectRatio16by9:",

        "Position - positionAboveItem_offset20:",
        "Position - positionToTheRightOfItem_offset20:",
        "Position - positionBelowItem_offset20:",
        "Position - positionToTheLeftOfItem_offset20:",
        "Position - positionViewsAbove_offset20:",
        "Position - positionViewsToTheRight_offset20:",
        "Position - positionViewsBelow_offset20:",
        "Position - positionViewsToTheLeft_offset20:",

        "Between - fitBetweenTopAndBottomItems_offset20:",
        "Between - fitBetweenLeftAndRightItems_offset20:",

        "Fill - fillHorizontally:",
        "Fill - fillVertically:",

        "Bound - boundHorizontally:",
        "Bound - boundVertically:"
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

    // MARK: - Pin: Superview

    func pinToEdgesOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToEdgesOfSuperview(offset: 20)

        let topSpringView = SpringView()
        topSpringView.direction = .Vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAboveItem(view)
        topSpringView.centerHorizontallyInSuperview()

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRightOfItem(view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .Vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelowItem(view)
        bottomSpringView.centerHorizontallyInSuperview()

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeftOfItem(view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinToEdgesOfSuperview(offset: 20)"
        )
    }

    func pinToTopEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopEdgeOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(160)

        let topSpringView = SpringView()
        topSpringView.direction = .Vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAboveItem(view)
        topSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinToTopEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToRightEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToRightEdgeOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToWidthAndHeight(160)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRightOfItem(view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinToRightEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToBottomEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToBottomEdgeOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidthAndHeight(160)

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .Vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelowItem(view)
        bottomSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinToBottomEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToLeftEdgeOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToLeftEdgeOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToWidthAndHeight(160)

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeftOfItem(view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinToLeftEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToSideEdgesOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToSideEdgesOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToHeight(100)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRightOfItem(view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeftOfItem(view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinToSideEdgesOfSuperview(offset: 20)"
        )
    }

    func pinToTopAndBottomEdgesOfSuperview_offset20(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopAndBottomEdgesOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidth(100)

        let topSpringView = SpringView()
        topSpringView.direction = .Vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAboveItem(view)
        topSpringView.centerHorizontallyInSuperview()

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .Vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelowItem(view)
        bottomSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinToTopAndBottomEdgesOfSuperview(offset: 20)"
        )
    }

    // MARK: - Pin: Edges

    func pinTopEdgeToTopEdgeOfItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()
        itemView.sizeToWidthAndHeight(60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinTopEdgeToTopEdgeOfItem(itemView, offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidth(60)
        view.sizeToHeight(80)

        let springView = SpringView()
        springView.direction = .Vertical
        parentView.addSubview(springView)
        springView.positionAboveItem(view)
        springView.pinTopEdgeToTopEdgeOfItem(itemView)
        springView.centerHorizontallyToItem(view)

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinTopEdgeToTopEdgeOfItem(itemView, offset: 20)"
        )
    }

    func pinRightEdgeToRightEdgeOfItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()
        itemView.sizeToWidthAndHeight(60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinRightEdgeToRightEdgeOfItem(itemView, offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToWidth(80)
        view.sizeToHeight(60)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheRightOfItem(view)
        springView.pinRightEdgeToRightEdgeOfItem(itemView)
        springView.centerVerticallyToItem(view)

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinRightEdgeToRightEdgeOfItem(itemView, offset: 20)"
        )
    }

    func pinBottomEdgeToBottomEdgeOfItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()
        itemView.sizeToWidthAndHeight(60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinBottomEdgeToBottomEdgeOfItem(itemView, offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidth(60)
        view.sizeToHeight(80)

        let springView = SpringView()
        springView.direction = .Vertical
        parentView.addSubview(springView)
        springView.positionBelowItem(view)
        springView.pinBottomEdgeToBottomEdgeOfItem(itemView)
        springView.centerHorizontallyToItem(view)

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinBottomEdgeToBottomEdgeOfItem(itemView, offset: 20)"
        )
    }

    func pinLeftEdgeToLeftEdgeOfItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()
        itemView.sizeToWidthAndHeight(60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinLeftEdgeToLeftEdgeOfItem(itemView, offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToWidth(80)
        view.sizeToHeight(60)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheLeftOfItem(view)
        springView.pinLeftEdgeToLeftEdgeOfItem(itemView)
        springView.centerVerticallyToItem(view)

        parentView.saveSnapshot(__FUNCTION__,
            "view.pinLeftEdgeToLeftEdgeOfItem(itemView, offset: 20)"
        )
    }

    // MARK: - Center

    func centerInSuperview(parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()

        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .Vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "view.centerInSuperview()"
        )
    }

    func centerHorizontallyInSuperview(parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .Vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerHorizontallyInSuperview()
        view.pinToTopEdgeOfSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "view.centerHorizontallyInSuperview()"
        )
    }

    func centerVerticallyInSuperview(parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerVerticallyInSuperview()
        view.pinToLeftEdgeOfSuperview()
        view.sizeToWidthAndHeight(160)

        parentView.saveSnapshot(__FUNCTION__,
            "view.centerVerticallyInSuperview()"
        )
    }

    func centerViewsHorizontally(parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()

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
            "parentView.centerViewsHorizontally([view1, view2, view3])"
        )
    }

    func centerViewsVertically(parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .Vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

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

    func sizeToWidth80(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToWidth(80)
        view.sizeToHeight(100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeToWidth(80)"
        )
    }

    func sizeToHeight80(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToHeight(80)
        view.sizeToWidth(100)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .Vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeToHeight(80)"
        )
    }

    func sizeToWidthAndHeight80(parentView: SnapshotView) {
        // TODO
    }

    func sizeWidthToWidthOfItem(parentView: SnapshotView) {
        // TODO
    }

    func sizeHeightToHeightOfItem(parentView: SnapshotView) {
        // TODO
    }

    func sizeHeightToWidthOfItem(parentView: SnapshotView) {
        // TODO
    }

    func sizeWidthToHeightOfItem(parentView: SnapshotView) {
        // TODO
    }

    func sizeWidthAndHeightToWidthAndHeightOfItem(parentView: SnapshotView) {
        // TODO
    }

    func sizeHeightToWidthAspectRatio16by9(parentView: SnapshotView) {
        // TODO
    }

    func sizeWidthToHeightAspectRatio16by9(parentView: SnapshotView) {
        // TODO
    }

    // MARK: - Position

    func positionAboveItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    func positionToTheRightOfItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    func positionBelowItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    func positionToTheLeftOfItem_offset20(parentView: SnapshotView) {
        // TODO
    }

    func positionViewsAbove_offset20(parentView: SnapshotView) {
        // TODO
    }

    func positionViewsToTheRight_offset20(parentView: SnapshotView) {
        // TODO
    }

    func positionViewsBelow_offset20(parentView: SnapshotView) {
        // TODO
    }

    func positionViewsToTheLeft_offset20(parentView: SnapshotView) {
        // TODO
    }

    // MARK: - Between

    func fitBetweenTopAndBottomItems_offset20(parentView: SnapshotView) {
        let topView = ItemView()
        parentView.addSubview(topView)
        topView.pinToTopEdgeOfSuperview()
        topView.centerHorizontallyInSuperview()
        topView.sizeToWidthAndHeight(60)

        let bottomView = ItemView()
        parentView.addSubview(bottomView)
        bottomView.pinToBottomEdgeOfSuperview()
        bottomView.centerHorizontallyInSuperview()
        bottomView.sizeToWidthAndHeight(80)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(topView, bottomItem: bottomView, offset: 20)
        view.centerHorizontallyInSuperview()
        view.sizeToWidth(80)

        let topSpringView = SpringView()
        topSpringView.direction = .Vertical
        parentView.addSubview(topSpringView)
        topSpringView.positionBelowItem(topView)
        topSpringView.positionAboveItem(view)
        topSpringView.centerHorizontallyToItem(view)

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .Vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.positionBelowItem(view)
        bottomSpringView.positionAboveItem(bottomView)
        bottomSpringView.centerHorizontallyToItem(view)

        parentView.saveSnapshot(__FUNCTION__,
            "view.fitBetween(topView, bottomItem: bottomView, offset: 20)"
        )
    }

    func fitBetweenLeftAndRightItems_offset20(parentView: SnapshotView) {
        let leftView = ItemView()
        parentView.addSubview(leftView)
        leftView.pinToLeftEdgeOfSuperview()
        leftView.centerVerticallyInSuperview()
        leftView.sizeToWidthAndHeight(60)

        let rightView = ItemView()
        parentView.addSubview(rightView)
        rightView.pinToRightEdgeOfSuperview()
        rightView.centerVerticallyInSuperview()
        rightView.sizeToWidthAndHeight(80)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(leftView, rightItem: rightView, offset: 20)
        view.centerVerticallyInSuperview()
        view.sizeToHeight(80)

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.positionToTheRightOfItem(leftView)
        leftSpringView.positionToTheLeftOfItem(view)
        leftSpringView.centerVerticallyToItem(view)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRightOfItem(view)
        rightSpringView.positionToTheLeftOfItem(rightView)
        rightSpringView.centerVerticallyToItem(view)

        parentView.saveSnapshot(__FUNCTION__,
            "view.fitBetween(leftView, rightItem: rightView, offset: 20)"
        )
    }

    // MARK: - Fill

    func fillHorizontally(parentView: SnapshotView) {
        // TODO
    }

    func fillVertically(parentView: SnapshotView) {
        // TODO
    }

    // MARK: - Bound

    func boundHorizontally(parentView: SnapshotView) {
        // TODO
    }

    func boundVertically(parentView: SnapshotView) {
        // TODO
    }

}
