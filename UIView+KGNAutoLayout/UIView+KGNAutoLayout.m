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
    return [self kgn_pinToEdgesOfSuperviewWithOffset:0];
}

- (NSArray *)kgn_pinToEdgesOfSuperviewWithOffset:(CGFloat)offset{
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

- (NSLayoutConstraint *)kgn_pinTopEdgeToTopEdgeOfItem:(id)item{
    return [self kgn_pinTopEdgeToTopEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinTopEdgeToTopEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeTop ofItem:item relatedBy:NSLayoutRelationEqual withOffset:-offset];
}

- (NSLayoutConstraint *)kgn_pinRightEdgeToRightEdgeOfItem:(id)item{
    return [self kgn_pinRightEdgeToRightEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinRightEdgeToRightEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeRight ofItem:item relatedBy:NSLayoutRelationEqual withOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinBottomEdgeToBottomEdgeOfItem:(id)item{
    return [self kgn_pinBottomEdgeToBottomEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinBottomEdgeToBottomEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeBottom ofItem:item relatedBy:NSLayoutRelationEqual withOffset:offset];
}

- (NSLayoutConstraint *)kgn_pinLeftEdgeToLeftEdgeOfItem:(id)item{
    return [self kgn_pinLeftEdgeToLeftEdgeOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_pinLeftEdgeToLeftEdgeOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeLeft ofItem:item relatedBy:NSLayoutRelationEqual withOffset:-offset];
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

- (void)kgn_centerViewsHorizontally:(NSArray *)views{
    [self kgn_centerViewsHorizontally:views withSeparation:0];
}

- (void)kgn_centerViewsHorizontally:(NSArray *)views withSeparation:(CGFloat)separation{
    NSAssert([views count] > 0, @"Can only distribute 1 or more views");

    // odd number of views
    if([views count] % 2){
        NSUInteger centerIndex = [views count]/2;
        [views[centerIndex] kgn_centerHorizontallyInSuperview];

        NSArray *rightViews = [views subarrayWithRange:NSMakeRange(centerIndex+1, [views count]-centerIndex-1)];
        if([rightViews count]){
            [views[centerIndex] kgn_positionViewsToTheRight:rightViews withOffset:separation];
        }

        NSArray *leftViews = [views subarrayWithRange:NSMakeRange(0, centerIndex)];
        if([leftViews count]){
            [views[centerIndex] kgn_positionViewsToTheLeft:leftViews withOffset:separation];
        }
    }else{
        NSUInteger rightIndex = [views count]/2;
        NSUInteger leftIndex = rightIndex-1;

        [views[leftIndex] kgn_constrainAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeCenterX ofItem:self relatedBy:NSLayoutRelationLessThanOrEqual withOffset:-separation/2];
        [views[rightIndex] kgn_constrainAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeCenterX ofItem:self relatedBy:NSLayoutRelationLessThanOrEqual withOffset:separation/2];

        NSArray *rightViews = [views subarrayWithRange:NSMakeRange(rightIndex+1, [views count]-rightIndex-1)];
        if([rightViews count]){
            [views[rightIndex] kgn_positionViewsToTheRight:rightViews withOffset:separation];
        }

        NSArray *leftViews = [views subarrayWithRange:NSMakeRange(0, leftIndex)];
        if([leftViews count]){
            [views[leftIndex] kgn_positionViewsToTheLeft:leftViews withOffset:separation];
        }
    }
}

- (void)kgn_centerViewsVertically:(NSArray *)views{
    [self kgn_centerViewsVertically:views withSeparation:0];
}

- (void)kgn_centerViewsVertically:(NSArray *)views withSeparation:(CGFloat)separation{
    NSAssert([views count] > 0, @"Can only distribute 1 or more views");

    // odd number of views
    if([views count] % 2){
        NSUInteger centerIndex = [views count]/2;
        [views[centerIndex] kgn_centerVerticallyInSuperview];

        NSArray *belowViews = [views subarrayWithRange:NSMakeRange(centerIndex+1, [views count]-centerIndex-1)];
        if([belowViews count]){
            [views[centerIndex] kgn_positionViewsBelow:belowViews withOffset:separation];
        }

        NSArray *aboveViews = [views subarrayWithRange:NSMakeRange(0, centerIndex)];
        if([aboveViews count]){
            [views[centerIndex] kgn_positionViewsAbove:aboveViews withOffset:separation];
        }
    }else{
        NSUInteger belowIndex = [views count]/2;
        NSUInteger aboveIndex = belowIndex-1;

        [views[aboveIndex] kgn_constrainAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeCenterY ofItem:self relatedBy:NSLayoutRelationLessThanOrEqual withOffset:-separation/2];
        [views[belowIndex] kgn_constrainAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeCenterY ofItem:self relatedBy:NSLayoutRelationLessThanOrEqual withOffset:separation/2];

        NSArray *belowViews = [views subarrayWithRange:NSMakeRange(belowIndex+1, [views count]-belowIndex-1)];
        if([belowViews count]){
            [views[belowIndex] kgn_positionViewsBelow:belowViews withOffset:separation];
        }

        NSArray *aboveViews = [views subarrayWithRange:NSMakeRange(0, aboveIndex)];
        if([aboveViews count]){
            [views[aboveIndex] kgn_positionViewsAbove:aboveViews withOffset:separation];
        }
    }
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
    return [self kgn_constrainAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeWidth ofItem:item relatedBy:NSLayoutRelationEqual withOffset:-(offset*2)];
}

- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item{
    return [self kgn_sizeToHeightOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeHeight toAttribute:NSLayoutAttributeHeight ofItem:item relatedBy:NSLayoutRelationEqual withOffset:-(offset*2)];
}

- (NSLayoutConstraint *)kgn_sizeHeightToWidthOfItem:(id)item{
    return [self kgn_constrainAttribute:NSLayoutAttributeHeight toAttribute:NSLayoutAttributeWidth ofItem:item relatedBy:NSLayoutRelationEqual withOffset:0];
}

- (NSLayoutConstraint *)kgn_sizeWidthToHeightOfItem:(id)item{
    return [self kgn_constrainAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeHeight ofItem:item relatedBy:NSLayoutRelationEqual withOffset:0];
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
    return [self kgn_constrainAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeTop ofItem:item relatedBy:NSLayoutRelationEqual withOffset:-offset];
}

- (void)kgn_positionViewsAbove:(NSArray *)views{
    [self kgn_positionViewsAbove:views withOffset:0];
}

- (void)kgn_positionViewsAbove:(NSArray *)views withOffset:(CGFloat)offset{
    NSAssert([views count] > 0, @"Can only distribute 1 or more views");

    __block UIView *lastView = self;
    [views enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        [view kgn_positionAboveItem:lastView withOffset:offset];
        lastView = view;
    }];
}

- (NSLayoutConstraint *)kgn_positionToTheRightOfItem:(id)item{
    return [self kgn_positionToTheRightOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionToTheRightOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeRight ofItem:item relatedBy:NSLayoutRelationEqual withOffset:offset];
}

- (void)kgn_positionViewsToTheRight:(NSArray *)views{
    [self kgn_positionViewsToTheRight:views withOffset:0];
}

- (void)kgn_positionViewsToTheRight:(NSArray *)views withOffset:(CGFloat)offset{
    NSAssert([views count] > 0, @"Can only distribute 1 or more views");

    __block UIView *lastView = self;
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        [view kgn_positionToTheRightOfItem:lastView withOffset:offset];
        lastView = view;
    }];
}

- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item{
    return [self kgn_positionBelowItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:item relatedBy:NSLayoutRelationEqual withOffset:offset];
}

- (void)kgn_positionViewsBelow:(NSArray *)views{
    [self kgn_positionViewsBelow:views withOffset:0];
}

- (void)kgn_positionViewsBelow:(NSArray *)views withOffset:(CGFloat)offset{
    NSAssert([views count] > 0, @"Can only distribute 1 or more views");

    __block UIView *lastView = self;
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        [view kgn_positionBelowItem:lastView withOffset:offset];
        lastView = view;
    }];
}

- (NSLayoutConstraint *)kgn_positionToTheLeftOfItem:(id)item{
    return [self kgn_positionToTheLeftOfItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionToTheLeftOfItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft ofItem:item relatedBy:NSLayoutRelationEqual withOffset:-offset];
}

- (void)kgn_positionViewsToTheLeft:(NSArray *)views{
    [self kgn_positionViewsToTheLeft:views withOffset:0];
}

- (void)kgn_positionViewsToTheLeft:(NSArray *)views withOffset:(CGFloat)offset{
    NSAssert([views count] > 0, @"Can only distribute 1 or more views");

    __block UIView *lastView = self;
    [views enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        [view kgn_positionToTheLeftOfItem:lastView withOffset:offset];
        lastView = view;
    }];
}

#pragma mark - Between

- (NSArray *)kgn_fitBetweenTopItem:(id)topItem andBottomItem:(id)bottomItem{
    return [self kgn_fitBetweenTopItem:topItem andBottomItem:bottomItem withOffset:0];
}

- (NSArray *)kgn_fitBetweenTopItem:(id)topItem andBottomItem:(id)bottomItem withOffset:(CGFloat)offset{
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self kgn_positionBelowItem:topItem withOffset:offset]];
    [constraints addObject:[self kgn_positionAboveItem:bottomItem withOffset:offset]];
    return [constraints copy];
}

- (NSArray *)kgn_fitBetweenLeftItem:(id)leftItem andRightItem:(id)rightItem{
    return [self kgn_fitBetweenLeftItem:leftItem andRightItem:rightItem withOffset:0];
}

- (NSArray *)kgn_fitBetweenLeftItem:(id)leftItem andRightItem:(id)rightItem withOffset:(CGFloat)offset{
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self kgn_positionToTheRightOfItem:leftItem withOffset:offset]];
    [constraints addObject:[self kgn_positionToTheLeftOfItem:rightItem withOffset:offset]];
    return [constraints copy];
}

#pragma mark - Fill

- (void)kgn_fillHorizontallyWithViews:(NSArray *)views{
    [self kgn_fillHorizontallyWithViews:views withSeparation:0];
}

- (void)kgn_fillHorizontallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation{
    NSAssert([views count] > 1, @"Can only distribute 2 or more views");

    __block UIView *lastView;
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
        if(lastView){
            [lastView kgn_sizeToWidthOfItem:view];
            [view kgn_positionToTheRightOfItem:lastView withOffset:separation];
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
            [view kgn_positionToTheRightOfItem:lastView withOffset:separation];
        }
        lastView = view;
    }];
    [self kgn_pinLeftEdgeToLeftEdgeOfItem:[views firstObject] withOffset:separation];
    [self kgn_pinRightEdgeToRightEdgeOfItem:[views lastObject] withOffset:separation];
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
    [self kgn_pinTopEdgeToTopEdgeOfItem:[views firstObject] withOffset:separation];
    [self kgn_pinBottomEdgeToBottomEdgeOfItem:[views lastObject] withOffset:separation];
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

- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item relatedBy:(NSLayoutRelation)relatedBy withOffset:(CGFloat)offset{
    NSParameterAssert(item);

    UIView *superview;
    if([item isKindOfClass:[UIView class]]){
        superview = [self commonSuperviewWithView:item];
    }else{
        superview = self.superview;
    }
    NSAssert(superview, @"Can't create constraints without a common superview");

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:viewAttribute relatedBy:relatedBy toItem:item attribute:itemAttribute multiplier:1 constant:offset];
    [superview addConstraint:constraint];
    return constraint;
}

@end
