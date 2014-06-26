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

- (NSArray *)kgn_pinToEdgesOfSuperview{
    return [self kgn_pinToSuperviewWithOffset:0];
}

- (NSArray *)kgn_pinToSuperviewWithOffset:(CGFloat)offset{
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObject:[self kgn_pinToTopEdgeOfSuperviewWithOffset:offset]];
    [constraints addObject:[self kgn_pinToRightEdgeOfSuperviewWithOffset:offset]];
    [constraints addObject:[self kgn_pinToBottomEdgeOfSuperviewWithOffset:offset]];
    [constraints addObject:[self kgn_pinToLeftEdgeOfSuperviewWithOffset:offset]];
    return [constraints copy];
}

- (NSLayoutConstraint *)kgn_pinToTopEdgeOfSuperview{
    return [self kgn_pinToTopEdgeOfSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToTopEdgeOfSuperviewWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeTop toSuperViewWithOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfSuperview{
    return [self kgn_pinToBottomEdgeOfSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfSuperviewWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeBottom toSuperViewWithOffset:-offset];
}

- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfSuperview{
    return [self kgn_pinToLeftEdgeOfSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfSuperviewWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeLeft toSuperViewWithOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinToRightEdgeOfSuperview{
    return [self kgn_pinToRightEdgeOfSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)kgn_pinToRightEdgeOfSuperviewWithOffset:(CGFloat)offset{
    return [self kgn_constrainEdgeAttribute:NSLayoutAttributeRight toSuperViewWithOffset:-offset];
}

- (NSArray *)kgn_pinToSideEdgesOfSuperview{
    return [self kgn_pinToSideEdgesOfSuperviewWithOffset:0];
}

- (NSArray *)kgn_pinToSideEdgesOfSuperviewWithOffset:(CGFloat)offset{
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObject:[self kgn_pinToLeftEdgeOfSuperviewWithOffset:offset]];
    [constraints addObject:[self kgn_pinToRightEdgeOfSuperviewWithOffset:offset]];
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

- (NSLayoutConstraint *)kgn_sizeHeightToWidthOfItem:(id)item{
    return [self kgn_constrainAttribute:NSLayoutAttributeHeight toAttribute:NSLayoutAttributeWidth ofItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_sizeWidthToHeightOfItem:(id)item{
    return [self kgn_constrainAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeHeight ofItem:item withOffset:0];
}

- (NSArray *)kgn_sizeToWidthAndHeight:(CGFloat)size{
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self kgn_sizeToWidth:size]];
    [constraints addObject:[self kgn_sizeToHeight:size]];
    return [constraints copy];
}

- (NSArray *)kgn_sizeToWidthAndHeightOfItem:(id)item{
    return [self kgn_sizeToWidthAndHeightOfItem:item withOffset:0];
}

- (NSArray *)kgn_sizeToWidthAndHeightOfItem:(id)item withOffset:(CGFloat)offset{
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self kgn_sizeToWidthOfItem:item withOffset:offset]];
    [constraints addObject:[self kgn_sizeToHeightOfItem:item withOffset:offset]];
    return [constraints copy];
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

#pragma mark - Fit: Layout

- (void)kgn_fillHorizontallyWithViews:(NSArray *)views{
    [self kgn_fillHorizontallyWithViews:views withSeparation:0];
}

- (void)kgn_fillHorizontallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation{
    NSAssert([views count] > 1, @"Can only distribute 2 or more views");

    __block UIView *lastView;
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        if(lastView){
            [lastView kgn_sizeToWidthOfItem:view];
            [view kgn_positionRightOfItem:lastView withOffset:separation];
        }else{
            [view kgn_pinToLeftEdgeOfSuperviewWithOffset:separation];
        }
        lastView = view;
    }];

    [lastView kgn_pinToRightEdgeOfSuperviewWithOffset:separation];
}

- (void)kgn_fillVerticallyWithViews:(NSArray *)views{
    [self kgn_fillVerticallyWithViews:views withSeparation:0];
}

- (void)kgn_fillVerticallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation{
    NSAssert([views count] > 1, @"Can only distribute 2 or more views");

    __block UIView *lastView;
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        if(lastView){
            [lastView kgn_sizeToHeightOfItem:view];
            [view kgn_positionBelowItem:lastView withOffset:separation];
        }else{
            [view kgn_pinToTopEdgeOfSuperviewWithOffset:separation];
        }
        lastView = view;
    }];

    [lastView kgn_pinToBottomEdgeOfSuperviewWithOffset:separation];
}

#pragma mark - Bound

- (void)kgn_boundHorizontallyWithViews:(NSArray *)views{
    [self kgn_boundHorizontallyWithViews:views withSeparation:0];
}

- (void)kgn_boundHorizontallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation{
    __block UIView *lastView;
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        if(lastView){
            [view kgn_positionRightOfItem:lastView withOffset:separation];
        }
        lastView = view;
    }];
    [self kgn_pinToLeftEdgeOfItem:[views firstObject]];
    [self kgn_pinToRightEdgeOfItem:[views lastObject]];
}

- (void)kgn_boundVerticallyLayoutViews:(NSArray *)views{
    [self kgn_boundVerticallyLayoutViews:views withSeparation:0];
}

- (void)kgn_boundVerticallyLayoutViews:(NSArray *)views withSeparation:(CGFloat)separation{
    __block UIView *lastView;
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        if(lastView){
            [view kgn_positionBelowItem:lastView withOffset:separation];
        }
        lastView = view;
    }];
    [self kgn_pinToLeftEdgeOfItem:[views firstObject]];
    [self kgn_pinToRightEdgeOfItem:[views lastObject]];
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
