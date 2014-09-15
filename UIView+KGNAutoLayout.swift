//
//  UIView+KGNAutoLayout.swift
//  beckon
//
//  Created by David Keegan on 9/14/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - Pin: Superview

    func kgn_pinToEdgesOfSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint, right: NSLayoutConstraint, bottom: NSLayoutConstraint, left: NSLayoutConstraint) {
        return (
            self.kgn_pinToTopEdgeOfSuperview(offset: offset, priority: priority),
            self.kgn_pinToRightEdgeOfSuperview(offset: offset, priority: priority),
            self.kgn_pinToBottomEdgeOfSuperview(offset: offset, priority: priority),
            self.kgn_pinToLeftEdgeOfSuperview(offset: offset, priority: priority)
        )
    }

    func kgn_pinToTopEdgeOfSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainEdgeAttribute(.Top, offset: offset, priority: priority)
    }

    func kgn_pinToRightEdgeOfSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainEdgeAttribute(.Right, offset: offset, priority: priority)
    }

    func kgn_pinToBottomEdgeOfSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainEdgeAttribute(.Bottom, offset: offset, priority: priority)
    }

    func kgn_pinToLeftEdgeOfSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainEdgeAttribute(.Left, offset: offset, priority: priority)
    }

    func kgn_pinToSideEdgesOfSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (left: NSLayoutConstraint, right: NSLayoutConstraint) {
        return (
            self.kgn_pinToLeftEdgeOfSuperview(offset: offset, priority: priority),
            self.kgn_pinToRightEdgeOfSuperview(offset: offset, priority: priority)
        )
    }

    // MARK: - Pin: Edges

    func kgn_pinTopEdgeToTopEdgeOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Top, toAttribute: .Top, ofItem: item, offset: -offset, priority: priority)
    }

    func kgn_pinRightEdgeToRightEdgeOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Right, toAttribute: .Right, ofItem: item, offset: offset, priority: priority)
    }

    func kgn_pinBottomEdgeToBottomEdgeOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Bottom, toAttribute: .Bottom, ofItem: item, offset: offset, priority: priority)
    }

    func kgn_pinLeftEdgeToLeftEdgeOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Left, toAttribute: .Left, ofItem: item, offset: -offset, priority: priority)
    }

    // MARK: - Center

    func kgn_centerInSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (horizontal: NSLayoutConstraint, vertical: NSLayoutConstraint){
        return (
            self.kgn_centerHorizontallyInSuperview(offset: offset, priority: priority),
            self.kgn_centerVerticallyInSuperview(offset: offset, priority: priority)
        )
    }

    func kgn_centerHorizontallyInSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainEdgeAttribute(.CenterX, offset: offset, priority: priority)
    }

    func kgn_centerVerticallyInSuperview(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainEdgeAttribute(.CenterY, offset: offset, priority: priority)
    }

    func kgn_centerViewsHorizontally(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        // odd number of views
        if views.count % 2  == 0 {
            let centerIndex = views.count/2
            views[centerIndex].kgn_centerHorizontallyInSuperview()

            let rightViews = Array(views[centerIndex+1...views.count-1])
            if rightViews.count > 0 {
                views[centerIndex].kgn_positionViewsToTheRight(rightViews, offset: separation, priority: priority)
            }

            let leftViews = Array(views[0...centerIndex-1])
            if leftViews.count > 0{
                views[centerIndex].kgn_positionViewsToTheLeft(leftViews, offset: separation, priority: priority)
            }
        } else {
            let rightIndex = views.count/2
            let leftIndex = rightIndex-1

            views[leftIndex].kgn_constrainAttribute(.Right, toAttribute: .CenterX, ofItem: self, relatedBy: .LessThanOrEqual, offset:-separation/2, priority: priority)
            views[rightIndex].kgn_constrainAttribute(.Left, toAttribute: .CenterX, ofItem: self, relatedBy: .LessThanOrEqual, offset:separation/2, priority: priority)

            let rightViews = Array(views[rightIndex+1...views.count-1])
            if rightViews.count > 0 {
                views[rightIndex].kgn_positionViewsToTheRight(rightViews, offset: separation, priority: priority)
            }

            let leftViews = Array(views[0...leftIndex-1])
            if leftViews.count > 0 {
                views[leftIndex].kgn_positionViewsToTheLeft(leftViews, offset: separation, priority: priority)
            }
        }
    }

    func kgn_centerViewsVertically(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        // odd number of views
        if views.count % 2  == 0 {
            let centerIndex = views.count/2
            views[centerIndex].kgn_centerVerticallyInSuperview()

            let belowViews = Array(views[centerIndex+1...views.count-1])
            if belowViews.count > 0 {
                views[centerIndex].kgn_positionViewsBelow(belowViews, offset: separation, priority: priority)
            }

            let aboveViews = Array(views[0...centerIndex-1])
            if aboveViews.count > 0{
                views[centerIndex].kgn_positionViewsAbove(aboveViews, offset: separation, priority: priority)
            }
        }else{
            let belowIndex = views.count/2
            let aboveIndex = belowIndex-1

            views[aboveIndex].kgn_constrainAttribute(.Bottom, toAttribute: .CenterY, ofItem: self, relatedBy: .LessThanOrEqual, offset:-separation/2, priority: priority)
            views[belowIndex].kgn_constrainAttribute(.Top, toAttribute: .CenterY, ofItem: self, relatedBy: .LessThanOrEqual, offset:separation/2, priority: priority)

            let belowViews = Array(views[belowIndex+1...views.count-1])
            if belowViews.count > 0 {
                views[belowIndex].kgn_positionViewsBelow(belowViews, offset: separation, priority: priority)
            }

            let aboveViews = Array(views[0...aboveIndex-1])
            if aboveViews.count > 0 {
                views[aboveIndex].kgn_positionViewsAbove(aboveViews, offset: separation, priority: priority)
            }
        }
    }

    // MARK: - Size

    func kgn_sizeToWidth(width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return self.kgn_constrainSizeAttribute(.Width, size:width)
    }

    func kgn_sizeToHeight(height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return self.kgn_constrainSizeAttribute(.Height, size:height)
    }

    func kgn_sizeToWidthOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Width, toAttribute:.Width, ofItem:item, offset:-(offset*2))
    }

    func kgn_sizeToHeightOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Height, toAttribute:.Height, ofItem:item, offset:-(offset*2))
    }

    func kgn_sizeHeightToWidthOfItem(item: AnyObject) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Height, toAttribute:.Width, ofItem:item)
    }

    func kgn_sizeWidthToHeightOfItem(item: AnyObject) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Width, toAttribute:.Height, ofItem:item)
    }

    func kgn_sizeToWidthAndHeight(toSize: CGFloat) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.kgn_sizeToWidth(toSize),
            self.kgn_sizeToHeight(toSize)
        )
    }

    func kgn_sizeToWidthAndHeightOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.kgn_sizeToWidthOfItem(item, offset: offset, priority: priority),
            self.kgn_sizeToHeightOfItem(item, offset: offset, priority: priority)
        )
    }

    // MARK: - Position

    func kgn_positionAboveItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Bottom, toAttribute:.Top, ofItem:item, offset:-offset, priority: priority)
    }

    func kgn_positionToTheRightOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Left, toAttribute:.Right, ofItem:item, offset:offset, priority: priority)
    }

    func kgn_positionBelowItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Top, toAttribute:.Bottom, ofItem:item, offset:offset, priority: priority)
    }

    func kgn_positionToTheLeftOfItem(item: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.kgn_constrainAttribute(.Right, toAttribute:.Left, ofItem:item, offset:-offset, priority: priority)
    }

    func kgn_positionViewsAbove(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in reverse(views) {
            view.kgn_positionAboveItem(lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

    func kgn_positionViewsToTheRight(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in views {
            view.kgn_positionToTheRightOfItem(lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

    func kgn_positionViewsBelow(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in views {
            view.kgn_positionBelowItem(lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

    func kgn_positionViewsToTheLeft(views: [UIView], offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        var lastView: UIView = self
        for view in reverse(views) {
            view.kgn_positionToTheLeftOfItem(lastView, offset:offset, priority: priority)
            lastView = view
        }
    }

    // MARK: - Between

    func kgn_fitBetween(topItem: AnyObject, bottomItem: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint, bottom: NSLayoutConstraint){
        return (
            self.kgn_positionBelowItem(topItem, offset: offset, priority: priority),
            self.kgn_positionAboveItem(bottomItem, offset: offset, priority: priority)
        )
    }

    func kgn_fitBetween(leftItem: AnyObject, rightItem: AnyObject, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (left: NSLayoutConstraint, right: NSLayoutConstraint){
        return (
            self.kgn_positionToTheRightOfItem(leftItem, offset: offset, priority: priority),
            self.kgn_positionToTheLeftOfItem(rightItem, offset: offset, priority: priority)
        )
    }

    // MARK: - Fill

    func kgn_fillHorizontally(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 1, "Can only distribute 2 or more views")

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                lastView.kgn_sizeToWidthOfItem(view)
                view.kgn_positionToTheRightOfItem(lastView, offset: separation, priority: priority)
            } else {
                view.kgn_pinToLeftEdgeOfSuperview(offset: separation, priority: priority)
            }
            lastView = view
        }

        lastView?.kgn_pinToRightEdgeOfSuperview(offset: separation, priority: priority)
    }

    func kgn_fillVertically(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 1, "Can only distribute 2 or more views")

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                lastView.kgn_sizeToHeightOfItem(view)
                view.kgn_positionBelowItem(lastView, offset: separation, priority: priority)
            } else {
                view.kgn_pinToTopEdgeOfSuperview(offset: separation, priority: priority)
            }
            lastView = view
        }

        lastView?.kgn_pinToBottomEdgeOfSuperview(offset: separation, priority: priority)
    }

    // MARK: - Bound

    func kgn_boundHorizontally(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 1, "Can only distribute 2 or more views")

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                view.kgn_positionToTheRightOfItem(lastView, offset: separation, priority: priority)
            }
            lastView = view
        }

        self.kgn_pinLeftEdgeToLeftEdgeOfItem(views.first!, offset: separation, priority: priority)
        self.kgn_pinRightEdgeToRightEdgeOfItem(views.last!, offset: separation, priority: priority)
    }

    func kgn_boundVertically(views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 1, "Can only distribute 2 or more views")

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                view.kgn_positionBelowItem(lastView, offset: separation, priority: priority)
            }
            lastView = view
        }

        self.kgn_pinTopEdgeToTopEdgeOfItem(views.first!, offset: separation, priority: priority)
        self.kgn_pinBottomEdgeToBottomEdgeOfItem(views.last!, offset: separation, priority: priority)
    }

    // MARK: - Private

    private func kgn_constrainSizeAttribute(sizeAttribute: NSLayoutAttribute, size: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        assert(self.superview != nil, "Can't create constraints without a superview")

        self.translatesAutoresizingMaskIntoConstraints()
        let constraint = NSLayoutConstraint(item: self, attribute: sizeAttribute, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0, constant: size)
        if let p = priority {
            constraint.priority = p
        }
        self.superview!.addConstraint(constraint)
        return constraint
    }

    private func kgn_constrainEdgeAttribute(edgeAttribute: NSLayoutAttribute, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        assert(self.superview != nil, "Can't create constraints without a superview")

        self.translatesAutoresizingMaskIntoConstraints()
        let constraint = NSLayoutConstraint(item: self, attribute: edgeAttribute, relatedBy: .Equal, toItem: self.superview, attribute: edgeAttribute, multiplier: 1, constant: offset)
        if let p = priority {
            constraint.priority = p
        }
        self.superview!.addConstraint(constraint)
        return constraint
    }

    private func kgn_constrainAttribute(viewAttribute: NSLayoutAttribute, toAttribute itemAttribute: NSLayoutAttribute, ofItem item: AnyObject, relatedBy: NSLayoutRelation = .Equal, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        let commonSuperview: UIView? = {
            if !item.isKindOfClass(UIView) {
                return self.superview?
            }

            return {
                var startView: UIView! = self
                var commonSuperview: UIView?
                do {
                    if startView != nil{
                        if item.isDescendantOfView(startView) {
                            commonSuperview = startView
                        }
                        startView = startView.superview
                    }
                } while (startView != nil && commonSuperview == nil)
                return commonSuperview
            }()
        }()

        assert(commonSuperview != nil, "Can't create constraints without a common superview")

        self.translatesAutoresizingMaskIntoConstraints()
        let constraint = NSLayoutConstraint(item: self, attribute: viewAttribute, relatedBy: relatedBy, toItem: item, attribute: itemAttribute, multiplier: 1, constant: offset)
        if let p = priority {
            constraint.priority = p
        }
        commonSuperview!.addConstraint(constraint)
        return constraint
    }

}
