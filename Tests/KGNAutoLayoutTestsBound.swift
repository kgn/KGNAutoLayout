//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

class KGNAutoLayoutTestsBound: KGNAutoLayoutTests {

    func testBoundHorizontally1() {
        let priority = UILayoutPriority.required

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        boundView.boundHorizontally(withViews: [view1], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.width = view1Width
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundHorizontally1Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriority.defaultHigh

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)
        
        let view1 = UIView()
        let view1Width: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toWidth: view1Width)

        boundView.boundHorizontally(withViews: [view1], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.width = view1Width+separation*CGFloat(boundView.subviews.count+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundHorizontally2() {
        let priority = UILayoutPriority.defaultLow

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

        boundView.boundHorizontally(withViews: [view1, view2], priority: priority)

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
        let separation: CGFloat = 10
        let priority = UILayoutPriority.defaultHigh

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

        boundView.boundHorizontally(withViews: [view1, view2], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.width = view1Width+view2Width+separation*CGFloat(boundView.subviews.count+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.x = separation
        frame1.size.width = view1Width
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.x = separation*CGFloat(boundView.subviews.count)+view1Width
        frame2.size.width = view2Width
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundHorizontally3() {
        let priority = UILayoutPriority.defaultHigh

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

        boundView.boundHorizontally(withViews: [view1, view2, view3], priority: priority)

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
        let separation: CGFloat = 10
        let priority = UILayoutPriority.defaultHigh

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

        boundView.boundHorizontally(withViews: [view1, view2, view3], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.width = view1Width+view2Width+view3Width+separation*CGFloat(boundView.subviews.count+1)
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
        frame3.origin.x = separation*CGFloat(boundView.subviews.count)+view1Width+view2Width
        frame3.size.width = view3Width
        XCTAssertEqual(view3.frame, frame3)
    }

    func testBoundVertically1() {
        let priority = UILayoutPriority.required

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        boundView.boundVertically(withViews: [view1], priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.height = view1Height
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundVertically1Seperation() {
        let separation: CGFloat = 10
        let priority = UILayoutPriority.required

        let parentView = UIView(frame: self.parentViewFrame)

        let boundView = UIView()
        parentView.addSubview(boundView)

        let view1 = UIView()
        let view1Height: CGFloat = 30
        boundView.addSubview(view1)
        view1.size(toHeight: view1Height)

        boundView.boundVertically(withViews: [view1], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.height = view1Height+separation*CGFloat(boundView.subviews.count+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)
    }

    func testBoundVertically2() {
        let priority = UILayoutPriority.defaultHigh

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

        boundView.boundVertically(withViews: [view1, view2], priority: priority)

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
        let separation: CGFloat = 10
        let priority = UILayoutPriority.defaultHigh

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

        boundView.boundVertically(withViews: [view1, view2], separation: separation, priority: priority)

        parentView.layoutIfNeeded()

        var boundViewFrame = CGRect.zero
        boundViewFrame.size.height = view1Height+view2Height+separation*CGFloat(boundView.subviews.count+1)
        XCTAssertEqual(boundView.frame, boundViewFrame)

        var frame1 = CGRect.zero
        frame1.origin.y = separation
        frame1.size.height = view1Height
        XCTAssertEqual(view1.frame, frame1)

        var frame2 = CGRect.zero
        frame2.origin.y = separation*CGFloat(boundView.subviews.count)+view1Height
        frame2.size.height = view2Height
        XCTAssertEqual(view2.frame, frame2)
    }

    func testBoundVertically3() {
        let priority = UILayoutPriority.defaultHigh

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

        boundView.boundVertically(withViews: [view1, view2, view3], priority: priority)

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
        let separation: CGFloat = 10
        let priority = UILayoutPriority.defaultHigh

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

        boundView.boundVertically(withViews: [view1, view2, view3], separation: separation, priority: priority)

        parentView.layoutIfNeeded()
        
        var boundViewFrame = CGRect.zero
        boundViewFrame.size.height = view1Height+view2Height+view3Height+separation*CGFloat(boundView.subviews.count+1)
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
        frame3.origin.y = separation*CGFloat(boundView.subviews.count)+view1Height+view2Height
        frame3.size.height = view3Height
        XCTAssertEqual(view3.frame, frame3)
    }
    
}
