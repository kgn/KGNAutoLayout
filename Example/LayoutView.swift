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
        self.isOpaque = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isOpaque = false
    }

    override var intrinsicContentSize: CGSize {
        var intrinsicContentSize = super.intrinsicContentSize

        if let intrinsicContentWidth = self.intrinsicContentWidth {
            intrinsicContentSize.width = intrinsicContentWidth
        }

        if let intrinsicContentHeight = self.intrinsicContentHeight {
            intrinsicContentSize.height = intrinsicContentHeight
        }

        return intrinsicContentSize
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let lineWidth: CGFloat = 1
        let lineOffset: CGFloat = 0.5
        let lineColor = UIColor.white
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        context?.fill(rect.insetBy(dx: lineOffset, dy: lineOffset))

        context?.setLineWidth(lineWidth)
        context?.setLineJoin(.round)
        context?.setStrokeColor(lineColor.cgColor)

        context?.stroke(rect.insetBy(dx: lineOffset, dy: lineOffset))
    }

}
