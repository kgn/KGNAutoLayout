//
//  UIView+KGNAutoLayout.m
//  UIView+KGNAutoLayout
//
//  Created by David Keegan on 5/17/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

#import "UIView+KGNAutoLayout.h"

@implementation UIView(KGNAutoLayout)

#pragma mark - Pin: Superview

- (NSArray *)kgn_pinToSuperview{
    return [self kgn_pinToSuperviewWithOffset:0];
}

- (NSArray *)kgn_pinToSuperviewWithOffset:(CGFloat)offset{
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObject:[self kgn_pinToSuperviewTopEdgeWithOffset:offset]];
    [constraints addObject:[self kgn_pinToSuperviewRightEdgeWithOffset:offset]];
    [constraints addObject:[self kgn_pinToSuperviewBottomEdgeWithOffset:offset]];
    [constraints addObject:[self kgn_pinToSuperviewLeftEdgeWithOffset:offset]];
    return [constraints copy];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewTopEdge{
    return [self kgn_pinToSuperviewTopEdgeWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewTopEdgeWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeTop toSuperViewWithOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewBottomEdge{
    return [self kgn_pinToSuperviewBottomEdgeWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewBottomEdgeWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeBottom toSuperViewWithOffset:-offset];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewLeftEdge{
    return [self kgn_pinToSuperviewLeftEdgeWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewLeftEdgeWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeLeft toSuperViewWithOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewRightEdge{
    return [self kgn_pinToSuperviewRightEdgeWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToSuperviewRightEdgeWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeRight toSuperViewWithOffset:-offset];
}

- (NSArray *)kgn_pinToSuperviewSideEdges{
    return [self kgn_pinToSuperviewSideEdgesWithOffset:0];
}

- (NSArray *)kgn_pinToSuperviewSideEdgesWithOffset:(CGFloat)offset{
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObject:[self kgn_pinToSuperviewLeftEdgeWithOffset:offset]];
    [constraints addObject:[self kgn_pinToSuperviewRightEdgeWithOffset:offset]];
    return [constraints copy];
}

#pragma mark - Pin: Edges

- (NSLayoutConstraint *)kgn_pinToTopEdgeOfItem:(id)item{
    return [self kgn_pinToTopEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToTopEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeTop ofItem:item withOffset:-offset];
}

- (NSLayoutConstraint *)kgn_pinToRightEdgeOfItem:(id)item{
    return [self kgn_pinToRightEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToRightEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeRight ofItem:item withOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfItem:(id)item{
    return [self kgn_pinToBottomEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeBottom ofItem:item withOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfItem:(id)item{
    return [self kgn_pinToLeftEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeLeft ofItem:item withOffset:-offset];
}

#pragma mark - Center

- (NSArray *)kgn_centerInSuperview{
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self kgn_centerHorizontallyInSuperview]];
    [constraints addObject:[self kgn_centerVerticallyInSuperview]];
    return [constraints copy];
}

- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperview{
    return [self kgn_centerHorizontallyInSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperviewWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeCenterX toSuperViewWithOffset:offset];
}

- (NSLayoutConstraint *)kgn_centerVerticallyInSuperview{
    return [self kgn_centerVerticallyInSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)kgn_centerVerticallyInSuperviewWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeCenterY toSuperViewWithOffset:offset];
}

#pragma mark - Size

- (NSLayoutConstraint *)kgn_sizeToWidth:(CGFloat)width{
    return [self kgn_constrainSizeAttribute:NSLayoutAttributeWidth withSize:width];
}

- (NSLayoutConstraint *)kgn_sizeToHeight:(CGFloat)height{
    return [self kgn_constrainSizeAttribute:NSLayoutAttributeHeight withSize:height];
}

- (NSLayoutConstraint *)kgn_sizeToWidthOfItem:(id)item{
    return [self kgn_sizeToWidthOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_sizeToWidthOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeWidth ofItem:item withOffset:-(offset*2)];
}

- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item{
    return [self kgn_sizeToHeightOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeHeight toAttribute:NSLayoutAttributeHeight ofItem:item withOffset:-(offset*2)];
}

#pragma mark - Position

- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item{
    return [self kgn_positionAboveItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeTop ofItem:item withOffset:-offset];
}

- (NSLayoutConstraint *)kgn_positionRightOfItem:(id)item{
    return [self kgn_positionRightOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionRightOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeRight ofItem:item withOffset:offset];
}

- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item{
    return [self kgn_positionBelowItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:item withOffset:offset];
}

- (NSLayoutConstraint *)kgn_positionLeftOfItem:(id)item{
    return [self kgn_positionLeftOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionLeftOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft ofItem:item withOffset:-offset];
}

#pragma mark - Low Level

- (UIView *)commonSuperviewWithView:(UIView *)peerView{
    UIView *startView = self;
    UIView *commonSuperview = nil;
    do {
        if([peerView isDescendantOfView:startView]){
            commonSuperview = startView;
        }
        startView = startView.superview;
    } while (startView && !commonSuperview);

    return commonSuperview;
}

- (NSLayoutConstraint *)kgn_constrainSizeAttribute:(NSLayoutAttribute)sizeAttribute withSize:(CGFloat)size{
    UIView *superview = self.superview;
    NSAssert(superview, @"Can't create constraints without a superview");

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:sizeAttribute relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:size];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)kgn_constrainEdgeAttribute:(NSLayoutAttribute)edgeAttribute toSuperViewWithOffset:(CGFloat)offset{
    UIView *superview = self.superview;
    NSAssert(superview, @"Can't create constraints without a superview");

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:edgeAttribute relatedBy:NSLayoutRelationEqual toItem:superview attribute:edgeAttribute multiplier:1 constant:offset];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item withOffset:(CGFloat)offset{
    NSParameterAssert(item);

    UIView *superview;
    if([item isKindOfClass:[UIView class]]){
        superview = [self commonSuperviewWithView:item];
    }else{
        superview = self.superview;
    }
    NSAssert(superview, @"Can't create constraints without a common superview");

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:viewAttribute relatedBy:NSLayoutRelationEqual toItem:item attribute:itemAttribute multiplier:1 constant:offset];
    [superview addConstraint:constraint];
    return constraint;
}

@end
