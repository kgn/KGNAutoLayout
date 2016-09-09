//
//  SpringView.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/24/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

enum SpringViewDirection {
    case horizontal
    case vertical
}

class SpringView: UIView {

    var showEnds: Bool = true
    var direction: SpringViewDirection = .horizontal

    override var intrinsicContentSize: CGSize {
        if direction == .horizontal {
            return CGSize(width: UIViewNoIntrinsicMetric, height: 20)
        } else {
            return CGSize(width: 20, height: UIViewNoIntrinsicMetric)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isOpaque = false
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let lineSize: CGFloat = 1
        let lineOffset: CGFloat = 0.5
        let context = UIGraphicsGetCurrentContext()
        let lineColor = UIColor(red: 1, green: 0.2902, blue: 0.2902, alpha: 1)

        context?.setLineWidth(lineSize)
        context?.setLineCap(.round)
        context?.setStrokeColor(lineColor.cgColor)

        if direction == .horizontal {
            context?.saveGState()
            context?.setLineDash(phase: 0, lengths: [2, 2], count: 2)
            context?.moveTo(x: rect.minX, y: rect.midY+lineOffset)
            context?.addLineTo(x: rect.maxX, y: rect.midY+lineOffset)
            context?.strokePath()
            context?.restoreGState()

            if self.showEnds {
                context?.saveGState()
                context?.moveTo(x: lineOffset, y: rect.minY)
                context?.addLineTo(x: lineOffset, y: rect.maxY)
                context?.strokePath()
                context?.restoreGState()

                context?.saveGState()
                context?.moveTo(x: rect.maxX-lineOffset, y: rect.minY)
                context?.addLineTo(x: rect.maxX-lineOffset, y: rect.maxY)
                context?.strokePath()
                context?.restoreGState()
            }
        } else {
            context?.saveGState()
            context?.setLineDash(phase: 0, lengths: [2, 2], count: 2)
            context?.moveTo(x: rect.midX+lineOffset, y: rect.minY)
            context?.addLineTo(x: rect.midX+lineOffset, y: rect.maxY)
            context?.strokePath()
            context?.restoreGState()

            if self.showEnds {
                context?.saveGState()
                context?.moveTo(x: rect.minX, y: lineOffset)
                context?.addLineTo(x: rect.maxX, y: lineOffset)
                context?.strokePath()
                context?.restoreGState()

                context?.saveGState()
                context?.moveTo(x: rect.minX, y: rect.maxY-lineOffset)
                context?.addLineTo(x: rect.maxX, y: rect.maxY-lineOffset)
                context?.strokePath()
                context?.restoreGState()
            }
        }
    }

}
