//
//  SpringView.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/24/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

enum SpringViewDirection {
    case Horizontal
    case Vertical
}

class SpringView: UIView {

    var showEnds: Bool = true
    var direction: SpringViewDirection = .Horizontal

    override func intrinsicContentSize() -> CGSize {
        if direction == .Horizontal {
            return CGSizeMake(UIViewNoIntrinsicMetric, 20)
        } else {
            return CGSizeMake(20, UIViewNoIntrinsicMetric)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.opaque = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.opaque = false
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        let lineSize: CGFloat = 1
        let lineOffset: CGFloat = 0.5
        let context = UIGraphicsGetCurrentContext()
        let lineColor = UIColor(red: 1, green: 0.2902, blue: 0.2902, alpha: 1)

        CGContextSetLineWidth(context, lineSize)
        CGContextSetLineCap(context, .Round)
        CGContextSetStrokeColorWithColor(context, lineColor.CGColor)

        if direction == .Horizontal {
            CGContextSaveGState(context)
            CGContextSetLineDash(context, 0, [2, 2], 2)
            CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMidY(rect)+lineOffset)
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMidY(rect)+lineOffset)
            CGContextStrokePath(context)
            CGContextRestoreGState(context)

            if self.showEnds {
                CGContextSaveGState(context)
                CGContextMoveToPoint(context, lineOffset, CGRectGetMinY(rect))
                CGContextAddLineToPoint(context, lineOffset, CGRectGetMaxY(rect))
                CGContextStrokePath(context)
                CGContextRestoreGState(context)

                CGContextSaveGState(context)
                CGContextMoveToPoint(context, CGRectGetMaxX(rect)-lineOffset, CGRectGetMinY(rect))
                CGContextAddLineToPoint(context, CGRectGetMaxX(rect)-lineOffset, CGRectGetMaxY(rect))
                CGContextStrokePath(context)
                CGContextRestoreGState(context)
            }
        } else {
            CGContextSaveGState(context)
            CGContextSetLineDash(context, 0, [2, 2], 2)
            CGContextMoveToPoint(context, CGRectGetMidX(rect)+lineOffset, CGRectGetMinY(rect))
            CGContextAddLineToPoint(context, CGRectGetMidX(rect)+lineOffset, CGRectGetMaxY(rect))
            CGContextStrokePath(context)
            CGContextRestoreGState(context)

            if self.showEnds {
                CGContextSaveGState(context)
                CGContextMoveToPoint(context, CGRectGetMinX(rect), lineOffset)
                CGContextAddLineToPoint(context, CGRectGetMaxX(rect), lineOffset)
                CGContextStrokePath(context)
                CGContextRestoreGState(context)

                CGContextSaveGState(context)
                CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect)-lineOffset)
                CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lineOffset)
                CGContextStrokePath(context)
                CGContextRestoreGState(context)
            }
        }
    }

}
