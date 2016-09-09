//
//  TrackTableViewCell.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/20/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

    class func identifier() -> String {
        return "\(self)"
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        self.textLabel?.textColor = .white

        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.backgroundColor = UIColor(red: 0.1843, green: 0.5098, blue: 1, alpha: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
