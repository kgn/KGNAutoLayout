//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

class IntrinsicView: UIView {
    var width: CGFloat = UIViewNoIntrinsicMetric
    var height: CGFloat = UIViewNoIntrinsicMetric
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(self.width, self.height)
    }
}

class KGNAutoLayoutTests: XCTestCase {
    let parentViewFrame = CGRectMake(0, 0, 200, 200)

    func compareViewFrame(block: (view: IntrinsicView) -> Void) -> CGRect {
        let parentView = UIView(frame: self.parentViewFrame)
        let childView = IntrinsicView()
        parentView.addSubview(childView)
        block(view: childView)
        parentView.layoutIfNeeded()
        return childView.frame
    }

    func testIntrinsicView() {
        let view = IntrinsicView()
        view.width = 10
        view.height = 20
        XCTAssertEqual(view.intrinsicContentSize(), CGSizeMake(10, 20))
        XCTAssertEqual(IntrinsicView().intrinsicContentSize(), CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric))
    }

    // MARK: - Pin: Superview

    func testPinToEdgesOfSuperview() {
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.pinToEdgesOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.top.priority)
            XCTAssertEqual(priority, constraints.right.priority)
            XCTAssertEqual(priority, constraints.bottom.priority)
            XCTAssertEqual(priority, constraints.left.priority)
        }
        XCTAssertEqual(childViewFrame, self.parentViewFrame)
    }

    func testPinToEdgesOfSuperviewOffset() {
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.pinToEdgesOfSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraints.top.priority)
            XCTAssertEqual(priority, constraints.right.priority)
            XCTAssertEqual(priority, constraints.bottom.priority)
            XCTAssertEqual(priority, constraints.left.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectInset(self.parentViewFrame, offset, offset))
    }

    func testPinToTopEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToTopEdgeOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, size))
    }

    func testPinToTopEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToTopEdgeOfSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, offset, size, size))
    }

    func testPinToRightEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToRightEdgeOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        let right = CGRectGetMaxX(self.parentViewFrame)-size
        XCTAssertEqual(childViewFrame, CGRectMake(right, 0, size, size))
    }

    func testPinToRightEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToRightEdgeOfSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        let right = CGRectGetMaxX(self.parentViewFrame)-size-offset
        XCTAssertEqual(childViewFrame, CGRectMake(right, 0, size, size))
    }

    func testPinToBottomEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToBottomEdgeOfSuperview()
            XCTAssertEqual(priority, constraint.priority)
        }
        let bottom = CGRectGetMaxY(self.parentViewFrame)-size
        XCTAssertEqual(childViewFrame, CGRectMake(0, bottom, size, size))
    }

    func testPinToBottomEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToBottomEdgeOfSuperview(offset)
            XCTAssertEqual(priority, constraint.priority)
        }
        let bottom = CGRectGetMaxY(self.parentViewFrame)-size-offset
        XCTAssertEqual(childViewFrame, CGRectMake(0, bottom, size, size))
    }

    func testPinToLeftEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToLeftEdgeOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, size))
    }

    func testPinToLeftEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToLeftEdgeOfSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(offset, 0, size, size))
    }

    func testPinToSideEdgesOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraints = $0.pinToSideEdgesOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.left.priority)
            XCTAssertEqual(priority, constraints.right.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, CGRectGetWidth(self.parentViewFrame), size))
    }

    func testPinToSideEdgesOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraints = $0.pinToSideEdgesOfSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraints.left.priority)
            XCTAssertEqual(priority, constraints.right.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(offset, 0, CGRectGetWidth(self.parentViewFrame)-offset*2, size))
    }

    func testPinToTopAndBottomEdgesOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraints = $0.pinToTopAndBottomEdgesOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.top.priority)
            XCTAssertEqual(priority, constraints.bottom.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, CGRectGetHeight(self.parentViewFrame)))
    }

    func testPinToTopAndBottomEdgesOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraints = $0.pinToTopAndBottomEdgesOfSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraints.top.priority)
            XCTAssertEqual(priority, constraints.bottom.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, offset, size, CGRectGetHeight(self.parentViewFrame)-offset*2))
    }

    // MARK: - Pin: Edges

    func testPinTopEdgeToTopEdgeOfItem() {

    }

    func testPinTopEdgeToTopEdgeOfItemOffset() {

    }

    func testPinRightEdgeToRightEdgeOfItem() {

    }

    func testPinRightEdgeToRightEdgeOfItemOffset() {

    }

    func testPinBottomEdgeToBottomEdgeOfItem() {

    }

    func testPinBottomEdgeToBottomEdgeOfItemOffset() {

    }

    func testPinLeftEdgeToLeftEdgeOfItem() {

    }

    func testPinLeftEdgeToLeftEdgeOfItemOffset() {

    }

    // MARK: - Center

    func testCenterInSuperview() {
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraints = $0.centerInSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.horizontal.priority)
            XCTAssertEqual(priority, constraints.vertical.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(self.parentViewFrame)-CGRectGetMidX(frame)
        frame.origin.y = CGRectGetMidY(self.parentViewFrame)-CGRectGetMidY(frame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterInSuperviewOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraints = $0.centerInSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraints.horizontal.priority)
            XCTAssertEqual(priority, constraints.vertical.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(self.parentViewFrame)-CGRectGetMidX(frame)+offset
        frame.origin.y = CGRectGetMidY(self.parentViewFrame)-CGRectGetMidY(frame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterHorizontallyInSuperview() {
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerHorizontallyInSuperview(priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(self.parentViewFrame)-CGRectGetMidX(frame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterHorizontallyInSuperviewOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerHorizontallyInSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(self.parentViewFrame)-CGRectGetMidX(frame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyInSuperview() {
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerVerticallyInSuperview(priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMidY(self.parentViewFrame)-CGRectGetMidY(frame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyInSuperviewOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerVerticallyInSuperview(offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMidY(self.parentViewFrame)-CGRectGetMidY(frame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterViewsHorizontally1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.centerViewsHorizontally([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-CGRectGetMidX(frame1)
        XCTAssertEqual(view1.frame, frame1)
    }

    func testCenterViewsHorizontally1Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.centerViewsHorizontally([view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-CGRectGetMidX(frame1)
        XCTAssertEqual(view1.frame, frame1)
    }

    func testCenterViewsHorizontally2() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 30
        view2.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.centerViewsHorizontally([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)
        XCTAssertEqual(view2.frame, frame2)
    }

    func testCenterViewsHorizontally2Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 30
        view2.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.centerViewsHorizontally([view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-view1.width-(separation/2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)+(separation/2)
        XCTAssertEqual(view2.frame, frame2)
    }

    func testCenterViewsHorizontally3() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.centerViewsHorizontally([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-(view2.width/2)-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)-CGRectGetMidX(frame2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.x = CGRectGetMidX(parentView.frame)+(view2.width/2)
        XCTAssertEqual(view3.frame, frame3)
    }

    func testCenterViewsHorizontally3Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.centerViewsHorizontally([view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-(view2.width/2)-view1.width-separation
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)-CGRectGetMidX(frame2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.x = CGRectGetMidX(parentView.frame)+(view2.width/2)+separation
        XCTAssertEqual(view3.frame, frame3)
    }

    func testCenterViewsHorizontally4() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 10

        let view4 = IntrinsicView()
        view4.width = 10
        view4.height = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)

        parentView.centerViewsHorizontally([view1, view2, view3, view4], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-view2.width-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)-view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.x = CGRectGetMidX(parentView.frame)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.x = CGRectGetMidX(parentView.frame)+view3.width
        XCTAssertEqual(view4.frame, frame4)
    }

    func testCenterViewsHorizontally4Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 10

        let view4 = IntrinsicView()
        view4.width = 10
        view4.height = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)

        parentView.centerViewsHorizontally([view1, view2, view3, view4], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-view2.width-(separation*1.5)-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)-view2.width-(separation/2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.x = CGRectGetMidX(parentView.frame)+(separation/2)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.x = CGRectGetMidX(parentView.frame)+view3.width+(separation*1.5)
        XCTAssertEqual(view4.frame, frame4)
    }

    func testCenterViewsHorizontally5() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let view4 = IntrinsicView()
        view4.width = 50
        view4.height = 40

        let view5 = IntrinsicView()
        view5.width = 10
        view5.height = 50

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)
        parentView.addSubview(view5)

        parentView.centerViewsHorizontally([view1, view2, view3, view4, view5], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-(view3.width/2)-view2.width-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)-(view3.width/2)-view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.x = CGRectGetMidX(parentView.frame)-CGRectGetMidX(frame3)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.x = CGRectGetMidX(parentView.frame)+(view3.width/2)
        XCTAssertEqual(view4.frame, frame4)

        var frame5 = CGRectZero
        frame5.size = CGSizeMake(view5.width, view5.height)
        frame5.origin.x = CGRectGetMidX(parentView.frame)+(view3.width/2)+view4.width
        XCTAssertEqual(view5.frame, frame5)
    }

    func testCenterViewsHorizontally5Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let view4 = IntrinsicView()
        view4.width = 50
        view4.height = 40

        let view5 = IntrinsicView()
        view5.width = 10
        view5.height = 50

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)
        parentView.addSubview(view5)

        parentView.centerViewsHorizontally([view1, view2, view3, view4, view5], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.x = CGRectGetMidX(parentView.frame)-(view3.width/2)-view2.width-view1.width-(separation*2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.x = CGRectGetMidX(parentView.frame)-(view3.width/2)-view2.width-separation
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.x = CGRectGetMidX(parentView.frame)-CGRectGetMidX(frame3)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.x = CGRectGetMidX(parentView.frame)+(view3.width/2)+separation
        XCTAssertEqual(view4.frame, frame4)

        var frame5 = CGRectZero
        frame5.size = CGSizeMake(view5.width, view5.height)
        frame5.origin.x = CGRectGetMidX(parentView.frame)+(view3.width/2)+view4.width+(separation*2)
        XCTAssertEqual(view5.frame, frame5)
    }

    func testCenterViewsVertically1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.centerViewsVertically([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-CGRectGetMidY(frame1)
        XCTAssertEqual(view1.frame, frame1)
    }

    func testCenterViewsVertically1Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.centerViewsVertically([view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-CGRectGetMidY(frame1)
        XCTAssertEqual(view1.frame, frame1)
    }

    func testCenterViewsVertically2() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 30
        view2.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.centerViewsVertically([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)
        XCTAssertEqual(view2.frame, frame2)
    }

    func testCenterViewsVertically2Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 30
        view2.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.centerViewsVertically([view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-view1.height-(separation/2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)+(separation/2)
        XCTAssertEqual(view2.frame, frame2)
    }

    func testCenterViewsVertically3() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.centerViewsVertically([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-(view2.height/2)-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)-CGRectGetMidY(frame2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.y = CGRectGetMidY(parentView.frame)+(view2.height/2)
        XCTAssertEqual(view3.frame, frame3)
    }

    func testCenterViewsVertically3Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.centerViewsVertically([view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-(view2.height/2)-view1.height-separation
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)-CGRectGetMidY(frame2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.y = CGRectGetMidY(parentView.frame)+(view2.height/2)+separation
        XCTAssertEqual(view3.frame, frame3)
    }

    func testCenterViewsVertically4() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 10

        let view4 = IntrinsicView()
        view4.width = 10
        view4.height = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)

        parentView.centerViewsVertically([view1, view2, view3, view4], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-view2.height-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)-view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.y = CGRectGetMidY(parentView.frame)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.y = CGRectGetMidY(parentView.frame)+view3.height
        XCTAssertEqual(view4.frame, frame4)
    }

    func testCenterViewsVertically4Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 10

        let view4 = IntrinsicView()
        view4.width = 10
        view4.height = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)

        parentView.centerViewsVertically([view1, view2, view3, view4], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-view2.height-(separation*1.5)-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)-view2.height-(separation/2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.y = CGRectGetMidY(parentView.frame)+(separation/2)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.y = CGRectGetMidY(parentView.frame)+view3.height+(separation*1.5)
        XCTAssertEqual(view4.frame, frame4)
    }

    func testCenterViewsVertically5() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let view4 = IntrinsicView()
        view4.width = 50
        view4.height = 40

        let view5 = IntrinsicView()
        view5.width = 10
        view5.height = 50

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)
        parentView.addSubview(view5)

        parentView.centerViewsVertically([view1, view2, view3, view4, view5], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-(view3.height/2)-view2.height-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)-(view3.height/2)-view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.y = CGRectGetMidY(parentView.frame)-CGRectGetMidY(frame3)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.y = CGRectGetMidY(parentView.frame)+(view3.height/2)
        XCTAssertEqual(view4.frame, frame4)

        var frame5 = CGRectZero
        frame5.size = CGSizeMake(view5.width, view5.height)
        frame5.origin.y = CGRectGetMidY(parentView.frame)+(view3.height/2)+view4.height
        XCTAssertEqual(view5.frame, frame5)
    }

    func testCenterViewsVertically5Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let view2 = IntrinsicView()
        view2.width = 40
        view2.height = 20

        let view3 = IntrinsicView()
        view3.width = 30
        view3.height = 20

        let view4 = IntrinsicView()
        view4.width = 50
        view4.height = 40

        let view5 = IntrinsicView()
        view5.width = 10
        view5.height = 50

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)
        parentView.addSubview(view5)

        parentView.centerViewsVertically([view1, view2, view3, view4, view5], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size = CGSizeMake(view1.width, view1.height)
        frame1.origin.y = CGRectGetMidY(parentView.frame)-(view3.height/2)-view2.height-view1.height-(separation*2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size = CGSizeMake(view2.width, view2.height)
        frame2.origin.y = CGRectGetMidY(parentView.frame)-(view3.height/2)-view2.height-separation
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size = CGSizeMake(view3.width, view3.height)
        frame3.origin.y = CGRectGetMidY(parentView.frame)-CGRectGetMidY(frame3)
        XCTAssertEqual(view3.frame, frame3)
        
        var frame4 = CGRectZero
        frame4.size = CGSizeMake(view4.width, view4.height)
        frame4.origin.y = CGRectGetMidY(parentView.frame)+(view3.height/2)+separation
        XCTAssertEqual(view4.frame, frame4)
        
        var frame5 = CGRectZero
        frame5.size = CGSizeMake(view5.width, view5.height)
        frame5.origin.y = CGRectGetMidY(parentView.frame)+(view3.height/2)+view4.height+(separation*2)
        XCTAssertEqual(view5.frame, frame5)
    }
    
    func testCenterHorizontallyToItem() {
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerHorizontallyToItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(self.parentViewFrame)-CGRectGetMidX(frame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterHorizontallyToItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerHorizontallyToItem($0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(self.parentViewFrame)-CGRectGetMidX(frame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyToItem() {
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerVerticallyToItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMidY(self.parentViewFrame)-CGRectGetMidY(frame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyToItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerVerticallyToItem($0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMidY(self.parentViewFrame)-CGRectGetMidY(frame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    // MARK: - Size

    func testSizeToWidth() {
        let size = CGSizeMake(50, 10)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.height = size.height
            let constraint = $0.sizeToWidth(size.width, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size.width, size.height))
    }

    func testSizeHeight() {
        let size = CGSizeMake(10, 50)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            let constraint = $0.sizeToHeight(size.height, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size.width, size.height))
    }

    func testSizeWidthAndHeight() {
        let size:CGFloat = 30
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeToWidthAndHeight(size, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, size))
    }

    func testSizeWidthToWidthOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToWidthOfItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, CGRectGetWidth(self.parentViewFrame), size))
    }

    func testSizeWidthToWidthOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToWidthOfItem($0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, CGRectGetWidth(self.parentViewFrame)-offset, size))
    }

    func testSizeHeightToHeightOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToHeightOfItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, CGRectGetHeight(self.parentViewFrame)))
    }

    func testSizeHeightToHeightOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToHeightOfItem($0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, CGRectGetHeight(self.parentViewFrame)-offset))
    }

    func testSizeHeightToWidthOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToWidthOfItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, CGRectGetHeight(self.parentViewFrame)))
    }

    func testSizeHeightToWidthOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToWidthOfItem($0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, CGRectGetHeight(self.parentViewFrame)-offset))
    }

    func testSizeWidthToHeightOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToHeightOfItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, CGRectGetHeight(self.parentViewFrame), size))
    }

    func testSizeWidthToHeightOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToHeightOfItem($0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, CGRectGetHeight(self.parentViewFrame)-offset, size))
    }

    func testSizeToWidthAndHeightOfItem() {
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeToWidthAndHeightOfItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, self.parentViewFrame)
    }

    func testSizeToWidthAndHeightOfItemOffset() {
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeToWidthAndHeightOfItem($0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        var frame = self.parentViewFrame
        frame.size.width -= offset
        frame.size.height -= offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testSizeHeightToWidthAspectRatio() {
        let size: CGFloat = 20
        let aspectRatio: CGFloat = 2
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToWidthAspectRatio(aspectRatio, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size, size*aspectRatio))
    }

    func testSizeWidthToHeightAspectRatio() {
        let size: CGFloat = 20
        let aspectRatio: CGFloat = 2
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToHeightAspectRatio(aspectRatio, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size*aspectRatio, size))
    }

    // MARK: - Position

    func testPositionAboveItem() {

    }

    func testPositionAboveItemOffset() {

    }

    func testPositionToTheRightOfItem() {

    }

    func testPositionToTheRightOfItemOffset() {
        
    }

    func testPositionBelowItem() {

    }

    func testPositionBelowItemOffset() {

    }

    func testPositionToTheLeftOfItem() {

    }

    func testPositionToTheLeftOfItemOffset() {

    }

    func testPositionViewsAbove() {

    }

    func testPositionViewsAboveOffset() {

    }

    func testPositionViewsToTheRight() {

    }

    func testPositionViewsToTheRightOffset() {

    }

    func testPositionViewsBelow() {

    }

    func testPositionViewsBelowOffset() {

    }

    func testPositionViewsToTheLeft() {

    }

    func testPositionViewsToTheLeftOffset() {

    }

    // MARK: - Between

    func testFitBetweenTopAndBottom() {

    }

    func testFitBetweenTopAndBottomOffset() {

    }

    func testFitBetweenLeftAndRight() {

    }

    func testFitBetweenLeftAndRightOffset() {
        
    }

    // MARK: - Fill

    func testFillHorizontally() {

    }

    func testFillHorizontallySeperation() {

    }

    func testFillVertically() {

    }

    func testFillVerticallySeperation() {
        
    }

    // MARK: - Bound

    func testBoundHorizontally() {

    }

    func testBoundHorizontallySeperation() {

    }

    func testBoundVertically() {

    }

    func testBoundVerticallySeperation() {
        
    }
    
}
