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
            return CGSize(width: UIViewNoIntrinsicMetric, height: 20)
        } else {
            return CGSize(width: 20, height: UIViewNoIntrinsicMetric)
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
            CGContextMoveToPoint(context, rect.minX, rect.midY+lineOffset)
            CGContextAddLineToPoint(context, rect.maxX, rect.midY+lineOffset)
            CGContextStrokePath(context)
            CGContextRestoreGState(context)

            if self.showEnds {
                CGContextSaveGState(context)
                CGContextMoveToPoint(context, lineOffset, rect.minY)
                CGContextAddLineToPoint(context, lineOffset, rect.maxY)
                CGContextStrokePath(context)
                CGContextRestoreGState(context)

                CGContextSaveGState(context)
                CGContextMoveToPoint(context, rect.maxX-lineOffset, rect.minY)
                CGContextAddLineToPoint(context, rect.maxX-lineOffset, rect.maxY)
                CGContextStrokePath(context)
                CGContextRestoreGState(context)
            }
        } else {
            CGContextSaveGState(context)
            CGContextSetLineDash(context, 0, [2, 2], 2)
            CGContextMoveToPoint(context, rect.midX+lineOffset, rect.minY)
            CGContextAddLineToPoint(context, rect.midX+lineOffset, rect.maxY)
            CGContextStrokePath(context)
            CGContextRestoreGState(context)

            if self.showEnds {
                CGContextSaveGState(context)
                CGContextMoveToPoint(context, rect.minX, lineOffset)
                CGContextAddLineToPoint(context, rect.maxX, lineOffset)
                CGContextStrokePath(context)
                CGContextRestoreGState(context)

                CGContextSaveGState(context)
                CGContextMoveToPoint(context, rect.minX, rect.maxY-lineOffset)
                CGContextAddLineToPoint(context, rect.maxX, rect.maxY-lineOffset)
                CGContextStrokePath(context)
                CGContextRestoreGState(context)
            }
        }
    }

}
