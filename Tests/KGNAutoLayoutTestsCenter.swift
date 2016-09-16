//
//  KGNAutoLayoutTests.swift
//  KGNAutoLayoutTests
//
//  Created by David Keegan on 10/12/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import XCTest
@testable import KGNAutoLayout

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
            let constraints = $0.centerInSuperview(withOffset: offset, priority: priority)
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
            let constraint = $0.centerHorizontallyInSuperview(withOffset: offset, priority: priority)
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
            let constraint = $0.centerVerticallyInSuperview(withOffset: offset, priority: priority)
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

        parentView.centerHorizontally([view1], priority: priority)
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

        parentView.centerHorizontally([view1], withSeparation: separation, priority: priority)
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

        parentView.centerHorizontally([view1, view2], priority: priority)
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

        parentView.centerHorizontally([view1, view2], withSeparation: separation, priority: priority)
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

        parentView.centerHorizontally([view1, view2, view3], priority: priority)
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

        parentView.centerHorizontally([view1, view2, view3], withSeparation: separation, priority: priority)
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

        parentView.centerHorizontally([view1, view2, view3, view4], priority: priority)
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

        parentView.centerHorizontally([view1, view2, view3, view4], withSeparation: separation, priority: priority)
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

        parentView.centerHorizontally([view1, view2, view3, view4, view5], priority: priority)
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

        parentView.centerHorizontally([view1, view2, view3, view4, view5], withSeparation: separation, priority: priority)
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

        parentView.centerVertically([view1], priority: priority)
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

        parentView.centerVertically([view1], withSeparation: separation, priority: priority)
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

        parentView.centerVertically([view1, view2], priority: priority)
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

        parentView.centerVertically([view1, view2], withSeparation: separation, priority: priority)
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

        parentView.centerVertically([view1, view2, view3], priority: priority)
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

        parentView.centerVertically([view1, view2, view3], withSeparation: separation, priority: priority)
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

        parentView.centerVertically([view1, view2, view3, view4], priority: priority)
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

        parentView.centerVertically([view1, view2, view3, view4], withSeparation: separation, priority: priority)
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

        parentView.centerVertically([view1, view2, view3, view4, view5], priority: priority)
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

        parentView.centerVertically([view1, view2, view3, view4, view5], withSeparation: separation, priority: priority)
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

            let constraint = $0.centerHorizontally(to: itemView, priority: priority)
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

            let constraint = $0.centerHorizontally(to: itemView, offset: offset, priority: priority)
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

            let constraint = $0.centerVertically(to: itemView, priority: priority)
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

            let constraint = $0.centerVertically(to: itemView, offset: offset, priority: priority)
            XCTAssertEqual(priority, constraint?.priority)
        }
        var frame = CGRect.zero
        frame.size = size
        frame.origin.y = itemFrame.midY-size.height/2+offset
        XCTAssertEqual(childViewFrame, frame)
    }

}
