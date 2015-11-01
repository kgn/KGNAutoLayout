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
    let parentViewFrame = CGRectMake(0, 0, 300, 300)

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
}

class KGNAutoLayoutTestsPinSuperview: KGNAutoLayoutTests {

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
            let constraints = $0.pinToEdgesOfSuperview(offset: offset, priority: priority)
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
            let constraint = $0.pinToTopEdgeOfSuperview(offset: offset, priority: priority)
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
            let constraint = $0.pinToRightEdgeOfSuperview(offset: offset, priority: priority)
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
            let constraint = $0.pinToBottomEdgeOfSuperview(offset: offset)
            XCTAssertEqual(priority, constraint.priority)
        }
        let bottom = CGRectGetMaxY(self.parentViewFrame)-size-offset
        XCTAssertEqual(childViewFrame, CGRectMake(0, bottom, size, size))
    }

    func testPinToLeftEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
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
            let constraint = $0.pinToLeftEdgeOfSuperview(offset: offset, priority: priority)
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
            let constraints = $0.pinToSideEdgesOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.left.priority)
            XCTAssertEqual(priority, constraints.right.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(offset, 0, CGRectGetWidth(self.parentViewFrame)-offset*2, size))
    }

    func testPinToTopAndBottomEdgesOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
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
            let constraints = $0.pinToTopAndBottomEdgesOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.top.priority)
            XCTAssertEqual(priority, constraints.bottom.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, offset, size, CGRectGetHeight(self.parentViewFrame)-offset*2))
    }

}

class KGNAutoLayoutTestsPinEdges: KGNAutoLayoutTests {

    func testPinTopEdgeToTopEdgeOfItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinTopEdgeToTopEdgeOfItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMinY(itemFrame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinTopEdgeToTopEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinTopEdgeToTopEdgeOfItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMinY(itemFrame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinRightEdgeToRightEdgeOfItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinRightEdgeToRightEdgeOfItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMaxX(itemFrame)-size.width
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinRightEdgeToRightEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinRightEdgeToRightEdgeOfItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMaxX(itemFrame)-size.width-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinBottomEdgeToBottomEdgeOfItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinBottomEdgeToBottomEdgeOfItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMaxY(itemFrame)-size.height
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinBottomEdgeToBottomEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinBottomEdgeToBottomEdgeOfItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMaxY(itemFrame)-size.height-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinLeftEdgeToLeftEdgeOfItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinLeftEdgeToLeftEdgeOfItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMinX(itemFrame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinLeftEdgeToLeftEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinLeftEdgeToLeftEdgeOfItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMinX(itemFrame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

}


class KGNAutoLayoutTestsCenter: KGNAutoLayoutTests {

    func testCenterInSuperview() {
        let size = CGSizeMake(40, 20)
        let priority = UILayoutPriorityRequired
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
            let constraints = $0.centerInSuperview(offset: offset, priority: priority)
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
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerHorizontallyInSuperview(offset: offset, priority: priority)
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
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerVerticallyInSuperview(offset: offset, priority: priority)
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
        let priority = UILayoutPriorityRequired

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
        let priority = UILayoutPriorityRequired

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
        let priority = UILayoutPriorityRequired

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
        let priority = UILayoutPriorityRequired

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
        let priority = UILayoutPriorityRequired

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
        let itemFrame = CGRectMake(20, 30, 40, 50)
        let priority = UILayoutPriorityRequired

        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerHorizontallyToItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(itemFrame)-size.width/2
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterHorizontallyToItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(30, 20, 10, 80)
        let priority = UILayoutPriorityDefaultLow

        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerHorizontallyToItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMidX(itemFrame)-size.width/2+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyToItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(100, 80, 60, 40)
        let priority = UILayoutPriorityDefaultLow

        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerVerticallyToItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMidY(itemFrame)-size.height/2
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyToItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerVerticallyToItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMidY(itemFrame)-size.height/2+offset
        XCTAssertEqual(childViewFrame, frame)
    }

}

class KGNAutoLayoutTestsSize: KGNAutoLayoutTests {

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

    func testSizeToMinWidth() {
        let minWidth: CGFloat = 100
        let size = CGSizeMake(50, 10)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.sizeToMinWidth(minWidth, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, minWidth, size.height))
    }

    func testSizeToMaxWidth() {
        let maxWidth: CGFloat = 20
        let size = CGSizeMake(50, 10)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.sizeToMaxWidth(maxWidth, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, maxWidth, size.height))
    }

    func testSizeToHeight() {
        let size = CGSizeMake(10, 50)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            let constraint = $0.sizeToHeight(size.height, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size.width, size.height))
    }

    func testSizeToMinHeight() {
        let minHeight: CGFloat = 100
        let size = CGSizeMake(10, 50)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.sizeToMinHeight(minHeight, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size.width, minHeight))
    }

    func testSizeToMaxHeight() {
        let maxHeight: CGFloat = 20
        let size = CGSizeMake(10, 50)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.sizeToMaxHeight(maxHeight, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, size.width, maxHeight))
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

    func testSizeMinWidthAndHeight() {
        let minSize: CGFloat = 30
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = 10
            $0.height = 20
            let constraints = $0.sizeToMinWidthAndHeight(minSize, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, minSize, minSize))
    }

    func testSizeMaxWidthAndHeight() {
        let maxSize: CGFloat = 30
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = 100
            $0.height = 40
            let constraints = $0.sizeToMaxWidthAndHeight(maxSize, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, CGRectMake(0, 0, maxSize, maxSize))
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
        let priority = UILayoutPriorityRequired
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
            let constraints = $0.sizeWidthAndHeightToWidthAndHeightOfItem($0.superview!, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, self.parentViewFrame)
    }

    func testSizeToWidthAndHeightOfItemOffset() {
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeWidthAndHeightToWidthAndHeightOfItem($0.superview!, offset: offset, priority: priority)
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

}

class KGNAutoLayoutTestsPosition: KGNAutoLayoutTests {

    func testPositionAboveItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionAboveItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMinY(itemFrame)-size.height
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionAboveItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionAboveItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMinY(itemFrame)-size.height-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheRightOfItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheRightOfItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMaxX(itemFrame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheRightOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheRightOfItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMaxX(itemFrame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionBelowItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionBelowItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMaxY(itemFrame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionBelowItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionBelowItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.y = CGRectGetMaxY(itemFrame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheLeftOfItem() {
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheLeftOfItem(itemView, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMinX(itemFrame)-size.width
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionToTheLeftOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSizeMake(40, 20)
        let itemFrame = CGRectMake(120, 50, 60, 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.positionToTheLeftOfItem(itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        var frame = CGRectZero
        frame.size = size
        frame.origin.x = CGRectGetMinX(itemFrame)-size.width-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPositionViewsAbove1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsAbove([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMinY(itemView.frame)-view1.height
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsAbove([view1], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMinY(itemView.frame)-view1.height-offset
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsAbove([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMinY(itemView.frame)-view2.height-view1.height
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMinY(itemView.frame)-view2.height
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsAbove([view1, view2], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMinY(itemView.frame)-view2.height-view1.height-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMinY(itemView.frame)-view2.height-offset
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        itemView.positionViewsAbove([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMinY(itemView.frame)-view3.height-view2.height-view1.height
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMinY(itemView.frame)-view3.height-view2.height
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.y = CGRectGetMinY(itemView.frame)-view3.height
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        itemView.positionViewsAbove([view1, view2, view3], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMinY(itemView.frame)-view3.height-view2.height-view1.height-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMinY(itemView.frame)-view3.height-view2.height-(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.y = CGRectGetMinY(itemView.frame)-view3.height-offset
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsToTheRight1() {
        let priority = UILayoutPriorityRequired

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsToTheRight([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMaxX(itemView.frame)
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsToTheRight([view1], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMaxX(itemView.frame)+offset
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsToTheRight([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMaxX(itemView.frame)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMaxX(itemView.frame)+view1.width
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsToTheRight([view1, view2], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMaxX(itemView.frame)+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMaxX(itemView.frame)+view1.width+(offset*number)
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        itemView.positionViewsToTheRight([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMaxX(itemView.frame)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMaxX(itemView.frame)+view1.width
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.x = CGRectGetMaxX(itemView.frame)+view1.width+view2.width
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        itemView.positionViewsToTheRight([view1, view2, view3], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMaxX(itemView.frame)+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMaxX(itemView.frame)+view1.width+(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.x = CGRectGetMaxX(itemView.frame)+view1.width+view2.width+(offset*number)
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsBelow1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsBelow([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMaxY(itemView.frame)
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsBelow([view1], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMaxY(itemView.frame)+offset
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsBelow([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMaxY(itemView.frame)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMaxY(itemView.frame)+view1.height
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsBelow([view1, view2], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMaxY(itemView.frame)+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMaxY(itemView.frame)+view1.height+(offset*number)
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        itemView.positionViewsBelow([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMaxY(itemView.frame)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMaxY(itemView.frame)+view1.height
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.y = CGRectGetMaxY(itemView.frame)+view1.height+view2.height
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        itemView.positionViewsBelow([view1, view2, view3], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = CGRectGetMaxY(itemView.frame)+offset
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = CGRectGetMaxY(itemView.frame)+view1.height+(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.y = CGRectGetMaxY(itemView.frame)+view1.height+view2.height+(offset*number)
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testPositionViewsToTheLeft1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30
        view1.height = 10

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsToTheLeft([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMinX(itemView.frame)-view1.width
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)

        itemView.positionViewsToTheLeft([view1], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMinX(itemView.frame)-view1.width-offset
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsToTheLeft([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMinX(itemView.frame)-view2.width-view1.width
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMinX(itemView.frame)-view2.width
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        itemView.positionViewsToTheLeft([view1, view2], offset: offset, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMinX(itemView.frame)-view2.width-view1.width-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMinX(itemView.frame)-view2.width-offset
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

        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        itemView.positionViewsToTheLeft([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMinX(itemView.frame)-view3.width-view2.width-view1.width
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMinX(itemView.frame)-view3.width-view2.width
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.x = CGRectGetMinX(itemView.frame)-view3.width
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
        
        let itemView = UIView(frame: CGRectMake(50, 100, 10, 20))
        
        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(itemView)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        
        itemView.positionViewsToTheLeft([view1, view2, view3], offset: offset, priority: priority)
        parentView.layoutIfNeeded()
        
        var frame1 = CGRectZero
        frame1.origin.x = CGRectGetMinX(itemView.frame)-view3.width-view2.width-view1.width-(offset*number)
        frame1.size.width = view1.width
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
        
        var frame2 = CGRectZero
        frame2.origin.x = CGRectGetMinX(itemView.frame)-view3.width-view2.width-(offset*2)
        frame2.size.width = view2.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
        
        var frame3 = CGRectZero
        frame3.origin.x = CGRectGetMinX(itemView.frame)-view3.width-offset
        frame3.size.width = view3.width
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

}

class KGNAutoLayoutTestsBetween: KGNAutoLayoutTests {

    func testFitBetweenTopItemAndBottomItem() {
        let width: CGFloat = 40
        let topFrame = CGRectMake(10, 20, 30, 40)
        let bottomFrame = CGRectMake(50, 120, 60, 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = width

            let topView = UIView(frame: topFrame)
            $0.superview!.addSubview(topView)

            let bottomView = UIView(frame: bottomFrame)
            $0.superview!.addSubview(bottomView)

            let constraints = $0.fitBetween(topItem: topView, bottomItem: bottomView, priority: priority)
            XCTAssertEqual(priority, constraints.top.priority)
            XCTAssertEqual(priority, constraints.bottom.priority)
        }
        var frame = CGRectZero
        frame.size.width = width
        frame.size.height = CGRectGetMinY(bottomFrame)-CGRectGetMaxY(topFrame)
        frame.origin.y = CGRectGetMaxY(topFrame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testFitBetweenTopItemAndBottomItemOffset() {
        let width: CGFloat = 40
        let offset: CGFloat = 10
        let topFrame = CGRectMake(10, 20, 30, 40)
        let bottomFrame = CGRectMake(50, 120, 60, 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = width

            let topView = UIView(frame: topFrame)
            $0.superview!.addSubview(topView)

            let bottomView = UIView(frame: bottomFrame)
            $0.superview!.addSubview(bottomView)

            let constraints = $0.fitBetween(topItem: topView, bottomItem: bottomView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.top.priority)
            XCTAssertEqual(priority, constraints.bottom.priority)
        }
        var frame = CGRectZero
        frame.size.width = width
        frame.size.height = CGRectGetMinY(bottomFrame)-CGRectGetMaxY(topFrame)-offset*2
        frame.origin.y = CGRectGetMaxY(topFrame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testFitBetweenLeftItemAndRightItem() {
        let height: CGFloat = 40
        let leftFrame = CGRectMake(10, 20, 30, 40)
        let rightFrame = CGRectMake(80, 40, 60, 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = height

            let leftView = UIView(frame: leftFrame)
            $0.superview!.addSubview(leftView)

            let rightView = UIView(frame: rightFrame)
            $0.superview!.addSubview(rightView)

            let constraints = $0.fitBetween(leftItem: leftView, rightItem: rightView, priority: priority)
            XCTAssertEqual(priority, constraints.left.priority)
            XCTAssertEqual(priority, constraints.right.priority)
        }
        var frame = CGRectZero
        frame.size.height = height
        frame.size.width = CGRectGetMinX(rightFrame)-CGRectGetMaxX(leftFrame)
        frame.origin.x = CGRectGetMaxX(leftFrame)
        XCTAssertEqual(childViewFrame, frame)
    }

    func testFitBetweenLeftItemAndRightItemOffset() {
        let height: CGFloat = 40
        let offset: CGFloat = 10
        let leftFrame = CGRectMake(10, 20, 30, 40)
        let rightFrame = CGRectMake(80, 40, 60, 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = height

            let leftView = UIView(frame: leftFrame)
            $0.superview!.addSubview(leftView)

            let rightView = UIView(frame: rightFrame)
            $0.superview!.addSubview(rightView)

            let constraints = $0.fitBetween(leftItem: leftView, rightItem: rightView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.left.priority)
            XCTAssertEqual(priority, constraints.right.priority)
        }
        var frame = CGRectZero
        frame.size.height = height
        frame.size.width = CGRectGetMinX(rightFrame)-CGRectGetMaxX(leftFrame)-offset*2
        frame.origin.x = CGRectGetMaxX(leftFrame)+offset
        XCTAssertEqual(childViewFrame, frame)
    }

}

class KGNAutoLayoutTestsFill: KGNAutoLayoutTests {

    func testFillHorizontally1() {
        let priority = UILayoutPriorityRequired

        let view1 = IntrinsicView()
        view1.height = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.fillHorizontally([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size.width = CGRectGetWidth(self.parentViewFrame)
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testFillHorizontally1Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.height = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.fillHorizontally([view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = separation
        frame1.size.width = CGRectGetWidth(self.parentViewFrame)-separation*2
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testFillHorizontally2() {
        let number: CGFloat = 2
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.height = 30

        let view2 = IntrinsicView()
        view2.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.fillHorizontally([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size.width = CGRectGetWidth(self.parentViewFrame)/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.width = CGRectGetWidth(self.parentViewFrame)/number
        frame2.origin.x = frame2.size.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testFillHorizontally2Seperation() {
        let number: CGFloat = 2
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.height = 30

        let view2 = IntrinsicView()
        view2.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.fillHorizontally([view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = separation
        frame1.size.width = (CGRectGetWidth(self.parentViewFrame)-(separation*(number+1)))/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.width = (CGRectGetWidth(self.parentViewFrame)-(separation*(number+1)))/number
        frame2.origin.x = frame2.size.width+(separation*number)
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testFillHorizontally3() {
        let number: CGFloat = 3
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.height = 30

        let view2 = IntrinsicView()
        view2.height = 10

        let view3 = IntrinsicView()
        view3.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.fillHorizontally([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size.width = CGRectGetWidth(self.parentViewFrame)/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.width = CGRectGetWidth(self.parentViewFrame)/number
        frame2.origin.x = frame2.size.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size.width = CGRectGetWidth(self.parentViewFrame)/number
        frame3.origin.x = frame3.size.width*2
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testFillHorizontally3Seperation() {
        let number: CGFloat = 3
        let separation: CGFloat = 27
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.height = 30

        let view2 = IntrinsicView()
        view2.height = 10

        let view3 = IntrinsicView()
        view3.height = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.fillHorizontally([view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.x = separation
        frame1.size.width = (CGRectGetWidth(self.parentViewFrame)-(separation*(number+1)))/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.width = (CGRectGetWidth(self.parentViewFrame)-(separation*(number+1)))/number
        frame2.origin.x = frame2.size.width+(separation*2)
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size.width = (CGRectGetWidth(self.parentViewFrame)-(separation*(number+1)))/number
        frame3.origin.x = (frame3.size.width*2)+(separation*number)
        frame3.size.height = view3.height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testFillVertically1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.fillVertically([view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size.height = CGRectGetHeight(self.parentViewFrame)
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testFillVertically1Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.fillVertically([view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = separation
        frame1.size.height = CGRectGetHeight(self.parentViewFrame)-separation*2
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testFillVertically2() {
        let number: CGFloat = 2
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30

        let view2 = IntrinsicView()
        view2.width = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.fillVertically([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size.height = CGRectGetHeight(self.parentViewFrame)/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.height = CGRectGetHeight(self.parentViewFrame)/number
        frame2.origin.y = frame2.size.height
        frame2.size.width = view2.width
        XCTAssertEqual(view2.frame, frame2)
    }

    func testFillVertically2Seperation() {
        let number: CGFloat = 2
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30

        let view2 = IntrinsicView()
        view2.width = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.fillVertically([view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = separation
        frame1.size.height = (CGRectGetHeight(self.parentViewFrame)-(separation*(number+1)))/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.height = (CGRectGetHeight(self.parentViewFrame)-(separation*(number+1)))/number
        frame2.origin.y = frame2.size.height+(separation*number)
        frame2.size.width = view2.width
        XCTAssertEqual(view2.frame, frame2)
    }

    func testFillVertically3() {
        let number: CGFloat = 3
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30

        let view2 = IntrinsicView()
        view2.width = 10

        let view3 = IntrinsicView()
        view3.width = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.fillVertically([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.size.height = CGRectGetHeight(self.parentViewFrame)/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.height = CGRectGetHeight(self.parentViewFrame)/number
        frame2.origin.y = frame2.size.height
        frame2.size.width = view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size.height = CGRectGetHeight(self.parentViewFrame)/number
        frame3.origin.y = (frame3.size.height*2)
        frame3.size.width = view3.width
        XCTAssertEqual(view3.frame, frame3)
    }

    func testFillVertically3Seperation() {
        let number: CGFloat = 3
        let separation: CGFloat = 27
        let priority = UILayoutPriorityDefaultHigh

        let view1 = IntrinsicView()
        view1.width = 30

        let view2 = IntrinsicView()
        view2.width = 10

        let view3 = IntrinsicView()
        view3.width = 20

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.fillVertically([view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRectZero
        frame1.origin.y = separation
        frame1.size.height = (CGRectGetHeight(self.parentViewFrame)-(separation*(number+1)))/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.size.height = (CGRectGetHeight(self.parentViewFrame)-(separation*(number+1)))/number
        frame2.origin.y = frame2.size.height+(separation*2)
        frame2.size.width = view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.size.height = (CGRectGetHeight(self.parentViewFrame)-(separation*(number+1)))/number
        frame3.origin.y = (frame3.size.height*2)+(separation*number)
        frame3.size.width = view3.width
        XCTAssertEqual(view3.frame, frame3)
    }

}

@available(iOS 9, *)
class KGNAutoLayoutTestsBound: KGNAutoLayoutTests {

    // boundHorizontally and boundVertically only 
    // work with the AutoLayout engine in iOS 9+
    func canRun() -> Bool {
        if NSProcessInfo.processInfo().operatingSystemVersion.majorVersion >= 9 {
            return true
        }
        return false
    }

    func testBoundHorizontally1() {
        if !self.canRun() {
            return
        }

        let priority = UILayoutPriorityRequired

        let view1 = UIView()
        let view1Width: CGFloat = 30
        view1.sizeToWidth(view1Width)

        let parentView = UIView()
        parentView.addSubview(view1)

        parentView.boundHorizontally([view1], priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.width = view1Width
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundHorizontally1Seperation() {
        if !self.canRun() {
            return
        }

        let number: CGFloat = 1
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow

        let view1 = UIView()
        let view1Width: CGFloat = 30
        view1.sizeToWidth(view1Width)

        let parentView = UIView()
        parentView.addSubview(view1)

        parentView.boundHorizontally([view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.width = view1Width+separation*(number+1)
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundHorizontally2() {
        if !self.canRun() {
            return
        }

        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Width: CGFloat = 30
        view1.sizeToWidth(view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        view2.sizeToWidth(view2Width)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.boundHorizontally([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.width = view1Width+view2Width
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundHorizontally2Seperation() {
        if !self.canRun() {
            return
        }

        let number: CGFloat = 2
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Width: CGFloat = 30
        view1.sizeToWidth(view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        view2.sizeToWidth(view2Width)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.boundHorizontally([view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.width = view1Width+view2Width+separation*(number+1)
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = separation*number+view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundHorizontally3() {
        if !self.canRun() {
            return
        }

        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Width: CGFloat = 30
        view1.sizeToWidth(view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        view2.sizeToWidth(view2Width)

        let view3 = UIView()
        let view3Width: CGFloat = 50
        view3.sizeToWidth(view3Width)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.boundHorizontally([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.width = view1Width+view2Width+view3Width
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.x = view1Width+view2Width
        frame3.size.width = view3Width
        XCTAssertEqual(view3.frame, frame3)
    }

    func testBoundHorizontally3Seperation() {
        if !self.canRun() {
            return
        }

        let number: CGFloat = 3
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Width: CGFloat = 30
        view1.sizeToWidth(view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        view2.sizeToWidth(view2Width)

        let view3 = UIView()
        let view3Width: CGFloat = 50
        view3.sizeToWidth(view3Width)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.boundHorizontally([view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.width = view1Width+view2Width+view3Width+separation*(number+1)
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.x = separation*2+view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.x = separation*number+view1Width+view2Width
        frame3.size.width = view3Width
        XCTAssertEqual(view3.frame, frame3)
    }

    func testBoundVertically1() {
        if !self.canRun() {
            return
        }

        let priority = UILayoutPriorityRequired

        let view1 = UIView()
        let view1Height: CGFloat = 30
        view1.sizeToHeight(view1Height)

        let parentView = UIView()
        parentView.addSubview(view1)

        parentView.boundVertically([view1], priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.height = view1Height
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundVertically1Seperation() {
        if !self.canRun() {
            return
        }

        let number: CGFloat = 1
        let separation: CGFloat = 10
        let priority = UILayoutPriorityRequired

        let view1 = UIView()
        let view1Height: CGFloat = 30
        view1.sizeToHeight(view1Height)

        let parentView = UIView()
        parentView.addSubview(view1)

        parentView.boundVertically([view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.height = view1Height+separation*(number+1)
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundVertically2() {
        if !self.canRun() {
            return
        }

        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Height: CGFloat = 30
        view1.sizeToHeight(view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        view2.sizeToHeight(view2Height)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.boundVertically([view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.height = view1Height+view2Height
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundVertically2Seperation() {
        if !self.canRun() {
            return
        }

        let number: CGFloat = 2
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Height: CGFloat = 30
        view1.sizeToHeight(view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        view2.sizeToHeight(view2Height)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)

        parentView.boundVertically([view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.height = view1Height+view2Height+separation*(number+1)
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = separation*number+view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundVertically3() {
        if !self.canRun() {
            return
        }

        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Height: CGFloat = 30
        view1.sizeToHeight(view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        view2.sizeToHeight(view2Height)

        let view3 = UIView()
        let view3Height: CGFloat = 50
        view3.sizeToHeight(view3Height)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.boundVertically([view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.height = view1Height+view2Height+view3Height
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRectZero
        frame3.origin.y = view1Height+view2Height
        frame3.size.height = view3Height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testBoundVertically3Seperation() {
        if !self.canRun() {
            return
        }

        let number: CGFloat = 3
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let view1 = UIView()
        let view1Height: CGFloat = 30
        view1.sizeToHeight(view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        view2.sizeToHeight(view2Height)

        let view3 = UIView()
        let view3Height: CGFloat = 50
        view3.sizeToHeight(view3Height)

        let parentView = UIView()
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)

        parentView.boundVertically([view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var parentFrame = CGRectZero
        parentFrame.size.height = view1Height+view2Height+view3Height+separation*(number+1)
        XCTAssertEqual(parentView.frame, parentFrame)

        var frame1 = CGRectZero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRectZero
        frame2.origin.y = separation*2+view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)
        
        var frame3 = CGRectZero
        frame3.origin.y = separation*number+view1Height+view2Height
        frame3.size.height = view3Height
        XCTAssertEqual(view3.frame, frame3)
    }
    
}
