//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

class KGNAutoLayoutTestsPosition: KGNAutoLayoutTests {

    func testPositionAboveItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionAbove(itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.minY-size.height
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionAboveItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionAbove(itemView, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.minY-size.height-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheRightOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheRight(of: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.maxX
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheRightOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheRight(of: itemView, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.maxX+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionBelowItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionBelow(itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.maxY
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionBelowItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionBelow(itemView, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.maxY+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheLeftOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheLeft(of: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.minX-size.width
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheLeftOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheLeft(of: itemView, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.minX-size.width-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionViewsAbove1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionAbove(itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.minY-view1.height
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsAbove1Offset() {
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionAbove(itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.minY-view1.height-offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsAbove2() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionAbove(itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.minY-view2.height-view1.height
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.minY-view2.height
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsAbove2Offset() {
        let number: CGFloat = 2
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionAbove(itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.minY-view2.height-view1.height-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.minY-view2.height-offset
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsAbove3() {
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        [view1, view2, view3].positionAbove(itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.minY-view3.height-view2.height-view1.height
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.minY-view3.height-view2.height
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.y = itemView.frame.minY-view3.height
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsAbove3Offset() {
        let number: CGFloat = 3
        let offset: CGFloat = 5
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        [view1, view2, view3].positionAbove(itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.minY-view3.height-view2.height-view1.height-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.minY-view3.height-view2.height-(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.y = itemView.frame.minY-view3.height-offset
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsToTheRight1() {
        let priority = UILayoutPriorityRequired

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionToTheRight(of: itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.maxX
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsToTheRight1Offset() {
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionToTheRight(of: itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.maxX+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsToTheRight2() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionToTheRight(of: itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.maxX
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.maxX+view1.width
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsToTheRight2Offset() {
        let number: CGFloat = 2
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionToTheRight(of: itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.maxX+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.maxX+view1.width+(offset*number)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsToTheRight3() {
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        [view1, view2, view3].positionToTheRight(of: itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.maxX
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.maxX+view1.width
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.x = itemView.frame.maxX+view1.width+view2.width
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsToTheRight3Offset() {
        let number: CGFloat = 3
        let offset: CGFloat = 5
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        [view1, view2, view3].positionToTheRight(of: itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.maxX+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.maxX+view1.width+(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.x = itemView.frame.maxX+view1.width+view2.width+(offset*number)
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsBelow1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionBelow(itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.maxY
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsBelow1Offset() {
        let offset: CGFloat = 10
        let priority = UILayoutPriorityRequired

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionBelow(itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.maxY+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsBelow2() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionBelow(itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.maxY
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.maxY+view1.height
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsBelow2Offset() {
        let number: CGFloat = 2
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionBelow(itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.maxY+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.maxY+view1.height+(offset*number)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsBelow3() {
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        [view1, view2, view3].positionBelow(itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.maxY
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.maxY+view1.height
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.y = itemView.frame.maxY+view1.height+view2.height
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsBelow3Offset() {
        let number: CGFloat = 3
        let offset: CGFloat = 5
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        [view1, view2, view3].positionBelow(itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = itemView.frame.maxY+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = itemView.frame.maxY+view1.height+(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.y = itemView.frame.maxY+view1.height+view2.height+(offset*number)
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsToTheLeft1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionToTheLeft(of: itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.minX-view1.width
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsToTheLeft1Offset() {
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        [view1].positionToTheLeft(of: itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.minX-view1.width-offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testPositionViewsToTheLeft2() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionToTheLeft(of: itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.minX-view2.width-view1.width
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.minX-view2.width
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsToTheLeft2Offset() {
        let number: CGFloat = 2
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        [view1, view2].positionToTheLeft(of: itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.minX-view2.width-view1.width-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.minX-view2.width-offset
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testPositionViewsToTheLeft3() {
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40

        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        [view1, view2, view3].positionToTheLeft(of: itemView, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.minX-view3.width-view2.width-view1.width
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.minX-view3.width-view2.width
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.x = itemView.frame.minX-view3.width
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsToTheLeft3Offset() {
        let number: CGFloat = 3
        let offset: CGFloat = 5
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10
        
        let view2 = IntrinsicView()
        view2.width = 10
        view2.height = 20
        
        let view3 = IntrinsicView()
        view3.width = 40
        view3.height = 40
        
        let itemView = UIView(frame: CGRect(x: 50, y: 100, width: 10, height: 20))
        
        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        
        [view1, view2, view3].positionToTheLeft(of: itemView, withOffset: offset, priority: priority)
        parentView.layoutIfNeeded()
        
        var frame1 = CGRect.zero
        frame1.origin.x = itemView.frame.minX-view3.width-view2.width-view1.width-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
        
        var frame2 = CGRect.zero
        frame2.origin.x = itemView.frame.minX-view3.width-view2.width-(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
        
        var frame3 = CGRect.zero
        frame3.origin.x = itemView.frame.minX-view3.width-offset
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

}
