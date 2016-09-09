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
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.width, height: self.height)
    }
}

class KGNAutoLayoutTests: XCTestCase {
    let parentViewFrame = CGRect(x: 0, y: 0, width: 300, height: 300)

    func compareViewFrame(block: (_ view: IntrinsicView) -> Void) -> CGRect {
        let parentView = UIView(frame: self.parentViewFrame)
        let childView = IntrinsicView()
        parentView.addSubview(childView)
        block(childView)
        parentView.layoutIfNeeded()
        return childView.frame
    }

    func testIntrinsicView() {
        let view = IntrinsicView()
        view.width = 10
        view.height = 20
        XCTAssertEqual(view.intrinsicContentSize, CGSize(width: 10, height: 20))
        XCTAssertEqual(IntrinsicView().intrinsicContentSize, CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric))
    }
}

class KGNAutoLayoutTestsPinSuperview: KGNAutoLayoutTests {

    func testPinToEdgesOfSuperview() {
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.pinToEdgesOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.top?.priority)
            XCTAssertEqual(priority, constraints.right?.priority)
            XCTAssertEqual(priority, constraints.bottom?.priority)
            XCTAssertEqual(priority, constraints.left?.priority)
        }
        XCTAssertEqual(childViewFrame, self.parentViewFrame)
    }

    func testPinToEdgesOfSuperviewOffset() {
        let offset: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.pinToEdgesOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.top?.priority)
            XCTAssertEqual(priority, constraints.right?.priority)
            XCTAssertEqual(priority, constraints.bottom?.priority)
            XCTAssertEqual(priority, constraints.left?.priority)
        }
        XCTAssertEqual(childViewFrame, self.parentViewFrame.insetBy(dx: offset, dy: offset))
    }

    func testPinToTopEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToTopEdgeOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: size))
    }

    func testPinToTopEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToTopEdgeOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: offset, width: size, height: size))
    }

    func testPinToRightEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToRightEdgeOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        let right = self.parentViewFrame.maxX-size
        XCTAssertEqual(childViewFrame, CGRect(x: right, y: 0, width: size, height: size))
    }

    func testPinToRightEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToRightEdgeOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        let right = self.parentViewFrame.maxX-size-offset
        XCTAssertEqual(childViewFrame, CGRect(x: right, y: 0, width: size, height: size))
    }

    func testPinToBottomEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToBottomEdgeOfSuperview()
            XCTAssertEqual(priority, constraint?.priority)
        }
        let bottom = self.parentViewFrame.maxY-size
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: bottom, width: size, height: size))
    }

    func testPinToBottomEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToBottomEdgeOfSuperview(offset: offset)
            XCTAssertEqual(priority, constraint?.priority)
        }
        let bottom = self.parentViewFrame.maxY-size-offset
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: bottom, width: size, height: size))
    }

    func testPinToLeftEdgeOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToLeftEdgeOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: size))
    }

    func testPinToLeftEdgeOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            $0.height = size
            let constraint = $0.pinToLeftEdgeOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: offset, y: 0, width: size, height: size))
    }

    func testPinToSideEdgesOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraints = $0.pinToSideEdgesOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.left?.priority)
            XCTAssertEqual(priority, constraints.right?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: self.parentViewFrame.width, height: size))
    }

    func testPinToSideEdgesOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraints = $0.pinToSideEdgesOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.left?.priority)
            XCTAssertEqual(priority, constraints.right?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: offset, y: 0, width: self.parentViewFrame.width-offset*2, height: size))
    }

    func testPinToTopAndBottomEdgesOfSuperview() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraints = $0.pinToTopAndBottomEdgesOfSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.top?.priority)
            XCTAssertEqual(priority, constraints.bottom?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: self.parentViewFrame.height))
    }

    func testPinToTopAndBottomEdgesOfSuperviewOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraints = $0.pinToTopAndBottomEdgesOfSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.top?.priority)
            XCTAssertEqual(priority, constraints.bottom?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: offset, width: size, height: self.parentViewFrame.height-offset*2))
    }

}

class KGNAutoLayoutTestsPinEdges: KGNAutoLayoutTests {

    func testPinTopEdgeToTopEdgeOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinTopEdgeToTopEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.minY
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinTopEdgeToTopEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinTopEdgeToTopEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.minY+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinRightEdgeToRightEdgeOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinRightEdgeToRightEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.maxX-size.width
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinRightEdgeToRightEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinRightEdgeToRightEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.maxX-size.width-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinBottomEdgeToBottomEdgeOfItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinBottomEdgeToBottomEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.maxY-size.height
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinBottomEdgeToBottomEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinBottomEdgeToBottomEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.maxY-size.height-offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinLeftEdgeToLeftEdge() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinLeftEdgeToLeftEdge(ofItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.minX
        XCTAssertEqual(childViewFrame, frame)
    }

    func testPinLeftEdgeToLeftEdgeOfItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.pinLeftEdgeToLeftEdge(ofItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.minX+offset
        XCTAssertEqual(childViewFrame, frame)
    }

}


class KGNAutoLayoutTestsCenter: KGNAutoLayoutTests {

    func testCenterInSuperview() {
        let size = CGSize(width: 40, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraints = $0.centerInSuperview(priority: priority)
            XCTAssertEqual(priority, constraints.horizontal?.priority)
            XCTAssertEqual(priority, constraints.vertical?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = self.parentViewFrame.midX-frame.midX
        frame.origin.y = self.parentViewFrame.midY-frame.midY
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterInSuperviewOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraints = $0.centerInSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.horizontal?.priority)
            XCTAssertEqual(priority, constraints.vertical?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = self.parentViewFrame.midX-frame.midX+offset
        frame.origin.y = self.parentViewFrame.midY-frame.midY+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterHorizontallyInSuperview() {
        let size = CGSize(width: 40, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerHorizontallyInSuperview(priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = self.parentViewFrame.midX-frame.midX
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterHorizontallyInSuperviewOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerHorizontallyInSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = self.parentViewFrame.midX-frame.midX+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyInSuperview() {
        let size = CGSize(width: 40, height: 20)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerVerticallyInSuperview(priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = self.parentViewFrame.midY-frame.midY
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyInSuperviewOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.centerVerticallyInSuperview(offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = self.parentViewFrame.midY-frame.midY+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterViewsHorizontally1() {
        let priority = UILayoutPriorityDefaultLow

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.centerHorizontally(views: [view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-frame1.midX
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

        parentView.centerHorizontally(views: [view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-frame1.midX
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

        parentView.centerHorizontally(views: [view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX
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

        parentView.centerHorizontally(views: [view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-view1.width-(separation/2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX+(separation/2)
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

        parentView.centerHorizontally(views: [view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-(view2.width/2)-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX-frame2.midX
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.x = parentView.frame.midX+(view2.width/2)
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

        parentView.centerHorizontally(views: [view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-(view2.width/2)-view1.width-separation
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX-frame2.midX
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.x = parentView.frame.midX+(view2.width/2)+separation
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

        parentView.centerHorizontally(views: [view1, view2, view3, view4], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-view2.width-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX-view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.x = parentView.frame.midX
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.x = parentView.frame.midX+view3.width
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

        parentView.centerHorizontally(views: [view1, view2, view3, view4], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-view2.width-(separation*1.5)-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX-view2.width-(separation/2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.x = parentView.frame.midX+(separation/2)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.x = parentView.frame.midX+view3.width+(separation*1.5)
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

        parentView.centerHorizontally(views: [view1, view2, view3, view4, view5], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-(view3.width/2)-view2.width-view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX-(view3.width/2)-view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.x = parentView.frame.midX-frame3.midX
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.x = parentView.frame.midX+(view3.width/2)
        XCTAssertEqual(view4.frame, frame4)

        var frame5 = CGRect.zero
        frame5.size = CGSize(width: view5.width, height: view5.height)
        frame5.origin.x = parentView.frame.midX+(view3.width/2)+view4.width
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

        parentView.centerHorizontally(views: [view1, view2, view3, view4, view5], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.x = parentView.frame.midX-(view3.width/2)-view2.width-view1.width-(separation*2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.x = parentView.frame.midX-(view3.width/2)-view2.width-separation
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.x = parentView.frame.midX-frame3.midX
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.x = parentView.frame.midX+(view3.width/2)+separation
        XCTAssertEqual(view4.frame, frame4)

        var frame5 = CGRect.zero
        frame5.size = CGSize(width: view5.width, height: view5.height)
        frame5.origin.x = parentView.frame.midX+(view3.width/2)+view4.width+(separation*2)
        XCTAssertEqual(view5.frame, frame5)
    }

    func testCenterViewsVertically1() {
        let priority = UILayoutPriorityRequired

        let view1 = IntrinsicView()
        view1.width = 20
        view1.height = 10

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.centerVertically(views: [view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-frame1.midY
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

        parentView.centerVertically(views: [view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-frame1.midY
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

        parentView.centerVertically(views: [view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY
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

        parentView.centerVertically(views: [view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-view1.height-(separation/2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY+(separation/2)
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

        parentView.centerVertically(views: [view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-(view2.height/2)-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY-frame2.midY
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.y = parentView.frame.midY+(view2.height/2)
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

        parentView.centerVertically(views: [view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-(view2.height/2)-view1.height-separation
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY-frame2.midY
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.y = parentView.frame.midY+(view2.height/2)+separation
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

        parentView.centerVertically(views: [view1, view2, view3, view4], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-view2.height-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY-view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.y = parentView.frame.midY
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.y = parentView.frame.midY+view3.height
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

        parentView.centerVertically(views: [view1, view2, view3, view4], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-view2.height-(separation*1.5)-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY-view2.height-(separation/2)
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.y = parentView.frame.midY+(separation/2)
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.y = parentView.frame.midY+view3.height+(separation*1.5)
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

        parentView.centerVertically(views: [view1, view2, view3, view4, view5], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-(view3.height/2)-view2.height-view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY-(view3.height/2)-view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.y = parentView.frame.midY-frame3.midY
        XCTAssertEqual(view3.frame, frame3)

        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.y = parentView.frame.midY+(view3.height/2)
        XCTAssertEqual(view4.frame, frame4)

        var frame5 = CGRect.zero
        frame5.size = CGSize(width: view5.width, height: view5.height)
        frame5.origin.y = parentView.frame.midY+(view3.height/2)+view4.height
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

        parentView.centerVertically(views: [view1, view2, view3, view4, view5], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size = CGSize(width: view1.width, height: view1.height)
        frame1.origin.y = parentView.frame.midY-(view3.height/2)-view2.height-view1.height-(separation*2)
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size = CGSize(width: view2.width, height: view2.height)
        frame2.origin.y = parentView.frame.midY-(view3.height/2)-view2.height-separation
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size = CGSize(width: view3.width, height: view3.height)
        frame3.origin.y = parentView.frame.midY-frame3.midY
        XCTAssertEqual(view3.frame, frame3)
        
        var frame4 = CGRect.zero
        frame4.size = CGSize(width: view4.width, height: view4.height)
        frame4.origin.y = parentView.frame.midY+(view3.height/2)+separation
        XCTAssertEqual(view4.frame, frame4)
        
        var frame5 = CGRect.zero
        frame5.size = CGSize(width: view5.width, height: view5.height)
        frame5.origin.y = parentView.frame.midY+(view3.height/2)+view4.height+(separation*2)
        XCTAssertEqual(view5.frame, frame5)
    }
    
    func testCenterHorizontallyToItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 20, y: 30, width: 40, height: 50)
        let priority = UILayoutPriorityRequired

        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerHorizontally(toItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.midX-size.width/2
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterHorizontallyToItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 30, y: 20, width: 10, height: 80)
        let priority = UILayoutPriorityDefaultLow

        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerHorizontally(toItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.x = itemFrame.midX-size.width/2+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyToItem() {
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 100, y: 80, width: 60, height: 40)
        let priority = UILayoutPriorityDefaultLow

        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerVertically(toItem: itemView, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.midY-size.height/2
        XCTAssertEqual(childViewFrame, frame)
    }

    func testCenterVerticallyToItemOffset() {
        let offset: CGFloat = 10
        let size = CGSize(width: 40, height: 20)
        let itemFrame = CGRect(x: 120, y: 50, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height

            let itemView = UIView(frame: itemFrame)
            $0.superview!.addSubview(itemView)

            let constraint = $0.centerVertically(toItem: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.midY-size.height/2+offset
        XCTAssertEqual(childViewFrame, frame)
    }

}

class KGNAutoLayoutTestsSize: KGNAutoLayoutTests {

    func testSizeToWidth() {
        let size = CGSize(width: 50, height: 10)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.height = size.height
            let constraint = $0.size(toWidth: size.width, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }

    func testSizeToMinWidth() {
        let minWidth: CGFloat = 100
        let size = CGSize(width: 50, height: 10)
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.size(toMinWidth: minWidth, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: minWidth, height: size.height))
    }

    func testSizeToMaxWidth() {
        let maxWidth: CGFloat = 20
        let size = CGSize(width: 50, height: 10)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.size(toMaxWidth: maxWidth, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: maxWidth, height: size.height))
    }

    func testSizeToHeight() {
        let size = CGSize(width: 10, height: 50)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            let constraint = $0.size(toHeight: size.height, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }

    func testSizeToMinHeight() {
        let minHeight: CGFloat = 100
        let size = CGSize(width: 10, height: 50)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.size(toMinHeight: minHeight, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size.width, height: minHeight))
    }

    func testSizeToMaxHeight() {
        let maxHeight: CGFloat = 20
        let size = CGSize(width: 10, height: 50)
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size.width
            $0.height = size.height
            let constraint = $0.size(toMaxHeight: maxHeight, priority: priority)
            XCTAssertEqual(priority, constraint.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size.width, height: maxHeight))
    }

    func testSizeWidthAndHeight() {
        let size:CGFloat = 30
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.size(toWidthAndHeight: size, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: size))
    }

    func testSizeMinWidthAndHeight() {
        let minSize: CGFloat = 30
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = 10
            $0.height = 20
            let constraints = $0.size(toMinWidthAndHeight: minSize, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: minSize, height: minSize))
    }

    func testSizeMaxWidthAndHeight() {
        let maxSize: CGFloat = 30
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = 100
            $0.height = 40
            let constraints = $0.size(toMaxWidthAndHeight: maxSize, priority: priority)
            XCTAssertEqual(priority, constraints.width.priority)
            XCTAssertEqual(priority, constraints.height.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: maxSize, height: maxSize))
    }

    func testSizeWidthToWidthOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToWidth(ofItem: $0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: self.parentViewFrame.width, height: size))
    }

    func testSizeWidthToWidthOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToWidth(ofItem: $0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: self.parentViewFrame.width-offset, height: size))
    }

    func testSizeHeightToHeightOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToHeight(ofItem: $0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: self.parentViewFrame.height))
    }

    func testSizeHeightToHeightOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToHeight(ofItem: $0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: self.parentViewFrame.height-offset))
    }

    func testSizeHeightToWidthOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToWidth(ofItem: $0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: self.parentViewFrame.height))
    }

    func testSizeHeightToWidthOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToWidth(ofItem: $0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: self.parentViewFrame.height-offset))
    }

    func testSizeWidthToHeightOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToHeight(ofItem: $0.superview!, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: self.parentViewFrame.height, height: size))
    }

    func testSizeWidthToHeightOfItemOffset() {
        let size: CGFloat = 10
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToHeight(ofItem: $0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: self.parentViewFrame.height-offset, height: size))
    }

    func testSizeToWidthAndHeightOfItem() {
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeWidthAndHeightToWidthAndHeight(ofItem: $0.superview!, priority: priority)
            XCTAssertEqual(priority, constraints.width?.priority)
            XCTAssertEqual(priority, constraints.height?.priority)
        }
        XCTAssertEqual(childViewFrame, self.parentViewFrame)
    }

    func testSizeToWidthAndHeightOfItemOffset() {
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeWidthAndHeightToWidthAndHeight(ofItem: $0.superview!, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.width?.priority)
            XCTAssertEqual(priority, constraints.height?.priority)
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
            let constraint = $0.sizeHeightToWidth(withAspectRatio: aspectRatio, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: size*aspectRatio))
    }

    func testSizeWidthToHeightAspectRatio() {
        let size: CGFloat = 20
        let aspectRatio: CGFloat = 2
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToHeight(withAspectRatio: aspectRatio, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size*aspectRatio, height: size))
    }

}

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

            let constraint = $0.positionAbove(item: itemView, priority: priority)
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

            let constraint = $0.positionAbove(item: itemView, offset: offset, priority: priority)
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

            let constraint = $0.positionToTheRight(ofItem: itemView, priority: priority)
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

            let constraint = $0.positionToTheRight(ofItem: itemView, offset: offset, priority: priority)
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

            let constraint = $0.positionBelow(item: itemView, priority: priority)
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

            let constraint = $0.positionBelow(item: itemView, offset: offset, priority: priority)
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

            let constraint = $0.positionToTheLeft(ofItem: itemView, priority: priority)
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

            let constraint = $0.positionToTheLeft(ofItem: itemView, offset: offset, priority: priority)
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

        itemView.positionAbove(views: [view1], priority: priority)
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

        itemView.positionAbove(views: [view1], offset: offset, priority: priority)
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

        itemView.positionAbove(views: [view1, view2], priority: priority)
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

        itemView.positionAbove(views: [view1, view2], offset: offset, priority: priority)
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

        itemView.positionAbove(views: [view1, view2, view3], priority: priority)
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

        itemView.positionAbove(views: [view1, view2, view3], offset: offset, priority: priority)
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

        itemView.positionToTheRight(views: [view1], priority: priority)
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

        itemView.positionToTheRight(views: [view1], offset: offset, priority: priority)
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

        itemView.positionToTheRight(views: [view1, view2], priority: priority)
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

        itemView.positionToTheRight(views: [view1, view2], offset: offset, priority: priority)
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

        itemView.positionToTheRight(views: [view1, view2, view3], priority: priority)
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

        itemView.positionToTheRight(views: [view1, view2, view3], offset: offset, priority: priority)
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

        itemView.positionBelow(views: [view1], priority: priority)
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

        itemView.positionBelow(views: [view1], offset: offset, priority: priority)
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

        itemView.positionBelow(views: [view1, view2], priority: priority)
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

        itemView.positionBelow(views: [view1, view2], offset: offset, priority: priority)
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

        itemView.positionBelow(views: [view1, view2, view3], priority: priority)
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

        itemView.positionBelow(views: [view1, view2, view3], offset: offset, priority: priority)
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

        itemView.positionToTheLeft(views: [view1], priority: priority)
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

        itemView.positionToTheLeft(views: [view1], offset: offset, priority: priority)
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

        itemView.positionToTheLeft(views: [view1, view2], priority: priority)
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

        itemView.positionToTheLeft(views: [view1, view2], offset: offset, priority: priority)
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

        itemView.positionToTheLeft(views: [view1, view2, view3], priority: priority)
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
        
        itemView.positionToTheLeft(views: [view1, view2, view3], offset: offset, priority: priority)
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

class KGNAutoLayoutTestsBetween: KGNAutoLayoutTests {

    func testFitBetweenTopItemAndBottomItem() {
        let width: CGFloat = 40
        let topFrame = CGRect(x: 10, y: 20, width: 30, height: 40)
        let bottomFrame = CGRect(x: 50, y: 120, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = width

            let topView = UIView(frame: topFrame)
            $0.superview!.addSubview(topView)

            let bottomView = UIView(frame: bottomFrame)
            $0.superview!.addSubview(bottomView)

            let constraints = $0.fitBetween(topItem: topView, bottomItem: bottomView, priority: priority)
            XCTAssertEqual(priority, constraints.top?.priority)
            XCTAssertEqual(priority, constraints.bottom?.priority)
        }
        var frame = CGRect.zero
        frame.size.width = width
        frame.size.height = bottomFrame.minY-topFrame.maxY
        frame.origin.y = topFrame.maxY
        XCTAssertEqual(childViewFrame, frame)
    }

    func testFitBetweenTopItemAndBottomItemOffset() {
        let width: CGFloat = 40
        let offset: CGFloat = 10
        let topFrame = CGRect(x: 10, y: 20, width: 30, height: 40)
        let bottomFrame = CGRect(x: 50, y: 120, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = width

            let topView = UIView(frame: topFrame)
            $0.superview!.addSubview(topView)

            let bottomView = UIView(frame: bottomFrame)
            $0.superview!.addSubview(bottomView)

            let constraints = $0.fitBetween(topItem: topView, bottomItem: bottomView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.top?.priority)
            XCTAssertEqual(priority, constraints.bottom?.priority)
        }
        var frame = CGRect.zero
        frame.size.width = width
        frame.size.height = bottomFrame.minY-topFrame.maxY-offset*2
        frame.origin.y = topFrame.maxY+offset
        XCTAssertEqual(childViewFrame, frame)
    }

    func testFitBetweenLeftItemAndRightItem() {
        let height: CGFloat = 40
        let leftFrame = CGRect(x: 10, y: 20, width: 30, height: 40)
        let rightFrame = CGRect(x: 80, y: 40, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = height

            let leftView = UIView(frame: leftFrame)
            $0.superview!.addSubview(leftView)

            let rightView = UIView(frame: rightFrame)
            $0.superview!.addSubview(rightView)

            let constraints = $0.fitBetween(leftItem: leftView, rightItem: rightView, priority: priority)
            XCTAssertEqual(priority, constraints.left?.priority)
            XCTAssertEqual(priority, constraints.right?.priority)
        }
        var frame = CGRect.zero
        frame.size.height = height
        frame.size.width = rightFrame.minX-leftFrame.maxX
        frame.origin.x = leftFrame.maxX
        XCTAssertEqual(childViewFrame, frame)
    }

    func testFitBetweenLeftItemAndRightItemOffset() {
        let height: CGFloat = 40
        let offset: CGFloat = 10
        let leftFrame = CGRect(x: 10, y: 20, width: 30, height: 40)
        let rightFrame = CGRect(x: 80, y: 40, width: 60, height: 20)
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = height

            let leftView = UIView(frame: leftFrame)
            $0.superview!.addSubview(leftView)

            let rightView = UIView(frame: rightFrame)
            $0.superview!.addSubview(rightView)

            let constraints = $0.fitBetween(leftItem: leftView, rightItem: rightView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.left?.priority)
            XCTAssertEqual(priority, constraints.right?.priority)
        }
        var frame = CGRect.zero
        frame.size.height = height
        frame.size.width = rightFrame.minX-leftFrame.maxX-offset*2
        frame.origin.x = leftFrame.maxX+offset
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

        parentView.fillHorizontally(views: [view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size.width = self.parentViewFrame.width
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

        parentView.fillHorizontally(views: [view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = self.parentViewFrame.width-separation*2
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

        parentView.fillHorizontally(views: [view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size.width = self.parentViewFrame.width/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.width = self.parentViewFrame.width/number
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

        parentView.fillHorizontally(views: [view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = (self.parentViewFrame.width-(separation*(number+1)))/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.width = (self.parentViewFrame.width-(separation*(number+1)))/number
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

        parentView.fillHorizontally(views: [view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size.width = self.parentViewFrame.width/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.width = self.parentViewFrame.width/number
        frame2.origin.x = frame2.size.width
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size.width = self.parentViewFrame.width/number
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

        parentView.fillHorizontally(views: [view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = (self.parentViewFrame.width-(separation*(number+1)))/number
        frame1.size.height = view1.height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.width = (self.parentViewFrame.width-(separation*(number+1)))/number
        frame2.origin.x = frame2.size.width+(separation*2)
        frame2.size.height = view2.height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size.width = (self.parentViewFrame.width-(separation*(number+1)))/number
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

        parentView.fillVertically(views: [view1], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size.height = self.parentViewFrame.height
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

        parentView.fillVertically(views: [view1], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = self.parentViewFrame.height-separation*2
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

        parentView.fillVertically(views: [view1, view2], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size.height = self.parentViewFrame.height/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.height = self.parentViewFrame.height/number
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

        parentView.fillVertically(views: [view1, view2], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = (self.parentViewFrame.height-(separation*(number+1)))/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.height = (self.parentViewFrame.height-(separation*(number+1)))/number
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

        parentView.fillVertically(views: [view1, view2, view3], priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.size.height = self.parentViewFrame.height/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.height = self.parentViewFrame.height/number
        frame2.origin.y = frame2.size.height
        frame2.size.width = view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size.height = self.parentViewFrame.height/number
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

        parentView.fillVertically(views: [view1, view2, view3], separation: separation, priority: priority)
        parentView.layoutIfNeeded()

        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = (self.parentViewFrame.height-(separation*(number+1)))/number
        frame1.size.width = view1.width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.size.height = (self.parentViewFrame.height-(separation*(number+1)))/number
        frame2.origin.y = frame2.size.height+(separation*2)
        frame2.size.width = view2.width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.size.height = (self.parentViewFrame.height-(separation*(number+1)))/number
        frame3.origin.y = (frame3.size.height*2)+(separation*number)
        frame3.size.width = view3.width
        XCTAssertEqual(view3.frame, frame3)
    }

}

class KGNAutoLayoutTestsBound: KGNAutoLayoutTests {

    func testBoundHorizontally1() {
        let priority = UILayoutPriorityRequired

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        boundView.boundHorizontally(views: [view1], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.width = view1Width
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundHorizontally1Seperation() {
        let number: CGFloat = 1
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)
        
        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        boundView.boundHorizontally(views: [view1], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.origin.x = -separation
        boundViewFrame.size.width = view1Width+separation*(number+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundHorizontally2() {
        let priority = UILayoutPriorityDefaultLow

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toWidth: view2Width)

        boundView.boundHorizontally(views: [view1, view2], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.width = view1Width+view2Width
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundHorizontally2Seperation() {
        let number: CGFloat = 2
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toWidth: view2Width)

        boundView.boundHorizontally(views: [view1, view2], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.origin.x = -separation
        boundViewFrame.size.width = view1Width+view2Width+separation*(number+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = separation*number+view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundHorizontally3() {
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toWidth: view2Width)

        let view3 = UIView()
        let view3Width: CGFloat = 50
        boundView.addSubview(view3)
        view3.size(toWidth: view3Width)

        boundView.boundHorizontally(views: [view1, view2, view3], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.width = view1Width+view2Width+view3Width
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.x = view1Width+view2Width
        frame3.size.width = view3Width
        XCTAssertEqual(view3.frame, frame3)
    }

    func testBoundHorizontally3Seperation() {
        let number: CGFloat = 3
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        let view2 = UIView()
        let view2Width: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toWidth: view2Width)

        let view3 = UIView()
        let view3Width: CGFloat = 50
        boundView.addSubview(view3)
        view3.size(toWidth: view3Width)

        boundView.boundHorizontally(views: [view1, view2, view3], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.origin.x = -separation
        boundViewFrame.size.width = view1Width+view2Width+view3Width+separation*(number+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = separation*2+view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.x = separation*number+view1Width+view2Width
        frame3.size.width = view3Width
        XCTAssertEqual(view3.frame, frame3)
    }

    func testBoundVertically1() {
        let priority = UILayoutPriorityRequired

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        boundView.boundVertically(views: [view1], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.height = view1Height
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundVertically1Seperation() {
        let number: CGFloat = 1
        let separation: CGFloat = 10
        let priority = UILayoutPriorityRequired

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        boundView.boundVertically(views: [view1], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.origin.y = -separation
        boundViewFrame.size.height = view1Height+separation*(number+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundVertically2() {
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toHeight: view2Height)

        boundView.boundVertically(views: [view1, view2], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.height = view1Height+view2Height
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundVertically2Seperation() {
        let number: CGFloat = 2
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)
        
        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toHeight: view2Height)

        boundView.boundVertically(views: [view1, view2], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.origin.y = -separation
        boundViewFrame.size.height = view1Height+view2Height+separation*(number+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = separation*number+view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundVertically3() {
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toHeight: view2Height)

        let view3 = UIView()
        let view3Height: CGFloat = 50
        boundView.addSubview(view3)
        view3.size(toHeight: view3Height)

        boundView.boundVertically(views: [view1, view2, view3], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.height = view1Height+view2Height+view3Height
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)

        var frame3 = CGRect.zero
        frame3.origin.y = view1Height+view2Height
        frame3.size.height = view3Height
        XCTAssertEqual(view3.frame, frame3)
    }

    func testBoundVertically3Seperation() {
        let number: CGFloat = 3
        let separation: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        let view2 = UIView()
        let view2Height: CGFloat = 20
        boundView.addSubview(view2)
        view2.size(toHeight: view2Height)

        let view3 = UIView()
        let view3Height: CGFloat = 50
        boundView.addSubview(view3)
        view3.size(toHeight: view3Height)

        boundView.boundVertically(views: [view1, view2, view3], separation: separation, priority: priority)

        parentView.layoutIfNeeded()
        
        var boundViewFrame = CGRect.zero
        boundViewFrame.origin.y = -separation
        boundViewFrame.size.height = view1Height+view2Height+view3Height+separation*(number+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)
        
        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)
        
        var frame2 = CGRect.zero
        frame2.origin.y = separation*2+view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)
        
        var frame3 = CGRect.zero
        frame3.origin.y = separation*number+view1Height+view2Height
        frame3.size.height = view3Height
        XCTAssertEqual(view3.frame, frame3)
    }
    
}
