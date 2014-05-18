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

- (NSLayoutConstraint *)kgn_pinToSuperviewTop;
- (NSLayoutConstraint *)kgn_pinToSuperviewTopWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToSuperviewBottom;
- (NSLayoutConstraint *)kgn_pinToSuperviewBottomWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToSuperviewLeft;
- (NSLayoutConstraint *)kgn_pinToSuperviewLeftWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToSuperviewRight;
- (NSLayoutConstraint *)kgn_pinToSuperviewRightWithOffset:(CGFloat)offset;

- (NSArray *)kgn_pinToSuperviewSides;
- (NSArray *)kgn_pinToSuperviewSidesWithOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToTopLayoutGuide:(id<UILayoutSupport>)topLayoutGuide;
- (NSLayoutConstraint *)kgn_pinToTopLayoutGuide:(id<UILayoutSupport>)topLayoutGuide withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToBottomLayoutGuide:(id<UILayoutSupport>)bottomLayoutGuide;
- (NSLayoutConstraint *)kgn_pinToBottomLayoutGuide:(id<UILayoutSupport>)bottomLayoutGuide withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToTopOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinToTopOfItem:(id)item withOffset:(CGFloat)offset;

- (NSLayoutConstraint *)kgn_pinToBottomOfItem:(id)item;
- (NSLayoutConstraint *)kgn_pinToBottomOfItem:(id)item withOffset:(CGFloat)offset;

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

#pragma mark - Position

- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item;
- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item withOffset:(CGFloat)offset;
- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item;
- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item withOffset:(CGFloat)offset;

#pragma mark - Low Level

- (NSArray *)kgn_pinToSuperviewEdges:(KGNAutoLayoutEdge)edges withinViewController:(UIViewController *)viewController andOffset:(CGFloat)offset;
- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item withOffset:(CGFloat)offset;

@end
