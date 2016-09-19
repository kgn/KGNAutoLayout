//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

class KGNAutoLayoutTestsFill: KGNAutoLayoutTests {

    func testFillHorizontally1() {
        let priority = UILayoutPriorityRequired

        let view1 = IntrinsicView()
        view1.height = 30

        let parentView = UIView(frame: self.parentViewFrame)
        parentView.addSubview(view1)

        parentView.fillHorizontally(withViews: [view1], priority: priority)
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

        parentView.fillHorizontally(withViews: [view1], separation: separation, priority: priority)
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

        parentView.fillHorizontally(withViews: [view1, view2], priority: priority)
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

        parentView.fillHorizontally(withViews: [view1, view2], separation: separation, priority: priority)
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

        parentView.fillHorizontally(withViews: [view1, view2, view3], priority: priority)
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

        parentView.fillHorizontally(withViews: [view1, view2, view3], separation: separation, priority: priority)
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

        parentView.fillVertically(withViews: [view1], priority: priority)
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

        parentView.fillVertically(withViews: [view1], separation: separation, priority: priority)
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

        parentView.fillVertically(withViews: [view1, view2], priority: priority)
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

        parentView.fillVertically(withViews: [view1, view2], separation: separation, priority: priority)
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

        parentView.fillVertically(withViews: [view1, view2, view3], priority: priority)
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

        parentView.fillVertically(withViews: [view1, view2, view3], separation: separation, priority: priority)
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
