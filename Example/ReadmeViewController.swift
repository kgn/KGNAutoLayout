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
        "Center - centerViewsHorizontally_separation20:",
        "Center - centerViewsVertically_separation20:",
        "Center - centerHorizontallyToItem:",
        "Center - centerVerticallyToItem:",

        "Size - sizeToWidth80:",
        "Size - sizeToMinWidth40:",
        "Size - sizeToMaxWidth100:",
        "Size - sizeToHeight80:",
        "Size - sizeToMinHeight40:",
        "Size - sizeToMaxHeight100:",
        "Size - sizeToWidthAndHeight80:",
        "Size - sizeToMinWidthAndHeight40:",
        "Size - sizeToMaxWidthAndHeight100:",
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

        "Fill - fillHorizontally_separation20:",
        "Fill - fillVertically_separation20:",

        "Bound - boundHorizontally_separation20:",
        "Bound - boundVertically_separation20:"
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

    func centerViewsHorizontally_separation20(parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .Vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

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

        parentView.centerViewsHorizontally([view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheRightOfItem(view1)
        springView1.positionToTheLeftOfItem(view2)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRightOfItem(view2)
        springView2.positionToTheLeftOfItem(view3)
        springView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "parentView.centerViewsHorizontally([view1, view2, view3], separation: 20)"
        )
    }

    func centerViewsVertically_separation20(parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()
        
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

        let springView1 = SpringView()
        springView1.direction = .Vertical
        parentView.addSubview(springView1)
        springView1.positionBelowItem(view1)
        springView1.positionAboveItem(view2)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .Vertical
        parentView.addSubview(springView2)
        springView2.positionBelowItem(view2)
        springView2.positionAboveItem(view3)
        springView2.centerHorizontallyInSuperview()

        parentView.centerViewsVertically([view1, view2, view3], separation: 20)

        parentView.saveSnapshot(__FUNCTION__,
            "parentView.centerViewsVertically([view1, view2, view3], separation: 20)"
        )
    }

    func centerHorizontallyToItem(parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .Vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()

        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerHorizontallyInSuperview(offset: 40)
        itemView.sizeToWidthAndHeight(30)
        itemView.pinToBottomEdgeOfSuperview()

        verticalSpringView.centerHorizontallyToItem(itemView)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopEdgeOfSuperview(offset: 20)
        view.centerHorizontallyToItem(itemView)
        view.sizeToWidth(60)
        view.sizeToHeight(80)

        parentView.saveSnapshot(__FUNCTION__,
            "view.centerHorizontallyToItem(itemView)"
        )
    }

    func centerVerticallyToItem(parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()

        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerVerticallyInSuperview(offset: 40)
        itemView.sizeToWidthAndHeight(30)
        itemView.pinToLeftEdgeOfSuperview()

        horizontalSpringView.centerVerticallyToItem(itemView)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToRightEdgeOfSuperview(offset: 30)
        view.centerVerticallyToItem(itemView)
        view.sizeToWidth(60)
        view.sizeToHeight(80)

        parentView.saveSnapshot(__FUNCTION__,
            "view.centerVerticallyToItem(itemView)"
        )
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

    func sizeToMinWidth40(parentView: SnapshotView) {
        // TODO
    }

    func sizeToMaxWidth100(parentView: SnapshotView) {
        // TODO
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

    func sizeToMinHeight40(parentView: SnapshotView) {
        // TODO
    }

    func sizeToMaxHeight100(parentView: SnapshotView) {
        // TODO
    }

    func sizeToWidthAndHeight80(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToWidthAndHeight(80)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .Vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeToWidthAndHeight(80)"
        )
    }

    func sizeToMinWidthAndHeight40(parentView: SnapshotView) {
        //TODO
    }

    func sizeToMaxWidthAndHeight100(parentView: SnapshotView) {
        //TODO
    }

    func sizeWidthToWidthOfItem(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(100)
        itemView.sizeToHeight(60)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeToHeight(80)
        view.sizeWidthToWidthOfItem(itemView)

        let horizontalSpringView1 = SpringView()
        view.addSubview(horizontalSpringView1)
        horizontalSpringView1.pinToSideEdgesOfSuperview()
        horizontalSpringView1.centerVerticallyInSuperview()

        let horizontalSpringView2 = SpringView()
        itemView.addSubview(horizontalSpringView2)
        horizontalSpringView2.pinToSideEdgesOfSuperview()
        horizontalSpringView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeWidthToWidthOfItem(itemView)"
        )
    }

    func sizeHeightToHeightOfItem(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(60)
        itemView.sizeToHeight(100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeToWidth(80)
        view.sizeHeightToHeightOfItem(itemView)

        let verticalSpringView1 = SpringView()
        verticalSpringView1.direction = .Vertical
        view.addSubview(verticalSpringView1)
        verticalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView1.centerHorizontallyInSuperview()

        let verticalSpringView2 = SpringView()
        verticalSpringView2.direction = .Vertical
        itemView.addSubview(verticalSpringView2)
        verticalSpringView2.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView2.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeHeightToHeightOfItem(itemView)"
        )
    }

    func sizeHeightToWidthOfItem(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(100)
        itemView.sizeToHeight(60)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeToWidth(80)
        view.sizeHeightToWidthOfItem(itemView)

        let itemViewHorizontalSpringView = SpringView()
        itemView.addSubview(itemViewHorizontalSpringView)
        itemViewHorizontalSpringView.pinToSideEdgesOfSuperview()
        itemViewHorizontalSpringView.centerVerticallyInSuperview()

        let viewHorizontalSpringView = SpringView()
        viewHorizontalSpringView.direction = .Vertical
        view.addSubview(viewHorizontalSpringView)
        viewHorizontalSpringView.pinToTopAndBottomEdgesOfSuperview()
        viewHorizontalSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeHeightToWidthOfItem(itemView)"
        )
    }

    func sizeWidthToHeightOfItem(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(60)
        itemView.sizeToHeight(100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeToHeight(80)
        view.sizeWidthToHeightOfItem(itemView)

        let itemViewHorizontalSpringView = SpringView()
        itemViewHorizontalSpringView.direction = .Vertical
        itemView.addSubview(itemViewHorizontalSpringView)
        itemViewHorizontalSpringView.pinToTopAndBottomEdgesOfSuperview()
        itemViewHorizontalSpringView.centerHorizontallyInSuperview()

        let viewHorizontalSpringView = SpringView()
        view.addSubview(viewHorizontalSpringView)
        viewHorizontalSpringView.pinToSideEdgesOfSuperview()
        viewHorizontalSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeWidthToHeightOfItem(itemView)"
        )
    }

    func sizeWidthAndHeightToWidthAndHeightOfItem(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(60)
        itemView.sizeToHeight(100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeWidthAndHeightToWidthAndHeightOfItem(itemView)

        let itemViewHorizontalSpringView1 = SpringView()
        itemViewHorizontalSpringView1.direction = .Vertical
        itemView.addSubview(itemViewHorizontalSpringView1)
        itemViewHorizontalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        itemViewHorizontalSpringView1.centerHorizontallyInSuperview()

        let itemViewHorizontalSpringView2 = SpringView()
        itemView.addSubview(itemViewHorizontalSpringView2)
        itemViewHorizontalSpringView2.pinToSideEdgesOfSuperview()
        itemViewHorizontalSpringView2.centerVerticallyInSuperview()

        let viewHorizontalSpringView1 = SpringView()
        viewHorizontalSpringView1.direction = .Vertical
        view.addSubview(viewHorizontalSpringView1)
        viewHorizontalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        viewHorizontalSpringView1.centerHorizontallyInSuperview()

        let viewHorizontalSpringView2 = SpringView()
        view.addSubview(viewHorizontalSpringView2)
        viewHorizontalSpringView2.pinToSideEdgesOfSuperview()
        viewHorizontalSpringView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeWidthAndHeightToWidthAndHeightOfItem(itemView)"
        )
    }

    func sizeHeightToWidthAspectRatio16by9(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToWidth(100)
        view.sizeHeightToWidthAspectRatio(16/9)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .Vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeHeightToWidthAspectRatio(16/9)"
        )
    }

    func sizeWidthToHeightAspectRatio16by9(parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToHeight(100)
        view.sizeWidthToHeightAspectRatio(16/9)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.sizeWidthToHeightAspectRatio(16/9)"
        )
    }

    // MARK: - Position

    func positionAboveItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidthAndHeight(60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToWidthAndHeight(80)
        view.centerHorizontallyInSuperview()
        view.positionAboveItem(itemView, offset: 20)

        let springView = SpringView()
        springView.direction = .Vertical
        parentView.addSubview(springView)
        springView.positionBelowItem(view)
        springView.positionAboveItem(itemView)
        springView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.positionAboveItem(itemView, offset: 20)"
        )
    }

    func positionToTheRightOfItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidthAndHeight(60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToWidthAndHeight(80)
        view.centerVerticallyInSuperview()
        view.positionToTheRightOfItem(itemView, offset: 20)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheRightOfItem(itemView)
        springView.positionToTheLeftOfItem(view)
        springView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.positionToTheRightOfItem(itemView, offset: 20)"
        )
    }

    func positionBelowItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidthAndHeight(60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToWidthAndHeight(80)
        view.centerHorizontallyInSuperview()
        view.positionBelowItem(itemView, offset: 20)

        let springView = SpringView()
        springView.direction = .Vertical
        parentView.addSubview(springView)
        springView.positionAboveItem(view)
        springView.positionBelowItem(itemView)
        springView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.positionBelowItem(itemView, offset: 20)"
        )
    }

    func positionToTheLeftOfItem_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidthAndHeight(60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.sizeToWidthAndHeight(80)
        view.centerVerticallyInSuperview()
        view.positionToTheLeftOfItem(itemView, offset: 20)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheLeftOfItem(itemView)
        springView.positionToTheRightOfItem(view)
        springView.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "view.positionToTheLeftOfItem(itemView, offset: 20)"
        )
    }

    func positionViewsAbove_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(60)
        itemView.sizeToHeight(20)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.sizeToWidth(60)
        view1.sizeToHeight(20)
        view1.centerHorizontallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.sizeToWidth(60)
        view2.sizeToHeight(20)
        view2.centerHorizontallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.sizeToWidth(60)
        view3.sizeToHeight(20)
        view3.centerHorizontallyInSuperview()

        itemView.positionViewsAbove([view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        springView1.direction = .Vertical
        parentView.addSubview(springView1)
        springView1.positionBelowItem(view1)
        springView1.positionAboveItem(view2)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .Vertical
        parentView.addSubview(springView2)
        springView2.positionBelowItem(view2)
        springView2.positionAboveItem(view3)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .Vertical
        parentView.addSubview(springView3)
        springView3.positionBelowItem(view3)
        springView3.positionAboveItem(itemView)
        springView3.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "itemView.positionViewsAbove([view1, view2, view3], offset: 20)"
        )
    }

    func positionViewsToTheRight_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(20)
        itemView.sizeToHeight(60)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.sizeToWidth(20)
        view1.sizeToHeight(60)
        view1.centerVerticallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.sizeToWidth(20)
        view2.sizeToHeight(60)
        view2.centerVerticallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.sizeToWidth(20)
        view3.sizeToHeight(60)
        view3.centerVerticallyInSuperview()

        itemView.positionViewsToTheRight([view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheRightOfItem(itemView)
        springView1.positionToTheLeftOfItem(view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRightOfItem(view1)
        springView2.positionToTheLeftOfItem(view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRightOfItem(view2)
        springView3.positionToTheLeftOfItem(view3)
        springView3.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "itemView.positionViewsToTheRight([view1, view2, view3], offset: 20)"
        )
    }

    func positionViewsBelow_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(60)
        itemView.sizeToHeight(20)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.sizeToWidth(60)
        view1.sizeToHeight(20)
        view1.centerHorizontallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.sizeToWidth(60)
        view2.sizeToHeight(20)
        view2.centerHorizontallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.sizeToWidth(60)
        view3.sizeToHeight(20)
        view3.centerHorizontallyInSuperview()

        itemView.positionViewsBelow([view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        springView1.direction = .Vertical
        parentView.addSubview(springView1)
        springView1.positionBelowItem(itemView)
        springView1.positionAboveItem(view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .Vertical
        parentView.addSubview(springView2)
        springView2.positionBelowItem(view1)
        springView2.positionAboveItem(view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .Vertical
        parentView.addSubview(springView3)
        springView3.positionBelowItem(view2)
        springView3.positionAboveItem(view3)
        springView3.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "itemView.positionViewsBelow([view1, view2, view3], offset: 20)"
        )
    }

    func positionViewsToTheLeft_offset20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.sizeToWidth(20)
        itemView.sizeToHeight(60)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.sizeToWidth(20)
        view1.sizeToHeight(60)
        view1.centerVerticallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.sizeToWidth(20)
        view2.sizeToHeight(60)
        view2.centerVerticallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.sizeToWidth(20)
        view3.sizeToHeight(60)
        view3.centerVerticallyInSuperview()

        itemView.positionViewsToTheLeft([view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheLeftOfItem(itemView)
        springView1.positionToTheRightOfItem(view3)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheLeftOfItem(view3)
        springView2.positionToTheRightOfItem(view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheLeftOfItem(view2)
        springView3.positionToTheRightOfItem(view1)
        springView3.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "itemView.positionViewsToTheLeft([view1, view2, view3], offset: 20)"
        )
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
        bottomView.sizeToWidthAndHeight(30)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(topItem: topView, bottomItem: bottomView, offset: 20)
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
            "view.fitBetween(topItem: topView, bottomItem: bottomView, offset: 20)"
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
        rightView.sizeToWidthAndHeight(30)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(leftItem: leftView, rightItem: rightView, offset: 20)
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
            "view.fitBetween(leftItem: leftView, rightItem: rightView, offset: 20)"
        )
    }

    // MARK: - Fill

    func fillHorizontally_separation20(parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.sizeToHeight(80)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.sizeToHeight(60)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.sizeToHeight(100)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.pinToLeftEdgeOfSuperview()
        springView1.positionToTheLeftOfItem(view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRightOfItem(view1)
        springView2.positionToTheLeftOfItem(view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRightOfItem(view2)
        springView3.positionToTheLeftOfItem(view3)
        springView3.centerVerticallyInSuperview()

        let springView4 = SpringView()
        parentView.addSubview(springView4)
        springView4.positionToTheRightOfItem(view3)
        springView4.pinToRightEdgeOfSuperview()
        springView4.centerVerticallyInSuperview()

        parentView.fillHorizontally([view1, view2, view3], separation: 20)

        parentView.saveSnapshot(__FUNCTION__,
            "parentView.fillHorizontally([view1, view2, view3], separation: 20)"
        )
    }

    func fillVertically_separation20(parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.sizeToWidth(80)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.sizeToWidth(60)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.sizeToWidth(100)

        let springView1 = SpringView()
        springView1.direction = .Vertical
        parentView.addSubview(springView1)
        springView1.pinToTopEdgeOfSuperview()
        springView1.positionAboveItem(view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .Vertical
        parentView.addSubview(springView2)
        springView2.positionBelowItem(view1)
        springView2.positionAboveItem(view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .Vertical
        parentView.addSubview(springView3)
        springView3.positionBelowItem(view2)
        springView3.positionAboveItem(view3)
        springView3.centerHorizontallyInSuperview()

        let springView4 = SpringView()
        springView4.direction = .Vertical
        parentView.addSubview(springView4)
        springView4.positionBelowItem(view3)
        springView4.pinToBottomEdgeOfSuperview()
        springView4.centerHorizontallyInSuperview()

        parentView.fillVertically([view1, view2, view3], separation: 20)

        parentView.saveSnapshot(__FUNCTION__,
            "parentView.fillVertically([view1, view2, view3], separation: 20)"
        )
    }

    // MARK: - Bound

    func boundHorizontally_separation20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerInSuperview()
        itemView.sizeToHeight(160)

        let view1 = LayoutView()
        itemView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.sizeToWidthAndHeight(60)

        let view2 = LayoutView()
        itemView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.sizeToWidthAndHeight(30)

        let view3 = LayoutView()
        itemView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.sizeToWidthAndHeight(80)

        itemView.boundHorizontally([view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.pinLeftEdgeToLeftEdgeOfItem(itemView)
        springView1.positionToTheLeftOfItem(view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRightOfItem(view1)
        springView2.positionToTheLeftOfItem(view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRightOfItem(view2)
        springView3.positionToTheLeftOfItem(view3)
        springView3.centerVerticallyInSuperview()

        let springView4 = SpringView()
        parentView.addSubview(springView4)
        springView4.positionToTheRightOfItem(view3)
        springView4.pinRightEdgeToRightEdgeOfItem(itemView)
        springView4.centerVerticallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "itemView.boundHorizontally([view1, view2, view3], separation: 20)"
        )
    }

    func boundVertically_separation20(parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerInSuperview()
        itemView.sizeToWidth(160)

        let view1 = LayoutView()
        itemView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.sizeToWidthAndHeight(60)

        let view2 = LayoutView()
        itemView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.sizeToWidthAndHeight(30)

        let view3 = LayoutView()
        itemView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.sizeToWidthAndHeight(80)

        itemView.boundVertically([view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        springView1.direction = .Vertical
        parentView.addSubview(springView1)
        springView1.pinTopEdgeToTopEdgeOfItem(itemView)
        springView1.positionAboveItem(view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .Vertical
        parentView.addSubview(springView2)
        springView2.positionBelowItem(view1)
        springView2.positionAboveItem(view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .Vertical
        parentView.addSubview(springView3)
        springView3.positionBelowItem(view2)
        springView3.positionAboveItem(view3)
        springView3.centerHorizontallyInSuperview()

        let springView4 = SpringView()
        springView4.direction = .Vertical
        parentView.addSubview(springView4)
        springView4.positionBelowItem(view3)
        springView4.pinBottomEdgeToBottomEdgeOfItem(itemView)
        springView4.centerHorizontallyInSuperview()

        parentView.saveSnapshot(__FUNCTION__,
            "itemView.boundVertically([view1, view2, view3], separation: 20)"
        )
    }

}
