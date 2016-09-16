//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

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

            let constraints = $0.fitBetween(top: topView, andBottom: bottomView, priority: priority)
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

            let constraints = $0.fitBetween(top: topView, andBottom: bottomView, withOffset: offset, priority: priority)
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

            let constraints = $0.fitBetween(left: leftView, andRight: rightView, priority: priority)
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

            let constraints = $0.fitBetween(left: leftView, andRight: rightView, withOffset: offset, priority: priority)
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
