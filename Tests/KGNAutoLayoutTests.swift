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
    let parentViewFrame = CGRectMake(0, 0, 100, 100)

    func compareViewFrame(block: (view: IntrinsicView) -> Void) -> CGRect {
        let parentView = UIView(frame: self.parentViewFrame)
        let childView = IntrinsicView()
        parentView.addSubview(childView)
        block(view: childView)
        childView.layoutIfNeeded()
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
        let priority = UILayoutPriorityDefaultLow
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
        let priority = UILayoutPriorityDefaultLow
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

    }

    func testCenterInSuperviewOffset() {

    }

    func testCenterHorizontallyInSuperview() {

    }

    func testCenterHorizontallyInSuperviewOffset() {

    }

    func testCenterVerticallyInSuperview() {

    }

    func testCenterVerticallyInSuperviewOffset() {

    }

    func testCenterViewsHorizontally() {

    }

    func testCenterViewsHorizontallySeperation() {

    }

    func testCenterViewsVertically() {

    }

    func testCenterViewsVerticallySeperation() {

    }

    func testCenterHorizontallyToItem() {

    }

    func testCenterHorizontallyToItemOffset() {

    }

    func testCenterVerticallyToItem() {

    }

    func testCenterVerticallyToItemOffset() {

    }

    // MARK: - Size

    func testSizeWidth() {

    }

    func testSizeHeight() {

    }

    func testSizeWidthAndHeight() {

    }

    func testSizeWidthToWidthOfItem() {

    }

    func testSizeWidthToWidthOfItemOffset() {

    }

    func testSizeHeightToHeightOfItem() {

    }

    func testSizeHeightToHeightOfItemOffset() {

    }

    func testSizeHeightToWidthOfItem() {

    }

    func testSizeWidthToHeightOfItem() {

    }

    func testSizeToWidthAndHeightOfItem() {

    }

    func testSizeToWidthAndHeightOfItemOffset() {

    }

    func testSizeHeightToWidthAspectRatio() {

    }

    func testSizeWidthToHeightAspectRatio() {

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
