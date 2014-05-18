//
//  UIView+KGNAutoLayout.h
//  UIView+KGNAutoLayout
//
//  Created by David Keegan on 5/17/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

@import UIKit;

typedef NS_OPTIONS(NSUInteger, KGNAutoLayoutEdge)
{
    /// Pins the top edge of an item.
    KGNAutoLayoutEdgeTop = 1 << 0,

    /// Pins the right edge of an item.
    KGNAutoLayoutEdgeRight = 1 << 1,

    /// Pins the bottom edge of an item.
    KGNAutoLayoutEdgeBottom = 1 << 2,

    /// Pins the left edge of an item.
    KGNAutoLayoutEdgeLeft = 1 << 3,

    /// Pins all edges of an item.
    KGNAutoLayoutEdgeAll = ~0UL
};

@interface UIView(KGNAutoLayout)

- (NSArray *)kgn_pinToSuperview;
- (NSArray *)kgn_pinToSuperviewEdges:(KGNAutoLayoutEdge)edges;
- (NSArray *)kgn_pinToSuperviewEdges:(KGNAutoLayoutEdge)edges offset:(CGFloat)offset;

//- (NSLayoutConstraint *)kgn_constrainViewBelow:(UIView *)view;
//- (NSLayoutConstraint *)kgn_constrainViewBelow:(UIView *)view withOffset:(CGFloat)offset;

@end
