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
