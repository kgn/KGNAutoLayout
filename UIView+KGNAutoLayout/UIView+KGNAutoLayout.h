//
//  UIView+KGNAutoLayout.h
//  UIView+KGNAutoLayout
//
//  Created by David Keegan on 5/17/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

@import UIKit;

@interface UIView(KGNAutoLayout)

#pragma mark - Pin: Superview

- (NSArray *)kgn_pinToSuperview;
- (NSArray *)kgn_pinToSuperviewWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToSuperviewTopEdge;
- (NSLayoutConstraint *)kgn_pinToSuperviewTopEdgeWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToSuperviewRightEdge;
- (NSLayoutConstraint *)kgn_pinToSuperviewRightEdgeWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToSuperviewBottomEdge;
- (NSLayoutConstraint *)kgn_pinToSuperviewBottomEdgeWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToSuperviewLeftEdge;
- (NSLayoutConstraint *)kgn_pinToSuperviewLeftEdgeWithOffset:(CGFloat)offset;

- (NSArray *)kgn_pinToSuperviewSideEdges;
- (NSArray *)kgn_pinToSuperviewSideEdgesWithOffset:(CGFloat)offset;

#pragma mark - Pin: Edges

- (NSLayoutConstraint *)kgn_pinToTopEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinToTopEdgeOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToRightEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinToRightEdgeOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfItem:(id)item withOffset:(CGFloat)offset;

#pragma mark - Center

- (NSArray *)kgn_centerInSuperview;

- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperview;
- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperviewWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_centerVerticallyInSuperview;
- (NSLayoutConstraint *)kgn_centerVerticallyInSuperviewWithOffset:(CGFloat)offset;

#pragma mark - Size

- (NSLayoutConstraint *)kgn_sizeToWidth:(CGFloat)width;
- (NSLayoutConstraint *)kgn_sizeToHeight:(CGFloat)height;

- (NSLayoutConstraint *)kgn_sizeToWidthOfItem:(id)item;
- (NSLayoutConstraint *)kgn_sizeToWidthOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item;
- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_sizeHeightToWidthOfItem:(id)item;
- (NSLayoutConstraint *)kgn_sizeWidthToHeightOfItem:(id)item;

#pragma mark - Position

- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item;
- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_positionRightOfItem:(id)item;
- (NSLayoutConstraint *)kgn_positionRightOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item;
- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_positionLeftOfItem:(id)item;
- (NSLayoutConstraint *)kgn_positionLeftOfItem:(id)item withOffset:(CGFloat)offset;

//#pragma mark - Fit: Between
//
//- (NSArray *)kgn_fitBetweenTopItem:(id)item andBottomItem:(id)item;
//- (NSArray *)kgn_fitBetweenTopItem:(id)item andBottomItem:(id)item withOffset:(CGFloat)offset;
//
//- (NSArray *)kgn_fitBetweenLeftItem:(id)item andRightItem:(id)item;
//- (NSArray *)kgn_fitBetweenLeftItem:(id)item andRightItem:(id)item withOffset:(CGFloat)offset;
//
//#pragma mark - Fit: Layout
//
//- (NSArray *)kgn_fitViewsHorizontally:(NSArray *)views;
//- (NSArray *)kgn_fitViewsHorizontally:(NSArray *)views withOffset:(CGFloat)offset;
//
//- (NSArray *)kgn_fitViewsVertically:(NSArray *)views;
//- (NSArray *)kgn_fitViewsVertically:(NSArray *)views withOffset:(CGFloat)offset;

#pragma mark - Low Level

- (NSLayoutConstraint *)kgn_constrainSizeAttribute:(NSLayoutAttribute)sizeAttribute withSize:(CGFloat)size;
- (NSLayoutConstraint *)kgn_constrainEdgeAttribute:(NSLayoutAttribute)edgeAttribute toSuperViewWithOffset:(CGFloat)offset;
- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item withOffset:(CGFloat)offset;

@end
