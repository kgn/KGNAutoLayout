//
//  UIView+KGNAutoLayout.h
//  UIView+KGNAutoLayout
//
//  Created by David Keegan on 5/17/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

@import UIKit;

typedef NS_OPTIONS(NSUInteger, KGNAutoLayoutEdge){
    KGNAutoLayoutEdgeTop = 1 << 0,
    KGNAutoLayoutEdgeRight = 1 << 1,
    KGNAutoLayoutEdgeBottom = 1 << 2,
    KGNAutoLayoutEdgeLeft = 1 << 3,
    KGNAutoLayoutEdgeAll = ~0UL
};

@interface UIView(KGNAutoLayout)

#pragma mark - Pin

- (NSArray *)kgn_pinToSuperview;
- (NSArray *)kgn_pinToSuperviewEdges:(KGNAutoLayoutEdge)edges withinViewController:(UIViewController *)viewController andOffset:(CGFloat)offset;

#pragma mark - Center

- (NSArray *)kgn_centerInSuperview;
- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperview;
- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperviewWithOffset:(CGFloat)offset;
- (NSLayoutConstraint *)kgn_centerVerticallyInSuperview;
- (NSLayoutConstraint *)kgn_centerVerticallyInSuperviewWithOffset:(CGFloat)offset;

#pragma mark - Size

- (NSLayoutConstraint *)kgn_constrainToWidth:(CGFloat)width;
- (NSLayoutConstraint *)kgn_constrainToHeight:(CGFloat)height;

#pragma mark - Position

- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item;
- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item withOffset:(CGFloat)offset;
- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item;
- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item withOffset:(CGFloat)offset;

#pragma mark - Attribute

- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item withOffset:(CGFloat)offset;

@end
