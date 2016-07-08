//
//  ItemView.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/24/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

class ItemView: UIView {

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

        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(red: 0.2627, green: 1, blue: 0.1059, alpha: 0.3)
        context?.fill(rect)
    }

}
