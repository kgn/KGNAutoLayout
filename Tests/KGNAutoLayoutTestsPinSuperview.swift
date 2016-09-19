//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

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
            let constraints = $0.pinToEdgesOfSuperview(withOffset: offset, priority: priority)
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
            let constraint = $0.pinToTopEdgeOfSuperview(withOffset: offset, priority: priority)
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
            let constraint = $0.pinToRightEdgeOfSuperview(withOffset: offset, priority: priority)
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
            let constraint = $0.pinToBottomEdgeOfSuperview(withOffset: offset)
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
            let constraint = $0.pinToLeftEdgeOfSuperview(withOffset: offset, priority: priority)
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
            let constraints = $0.pinToSideEdgesOfSuperview(withOffset: offset, priority: priority)
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
            let constraints = $0.pinToTopAndBottomEdgesOfSuperview(withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraints.top?.priority)
            XCTAssertEqual(priority, constraints.bottom?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: offset, width: size, height: self.parentViewFrame.height-offset*2))
    }

}
