//
//  LayoutView.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/23/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

class LayoutView: UIView {

    var intrinsicContentWidth: CGFloat?
    var intrinsicContentHeight: CGFloat?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.opaque = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.opaque = false
    }

    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = super.intrinsicContentSize()

        if let intrinsicContentWidth = self.intrinsicContentWidth {
            intrinsicContentSize.width = intrinsicContentWidth
        }

        if let intrinsicContentHeight = self.intrinsicContentHeight {
            intrinsicContentSize.height = intrinsicContentHeight
        }

        return intrinsicContentSize
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        let lineWidth: CGFloat = 1
        let lineOffset: CGFloat = 0.5
        let lineColor = UIColor.whiteColor()
        let context = UIGraphicsGetCurrentContext()

        CGContextSetRGBFillColor(context, 1, 1, 1, 0.5)
        CGContextFillRect(context, CGRectInset(rect, lineOffset, lineOffset))

        CGContextSetLineWidth(context, lineWidth)
        CGContextSetLineJoin(context, .Round)
        CGContextSetStrokeColorWithColor(context, lineColor.CGColor)

        CGContextStrokeRect(context, CGRectInset(rect, lineOffset, lineOffset))
    }

}
