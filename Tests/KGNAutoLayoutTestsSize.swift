//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

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
            let constraint = $0.sizeWidthToWidth(of: $0.superview!, priority: priority)
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
            let constraint = $0.sizeWidthToWidth(of: $0.superview!, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: self.parentViewFrame.width-offset, height: size))
    }

    func testSizeHeightToHeightOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityRequired
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToHeight(of: $0.superview!, priority: priority)
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
            let constraint = $0.sizeHeightToHeight(of: $0.superview!, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: self.parentViewFrame.height-offset))
    }

    func testSizeHeightToWidthOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.width = size
            let constraint = $0.sizeHeightToWidth(of: $0.superview!, priority: priority)
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
            let constraint = $0.sizeHeightToWidth(of: $0.superview!, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: size, height: self.parentViewFrame.height-offset))
    }

    func testSizeWidthToHeightOfItem() {
        let size: CGFloat = 10
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            $0.height = size
            let constraint = $0.sizeWidthToHeight(of: $0.superview!, priority: priority)
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
            let constraint = $0.sizeWidthToHeight(of: $0.superview!, withOffset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        XCTAssertEqual(childViewFrame, CGRect(x: 0, y: 0, width: self.parentViewFrame.height-offset, height: size))
    }

    func testSizeToWidthAndHeightOfItem() {
        let priority = UILayoutPriorityDefaultLow
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeWidthAndHeightToWidthAndHeight(of: $0.superview!, priority: priority)
            XCTAssertEqual(priority, constraints.width?.priority)
            XCTAssertEqual(priority, constraints.height?.priority)
        }
        XCTAssertEqual(childViewFrame, self.parentViewFrame)
    }

    func testSizeToWidthAndHeightOfItemOffset() {
        let offset: CGFloat = 20
        let priority = UILayoutPriorityDefaultHigh
        let childViewFrame = self.compareViewFrame {
            let constraints = $0.sizeWidthAndHeightToWidthAndHeight(of: $0.superview!, withOffset: offset, priority: priority)
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
