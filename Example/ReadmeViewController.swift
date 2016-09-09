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

        self.view.backgroundColor = UIColor.white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        var lastTitle: String!
        for snapshot in self.snapshots {
            let values = snapshot.characters.split{$0 == "-"}.map(String.init)
            let title = values.first!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let selector = values.last!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

            if title != lastTitle {
                print("### \(title)")
                lastTitle = title
            }

            let snapshotView = SnapshotView()
            self.view.addSubview(snapshotView)
            snapshotView.centerInSuperview()
            self.perform(Selector(selector), with: snapshotView)
            snapshotView.removeFromSuperview()
        }
        print("Cache Directory: \(SnapshotView.cacheDirectory())")
    }

    // MARK: - Pin: Superview

    func pinToEdgesOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToEdgesOfSuperview(offset: 20)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAbove(item: view)
        topSpringView.centerHorizontallyInSuperview()

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(ofItem: view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelow(item: view)
        bottomSpringView.centerHorizontallyInSuperview()

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeft(ofItem: view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToEdgesOfSuperview(offset: 20)"
        )
    }

    func pinToTopEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopEdgeOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAbove(item: view)
        topSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToTopEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToRightEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToRightEdgeOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(ofItem: view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToRightEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToBottomEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToBottomEdgeOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelow(item: view)
        bottomSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToBottomEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToLeftEdgeOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToLeftEdgeOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidthAndHeight: 160)

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeft(ofItem: view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToLeftEdgeOfSuperview(offset: 20)"
        )
    }

    func pinToSideEdgesOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToSideEdgesOfSuperview(offset: 20)
        view.centerVerticallyInSuperview()
        view.size(toHeight: 100)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(ofItem: view)
        rightSpringView.pinToRightEdgeOfSuperview()
        rightSpringView.centerVerticallyInSuperview()

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.pinToLeftEdgeOfSuperview()
        leftSpringView.positionToTheLeft(ofItem: view)
        leftSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToSideEdgesOfSuperview(offset: 20)"
        )
    }

    func pinToTopAndBottomEdgesOfSuperview_offset20(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopAndBottomEdgesOfSuperview(offset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 100)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.pinToTopEdgeOfSuperview()
        topSpringView.positionAbove(item: view)
        topSpringView.centerHorizontallyInSuperview()

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.pinToBottomEdgeOfSuperview()
        bottomSpringView.positionBelow(item: view)
        bottomSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.pinToTopAndBottomEdgesOfSuperview(offset: 20)"
        )
    }

    // MARK: - Pin: Edges

    func pinTopEdgeToTopEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinTopEdgeToTopEdge(ofItem: itemView, offset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionAbove(item: view)
        springView.pinTopEdgeToTopEdge(ofItem: itemView)
        springView.centerHorizontally(toItem: view)

        parentView.saveSnapshot(#function,
            "view.pinTopEdgeToTopEdge(ofItem: itemView, offset: 20)"
        )
    }

    func pinRightEdgeToRightEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinRightEdgeToRightEdge(ofItem: itemView, offset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidth: 80)
        view.size(toHeight: 60)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheRight(ofItem: view)
        springView.pinRightEdgeToRightEdge(ofItem: itemView)
        springView.centerVertically(toItem: view)

        parentView.saveSnapshot(#function,
            "view.pinRightEdgeToRightEdge(ofItem: itemView, offset: 20)"
        )
    }

    func pinBottomEdgeToBottomEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinBottomEdgeToBottomEdge(ofItem: itemView, offset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionBelow(item: view)
        springView.pinBottomEdgeToBottomEdge(ofItem: itemView)
        springView.centerHorizontally(toItem: view)

        parentView.saveSnapshot(#function,
            "view.pinBottomEdgeToBottomEdge(ofItem: itemView, offset: 20)"
        )
    }

    func pinLeftEdgeToLeftEdgeOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()
        itemView.size(toWidthAndHeight: 60)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinLeftEdgeToLeftEdge(ofItem: itemView, offset: 20)
        view.centerVerticallyInSuperview()
        view.size(toWidth: 80)
        view.size(toHeight: 60)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheLeft(ofItem: view)
        springView.pinLeftEdgeToLeftEdge(ofItem: itemView)
        springView.centerVertically(toItem: view)

        parentView.saveSnapshot(#function,
            "view.pinLeftEdgeToLeftEdge(ofItem: itemView, offset: 20)"
        )
    }

    // MARK: - Center

    func centerInSuperview(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()

        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toWidthAndHeight: 160)

        parentView.saveSnapshot(#function,
            "view.centerInSuperview()"
        )
    }

    func centerHorizontallyInSuperview(_ parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerHorizontallyInSuperview()
        view.pinToTopEdgeOfSuperview()
        view.size(toWidthAndHeight: 160)

        parentView.saveSnapshot(#function,
            "view.centerHorizontallyInSuperview()"
        )
    }

    func centerVerticallyInSuperview(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerVerticallyInSuperview()
        view.pinToLeftEdgeOfSuperview()
        view.size(toWidthAndHeight: 160)

        parentView.saveSnapshot(#function,
            "view.centerVerticallyInSuperview()"
        )
    }

    func centerViewsHorizontally_separation20(_ parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView.centerHorizontallyInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.size(toWidthAndHeight: 80)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.size(toWidthAndHeight: 50)

        parentView.centerHorizontally(views: [view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheRight(ofItem: view1)
        springView1.positionToTheLeft(ofItem: view2)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(ofItem: view2)
        springView2.positionToTheLeft(ofItem: view3)
        springView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "parentView.centerHorizontally(views: [view1, view2, view3], separation: 20)"
        )
    }

    func centerViewsVertically_separation20(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()
        horizontalSpringView.centerVerticallyInSuperview()
        
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.size(toWidthAndHeight: 80)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.size(toWidthAndHeight: 50)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.positionBelow(item: view1)
        springView1.positionAbove(item: view2)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(item: view2)
        springView2.positionAbove(item: view3)
        springView2.centerHorizontallyInSuperview()

        parentView.centerVertically(views: [view1, view2, view3], separation: 20)

        parentView.saveSnapshot(#function,
            "parentView.centerVertically(views: [view1, view2, view3], separation: 20)"
        )
    }

    func centerHorizontallyToItem(_ parentView: SnapshotView) {
        let verticalSpringView = SpringView()
        verticalSpringView.showEnds = false
        verticalSpringView.direction = .vertical
        parentView.addSubview(verticalSpringView)
        verticalSpringView.pinToTopAndBottomEdgesOfSuperview()

        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerHorizontallyInSuperview(offset: 40)
        itemView.size(toWidthAndHeight: 30)
        itemView.pinToBottomEdgeOfSuperview()

        verticalSpringView.centerHorizontally(toItem: itemView)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToTopEdgeOfSuperview(offset: 20)
        view.centerHorizontally(toItem: itemView)
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        parentView.saveSnapshot(#function,
            "view.centerHorizontally(toItem: itemView)"
        )
    }

    func centerVerticallyToItem(_ parentView: SnapshotView) {
        let horizontalSpringView = SpringView()
        horizontalSpringView.showEnds = false
        parentView.addSubview(horizontalSpringView)
        horizontalSpringView.pinToSideEdgesOfSuperview()

        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerVerticallyInSuperview(offset: 40)
        itemView.size(toWidthAndHeight: 30)
        itemView.pinToLeftEdgeOfSuperview()

        horizontalSpringView.centerVertically(toItem: itemView)

        let view = LayoutView()
        parentView.addSubview(view)
        view.pinToRightEdgeOfSuperview(offset: 30)
        view.centerVertically(toItem: itemView)
        view.size(toWidth: 60)
        view.size(toHeight: 80)

        parentView.saveSnapshot(#function,
            "view.centerVertically(toItem: itemView)"
        )
    }

    // MARK: - Size

    func sizeToWidth80(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidth: 80)
        view.size(toHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toWidth: 80)"
        )
    }

    func sizeToMinWidth40(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toMinWidth: 40)
        view.size(toHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMinWidth: 40)"
        )
    }

    func sizeToMaxWidth100(_ parentView: SnapshotView) {
        let view = LayoutView()
        view.intrinsicContentWidth = 200
        parentView.addSubview(view)
        view.size(toMaxWidth: 100)
        view.size(toHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMaxWidth: 100)"
        )
    }

    func sizeToHeight80(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toHeight: 80)
        view.size(toWidth: 100)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toHeight: 80)"
        )
    }

    func sizeToMinHeight40(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toMinHeight: 40)
        view.size(toWidth: 80)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMinHeight: 40)"
        )
    }

    func sizeToMaxHeight100(_ parentView: SnapshotView) {
        let view = LayoutView()
        view.intrinsicContentHeight = 200
        parentView.addSubview(view)
        view.size(toMaxHeight: 100)
        view.size(toWidth: 100)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMaxHeight: 100)"
        )
    }

    func sizeToWidthAndHeight80(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toWidthAndHeight: 80)"
        )
    }

    func sizeToMinWidthAndHeight40(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toMinWidthAndHeight: 40)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMinWidthAndHeight: 40)"
        )
    }

    func sizeToMaxWidthAndHeight100(_ parentView: SnapshotView) {
        let view = LayoutView()
        view.intrinsicContentWidth = 200
        view.intrinsicContentHeight = 200
        parentView.addSubview(view)
        view.size(toMaxWidthAndHeight: 100)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.size(toMaxWidthAndHeight: 100)"
        )
    }

    func sizeWidthToWidthOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 100)
        itemView.size(toHeight: 60)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toHeight: 80)
        view.sizeWidthToWidth(ofItem: itemView)

        let horizontalSpringView1 = SpringView()
        view.addSubview(horizontalSpringView1)
        horizontalSpringView1.pinToSideEdgesOfSuperview()
        horizontalSpringView1.centerVerticallyInSuperview()

        let horizontalSpringView2 = SpringView()
        itemView.addSubview(horizontalSpringView2)
        horizontalSpringView2.pinToSideEdgesOfSuperview()
        horizontalSpringView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthToWidth(ofItem: itemView)"
        )
    }

    func sizeHeightToHeightOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toWidth: 80)
        view.sizeHeightToHeight(ofItem: itemView)

        let verticalSpringView1 = SpringView()
        verticalSpringView1.direction = .vertical
        view.addSubview(verticalSpringView1)
        verticalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView1.centerHorizontallyInSuperview()

        let verticalSpringView2 = SpringView()
        verticalSpringView2.direction = .vertical
        itemView.addSubview(verticalSpringView2)
        verticalSpringView2.pinToTopAndBottomEdgesOfSuperview()
        verticalSpringView2.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeHeightToHeight(ofItem: itemView)"
        )
    }

    func sizeHeightToWidthOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 100)
        itemView.size(toHeight: 60)
        itemView.pinToTopEdgeOfSuperview()
        itemView.centerHorizontallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toWidth: 80)
        view.sizeHeightToWidth(ofItem: itemView)

        let itemViewHorizontalSpringView = SpringView()
        itemView.addSubview(itemViewHorizontalSpringView)
        itemViewHorizontalSpringView.pinToSideEdgesOfSuperview()
        itemViewHorizontalSpringView.centerVerticallyInSuperview()

        let viewHorizontalSpringView = SpringView()
        viewHorizontalSpringView.direction = .vertical
        view.addSubview(viewHorizontalSpringView)
        viewHorizontalSpringView.pinToTopAndBottomEdgesOfSuperview()
        viewHorizontalSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeHeightToWidth(ofItem: itemView)"
        )
    }

    func sizeWidthToHeightOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.size(toHeight: 80)
        view.sizeWidthToHeight(ofItem: itemView)

        let itemViewHorizontalSpringView = SpringView()
        itemViewHorizontalSpringView.direction = .vertical
        itemView.addSubview(itemViewHorizontalSpringView)
        itemViewHorizontalSpringView.pinToTopAndBottomEdgesOfSuperview()
        itemViewHorizontalSpringView.centerHorizontallyInSuperview()

        let viewHorizontalSpringView = SpringView()
        view.addSubview(viewHorizontalSpringView)
        viewHorizontalSpringView.pinToSideEdgesOfSuperview()
        viewHorizontalSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthToHeight(ofItem: itemView)"
        )
    }

    func sizeWidthAndHeightToWidthAndHeightOfItem(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 100)
        itemView.pinToLeftEdgeOfSuperview()
        itemView.centerVerticallyInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.centerInSuperview()
        view.sizeWidthAndHeightToWidthAndHeight(ofItem: itemView)

        let itemViewHorizontalSpringView1 = SpringView()
        itemViewHorizontalSpringView1.direction = .vertical
        itemView.addSubview(itemViewHorizontalSpringView1)
        itemViewHorizontalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        itemViewHorizontalSpringView1.centerHorizontallyInSuperview()

        let itemViewHorizontalSpringView2 = SpringView()
        itemView.addSubview(itemViewHorizontalSpringView2)
        itemViewHorizontalSpringView2.pinToSideEdgesOfSuperview()
        itemViewHorizontalSpringView2.centerVerticallyInSuperview()

        let viewHorizontalSpringView1 = SpringView()
        viewHorizontalSpringView1.direction = .vertical
        view.addSubview(viewHorizontalSpringView1)
        viewHorizontalSpringView1.pinToTopAndBottomEdgesOfSuperview()
        viewHorizontalSpringView1.centerHorizontallyInSuperview()

        let viewHorizontalSpringView2 = SpringView()
        view.addSubview(viewHorizontalSpringView2)
        viewHorizontalSpringView2.pinToSideEdgesOfSuperview()
        viewHorizontalSpringView2.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthAndHeightToWidthAndHeight(ofItem: itemView)"
        )
    }

    func sizeHeightToWidthAspectRatio16by9(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidth: 100)
        view.sizeHeightToWidth(withAspectRatio: 16/9)
        view.centerInSuperview()

        let heightSpringView = SpringView()
        heightSpringView.direction = .vertical
        view.addSubview(heightSpringView)
        heightSpringView.pinToTopAndBottomEdgesOfSuperview()
        heightSpringView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeHeightToWidth(withAspectRatio: 16/9)"
        )
    }

    func sizeWidthToHeightAspectRatio16by9(_ parentView: SnapshotView) {
        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toHeight: 100)
        view.sizeWidthToHeight(withAspectRatio: 16/9)
        view.centerInSuperview()

        let widthSpringView = SpringView()
        view.addSubview(widthSpringView)
        widthSpringView.pinToSideEdgesOfSuperview()
        widthSpringView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.sizeWidthToHeight(withAspectRatio: 16/9)"
        )
    }

    // MARK: - Position

    func positionAboveItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerHorizontallyInSuperview()
        view.positionAbove(item: itemView, offset: 20)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionBelow(item: view)
        springView.positionAbove(item: itemView)
        springView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionAbove(item: itemView, offset: 20)"
        )
    }

    func positionToTheRightOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerVerticallyInSuperview()
        view.positionToTheRight(ofItem: itemView, offset: 20)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheRight(ofItem: itemView)
        springView.positionToTheLeft(ofItem: view)
        springView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionToTheRight(ofItem: itemView, offset: 20)"
        )
    }

    func positionBelowItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerHorizontallyInSuperview()
        view.positionBelow(item: itemView, offset: 20)

        let springView = SpringView()
        springView.direction = .vertical
        parentView.addSubview(springView)
        springView.positionAbove(item: view)
        springView.positionBelow(item: itemView)
        springView.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionBelow(item: itemView, offset: 20)"
        )
    }

    func positionToTheLeftOfItem_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidthAndHeight: 60)
        itemView.centerInSuperview()

        let view = LayoutView()
        parentView.addSubview(view)
        view.size(toWidthAndHeight: 80)
        view.centerVerticallyInSuperview()
        view.positionToTheLeft(ofItem: itemView, offset: 20)

        let springView = SpringView()
        parentView.addSubview(springView)
        springView.positionToTheLeft(ofItem: itemView)
        springView.positionToTheRight(ofItem: view)
        springView.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "view.positionToTheLeft(ofItem: itemView, offset: 20)"
        )
    }

    func positionViewsAbove_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 20)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 60)
        view1.size(toHeight: 20)
        view1.centerHorizontallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 60)
        view2.size(toHeight: 20)
        view2.centerHorizontallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 60)
        view3.size(toHeight: 20)
        view3.centerHorizontallyInSuperview()

        itemView.positionAbove(views: [view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.positionBelow(item: view1)
        springView1.positionAbove(item: view2)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(item: view2)
        springView2.positionAbove(item: view3)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(item: view3)
        springView3.positionAbove(item: itemView)
        springView3.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.positionAbove(views: [view1, view2, view3], offset: 20)"
        )
    }

    func positionViewsToTheRight_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 20)
        itemView.size(toHeight: 60)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 20)
        view1.size(toHeight: 60)
        view1.centerVerticallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 20)
        view2.size(toHeight: 60)
        view2.centerVerticallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 20)
        view3.size(toHeight: 60)
        view3.centerVerticallyInSuperview()

        itemView.positionToTheRight(views: [view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheRight(ofItem: itemView)
        springView1.positionToTheLeft(ofItem: view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(ofItem: view1)
        springView2.positionToTheLeft(ofItem: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRight(ofItem: view2)
        springView3.positionToTheLeft(ofItem: view3)
        springView3.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.positionToTheRight(views: [view1, view2, view3], offset: 20)"
        )
    }

    func positionViewsBelow_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 60)
        itemView.size(toHeight: 20)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 60)
        view1.size(toHeight: 20)
        view1.centerHorizontallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 60)
        view2.size(toHeight: 20)
        view2.centerHorizontallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 60)
        view3.size(toHeight: 20)
        view3.centerHorizontallyInSuperview()

        itemView.positionBelow(views: [view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.positionBelow(item: itemView)
        springView1.positionAbove(item: view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(item: view1)
        springView2.positionAbove(item: view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(item: view2)
        springView3.positionAbove(item: view3)
        springView3.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.positionBelow(views: [view1, view2, view3], offset: 20)"
        )
    }

    func positionViewsToTheLeft_offset20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.size(toWidth: 20)
        itemView.size(toHeight: 60)
        itemView.centerInSuperview()

        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.size(toWidth: 20)
        view1.size(toHeight: 60)
        view1.centerVerticallyInSuperview()

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.size(toWidth: 20)
        view2.size(toHeight: 60)
        view2.centerVerticallyInSuperview()

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.size(toWidth: 20)
        view3.size(toHeight: 60)
        view3.centerVerticallyInSuperview()

        itemView.positionToTheLeft(views: [view1, view2, view3], offset: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.positionToTheLeft(ofItem: itemView)
        springView1.positionToTheRight(ofItem: view3)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheLeft(ofItem: view3)
        springView2.positionToTheRight(ofItem: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheLeft(ofItem: view2)
        springView3.positionToTheRight(ofItem: view1)
        springView3.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.positionToTheLeft(views: [view1, view2, view3], offset: 20)"
        )
    }

    // MARK: - Between

    func fitBetweenTopAndBottomItems_offset20(_ parentView: SnapshotView) {
        let topView = ItemView()
        parentView.addSubview(topView)
        topView.pinToTopEdgeOfSuperview()
        topView.centerHorizontallyInSuperview()
        topView.size(toWidthAndHeight: 60)

        let bottomView = ItemView()
        parentView.addSubview(bottomView)
        bottomView.pinToBottomEdgeOfSuperview()
        bottomView.centerHorizontallyInSuperview()
        bottomView.size(toWidthAndHeight: 30)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(topItem: topView, bottomItem: bottomView, offset: 20)
        view.centerHorizontallyInSuperview()
        view.size(toWidth: 80)

        let topSpringView = SpringView()
        topSpringView.direction = .vertical
        parentView.addSubview(topSpringView)
        topSpringView.positionBelow(item: topView)
        topSpringView.positionAbove(item: view)
        topSpringView.centerHorizontally(toItem: view)

        let bottomSpringView = SpringView()
        bottomSpringView.direction = .vertical
        parentView.addSubview(bottomSpringView)
        bottomSpringView.positionBelow(item: view)
        bottomSpringView.positionAbove(item: bottomView)
        bottomSpringView.centerHorizontally(toItem: view)

        parentView.saveSnapshot(#function,
            "view.fitBetween(topItem: topView, bottomItem: bottomView, offset: 20)"
        )
    }

    func fitBetweenLeftAndRightItems_offset20(_ parentView: SnapshotView) {
        let leftView = ItemView()
        parentView.addSubview(leftView)
        leftView.pinToLeftEdgeOfSuperview()
        leftView.centerVerticallyInSuperview()
        leftView.size(toWidthAndHeight: 60)

        let rightView = ItemView()
        parentView.addSubview(rightView)
        rightView.pinToRightEdgeOfSuperview()
        rightView.centerVerticallyInSuperview()
        rightView.size(toWidthAndHeight: 30)

        let view = LayoutView()
        parentView.addSubview(view)
        view.fitBetween(leftItem: leftView, rightItem: rightView, offset: 20)
        view.centerVerticallyInSuperview()
        view.size(toHeight: 80)

        let leftSpringView = SpringView()
        parentView.addSubview(leftSpringView)
        leftSpringView.positionToTheRight(ofItem: leftView)
        leftSpringView.positionToTheLeft(ofItem: view)
        leftSpringView.centerVertically(toItem: view)

        let rightSpringView = SpringView()
        parentView.addSubview(rightSpringView)
        rightSpringView.positionToTheRight(ofItem: view)
        rightSpringView.positionToTheLeft(ofItem: rightView)
        rightSpringView.centerVertically(toItem: view)

        parentView.saveSnapshot(#function,
            "view.fitBetween(leftItem: leftView, rightItem: rightView, offset: 20)"
        )
    }

    // MARK: - Fill

    func fillHorizontally_separation20(_ parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.size(toHeight: 80)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.size(toHeight: 60)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.size(toHeight: 100)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.pinToLeftEdgeOfSuperview()
        springView1.positionToTheLeft(ofItem: view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(ofItem: view1)
        springView2.positionToTheLeft(ofItem: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRight(ofItem: view2)
        springView3.positionToTheLeft(ofItem: view3)
        springView3.centerVerticallyInSuperview()

        let springView4 = SpringView()
        parentView.addSubview(springView4)
        springView4.positionToTheRight(ofItem: view3)
        springView4.pinToRightEdgeOfSuperview()
        springView4.centerVerticallyInSuperview()

        parentView.fillHorizontally(views: [view1, view2, view3], separation: 20)

        parentView.saveSnapshot(#function,
            "parentView.fillHorizontally(views: [view1, view2, view3], separation: 20)"
        )
    }

    func fillVertically_separation20(_ parentView: SnapshotView) {
        let view1 = LayoutView()
        parentView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.size(toWidth: 80)

        let view2 = LayoutView()
        parentView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.size(toWidth: 60)

        let view3 = LayoutView()
        parentView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.size(toWidth: 100)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.pinToTopEdgeOfSuperview()
        springView1.positionAbove(item: view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(item: view1)
        springView2.positionAbove(item: view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(item: view2)
        springView3.positionAbove(item: view3)
        springView3.centerHorizontallyInSuperview()

        let springView4 = SpringView()
        springView4.direction = .vertical
        parentView.addSubview(springView4)
        springView4.positionBelow(item: view3)
        springView4.pinToBottomEdgeOfSuperview()
        springView4.centerHorizontallyInSuperview()

        parentView.fillVertically(views: [view1, view2, view3], separation: 20)

        parentView.saveSnapshot(#function,
            "parentView.fillVertically(views: [view1, view2, view3], separation: 20)"
        )
    }

    // MARK: - Bound

    func boundHorizontally_separation20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerInSuperview()
        itemView.size(toHeight: 160)

        let view1 = LayoutView()
        itemView.addSubview(view1)
        view1.centerVerticallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        itemView.addSubview(view2)
        view2.centerVerticallyInSuperview()
        view2.size(toWidthAndHeight: 30)

        let view3 = LayoutView()
        itemView.addSubview(view3)
        view3.centerVerticallyInSuperview()
        view3.size(toWidthAndHeight: 80)

        itemView.boundHorizontally(views: [view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        parentView.addSubview(springView1)
        springView1.pinLeftEdgeToLeftEdge(ofItem: itemView)
        springView1.positionToTheLeft(ofItem: view1)
        springView1.centerVerticallyInSuperview()

        let springView2 = SpringView()
        parentView.addSubview(springView2)
        springView2.positionToTheRight(ofItem: view1)
        springView2.positionToTheLeft(ofItem: view2)
        springView2.centerVerticallyInSuperview()

        let springView3 = SpringView()
        parentView.addSubview(springView3)
        springView3.positionToTheRight(ofItem: view2)
        springView3.positionToTheLeft(ofItem: view3)
        springView3.centerVerticallyInSuperview()

        let springView4 = SpringView()
        parentView.addSubview(springView4)
        springView4.positionToTheRight(ofItem: view3)
        springView4.pinRightEdgeToRightEdge(ofItem: itemView)
        springView4.centerVerticallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.boundHorizontally(views: [view1, view2, view3], separation: 20)"
        )
    }

    func boundVertically_separation20(_ parentView: SnapshotView) {
        let itemView = ItemView()
        parentView.addSubview(itemView)
        itemView.centerInSuperview()
        itemView.size(toWidth: 160)

        let view1 = LayoutView()
        itemView.addSubview(view1)
        view1.centerHorizontallyInSuperview()
        view1.size(toWidthAndHeight: 60)

        let view2 = LayoutView()
        itemView.addSubview(view2)
        view2.centerHorizontallyInSuperview()
        view2.size(toWidthAndHeight: 30)

        let view3 = LayoutView()
        itemView.addSubview(view3)
        view3.centerHorizontallyInSuperview()
        view3.size(toWidthAndHeight: 80)

        itemView.boundVertically(views: [view1, view2, view3], separation: 20)

        let springView1 = SpringView()
        springView1.direction = .vertical
        parentView.addSubview(springView1)
        springView1.pinTopEdgeToTopEdge(ofItem: itemView)
        springView1.positionAbove(item: view1)
        springView1.centerHorizontallyInSuperview()

        let springView2 = SpringView()
        springView2.direction = .vertical
        parentView.addSubview(springView2)
        springView2.positionBelow(item: view1)
        springView2.positionAbove(item: view2)
        springView2.centerHorizontallyInSuperview()

        let springView3 = SpringView()
        springView3.direction = .vertical
        parentView.addSubview(springView3)
        springView3.positionBelow(item: view2)
        springView3.positionAbove(item: view3)
        springView3.centerHorizontallyInSuperview()

        let springView4 = SpringView()
        springView4.direction = .vertical
        parentView.addSubview(springView4)
        springView4.positionBelow(item: view3)
        springView4.pinBottomEdgeToBottomEdge(ofItem: itemView)
        springView4.centerHorizontallyInSuperview()

        parentView.saveSnapshot(#function,
            "itemView.boundVertically(views: [view1, view2, view3], separation: 20)"
        )
    }

}
