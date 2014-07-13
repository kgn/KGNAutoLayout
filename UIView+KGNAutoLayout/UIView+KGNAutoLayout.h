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

- (NSArray *)kgn_pinToEdgesOfSuperview;
- (NSArray *)kgn_pinToEdgesOfSuperviewWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToTopEdgeOfSuperview;
- (NSLayoutConstraint *)kgn_pinToTopEdgeOfSuperviewWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToRightEdgeOfSuperview;
- (NSLayoutConstraint *)kgn_pinToRightEdgeOfSuperviewWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfSuperview;
- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfSuperviewWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfSuperview;
- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfSuperviewWithOffset:(CGFloat)offset;

- (NSArray *)kgn_pinToSideEdgesOfSuperview;
- (NSArray *)kgn_pinToSideEdgesOfSuperviewWithOffset:(CGFloat)offset;

#pragma mark - Pin: Edges

- (NSLayoutConstraint *)kgn_pinTopEdgeToTopEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinTopEdgeToTopEdgeOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinRightEdgeToRightEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinRightEdgeToRightEdgeOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinBottomEdgeToBottomEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinBottomEdgeToBottomEdgeOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinLeftEdgeToLeftEdgeOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinLeftEdgeToLeftEdgeOfItem:(id)item withOffset:(CGFloat)offset;

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

- (NSArray *)kgn_sizeToWidthAndHeight:(CGFloat)size;
- (NSArray *)kgn_sizeToWidthAndHeightOfItem:(id)item;
- (NSArray *)kgn_sizeToWidthAndHeightOfItem:(id)item withOffset:(CGFloat)offset;

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

#pragma mark - Fill

- (void)kgn_fillHorizontallyWithViews:(NSArray *)views;
- (void)kgn_fillHorizontallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation;

- (void)kgn_fillVerticallyWithViews:(NSArray *)views;
- (void)kgn_fillVerticallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation;

#pragma mark - Bound

// These methods are useful for filling scroll views with views becuase the passed views will be laid out,
// and then the calling view will be bound to thier total width(horizontally) or height(vertically).

- (void)kgn_boundHorizontallyWithViews:(NSArray *)views;
- (void)kgn_boundHorizontallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation;

- (void)kgn_boundVerticallyLayoutViews:(NSArray *)views;
- (void)kgn_boundVerticallyLayoutViews:(NSArray *)views withSeparation:(CGFloat)separation;

#pragma mark - Low Level

- (NSLayoutConstraint *)kgn_constrainSizeAttribute:(NSLayoutAttribute)sizeAttribute withSize:(CGFloat)size;
- (NSLayoutConstraint *)kgn_constrainEdgeAttribute:(NSLayoutAttribute)edgeAttribute toSuperViewWithOffset:(CGFloat)offset;
- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item withOffset:(CGFloat)offset;

@end
