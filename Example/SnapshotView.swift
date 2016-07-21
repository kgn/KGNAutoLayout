//
//  SnapshotView.swift
//  KGNAutoLayout
//
//  Created by David Keegan on 10/23/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

public enum CacheError: ErrorProtocol {
    case noCacheDirectory
}

class SnapshotView: UIView {

    class func cacheDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
    }

    func saveSnapshot(_ imageName: String, _ code: String...) {
        self.layoutIfNeeded()

        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        if !self.drawHierarchy(in: self.bounds, afterScreenUpdates: true) {
            assert(true, "Screenshot failed")
            return
        }
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            assert(true, "nil image")
            return
        }
        UIGraphicsEndImageContext()

        let cachePath = "\(SnapshotView.cacheDirectory())/\(imageName).png"
        let imageData = UIImagePNGRepresentation(image)
        _ = try? imageData?.write(to: URL(fileURLWithPath: cachePath), options: [])

        print("")

        print("``` Swift")
        for line in code {
            print(line)
        }
        print("```")

        print("![\(imageName)](Example/Snapshots/\(imageName).png)")

        print("--")
        print("")
    }

    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 280, height: 280)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let spaceing: CGFloat = 40
        let lineOffset: CGFloat = 0.5
        let lineColor = UIColor(white: 1, alpha: 0.2)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(red: 0.1373, green: 0.5412, blue: 0.9412, alpha: 1)
        context?.fill(rect)

        context?.setLineWidth(1)
        context?.setLineCap(.round)
        context?.setStrokeColor(lineColor.cgColor)
        context?.setLineDash(phase: 0, lengths: [2, 2], count: 2)

        var x = spaceing
        while x < rect.maxX {
            var innerX = x
            if x > rect.midX {
                innerX += lineOffset
            } else {
                innerX -= lineOffset
            }
            context?.saveGState();
            context?.moveTo(x: innerX, y: rect.minY);
            context?.addLineTo(x: innerX, y: rect.maxY);
            context?.strokePath();
            context?.restoreGState();
            x += spaceing
        }

        var y = spaceing
        while y < rect.maxY {
            var innerY = y
            if y > rect.midX {
                innerY += lineOffset
            } else {
                innerY -= lineOffset
            }
            context?.saveGState();
            context?.moveTo(x: rect.minX, y: innerY);
            context?.addLineTo(x: rect.maxX, y: innerY);
            context?.strokePath();
            context?.restoreGState();
            y += spaceing
        }
    }

}
