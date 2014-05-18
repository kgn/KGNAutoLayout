//
//  UIView+KGNAutoLayout.m
//  UIView+KGNAutoLayout
//
//  Created by David Keegan on 5/17/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

#import "UIView+KGNAutoLayout.h"

@implementation UIView(KGNAutoLayout)

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

#pragma mark - Pin to Superview

- (NSArray *)kgn_pinToSuperview{
    return [self kgn_pinToSuperviewWithConfigurationBlock:nil];
}

// TODO: is this a good api?
- (NSArray *)kgn_pinToSuperviewWithConfigurationBlock:(void(^)(KGNAutoLayoutEdge *edges, UIViewController *parentViewController, CGFloat *offset))block{
    KGNAutoLayoutEdge edges = KGNAutoLayoutEdgeAll;
    UIViewController *viewController = nil;
    CGFloat offset = 0;
    if(block){
        block(&edges, viewController, &offset);
    }
    return [self kgn_pinToSuperviewEdges:edges withinViewController:viewController andOffset:offset];
}

- (NSArray *)kgn_pinToSuperviewEdges:(KGNAutoLayoutEdge)edges withinViewController:(UIViewController *)viewController andOffset:(CGFloat)offset{
    UIView *superview = self.superview;
    NSAssert(superview, @"Can't create constraints without a superview");
    self.translatesAutoresizingMaskIntoConstraints = NO;

    id topItem = viewController.topLayoutGuide;
    id bottomItem = viewController.bottomLayoutGuide;

    NSMutableArray *constraints = [NSMutableArray new];
    if(edges & KGNAutoLayoutEdgeTop){
        id item = topItem ? topItem : superview;
        NSLayoutAttribute attribute = topItem ? NSLayoutAttributeBottom : NSLayoutAttributeTop;
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:item attribute:attribute multiplier:1.0 constant:offset]];
    }
    if(edges & KGNAutoLayoutEdgeLeft){
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:offset]];
    }
    if(edges & KGNAutoLayoutEdgeRight){
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:-offset]];
    }
    if(edges & KGNAutoLayoutEdgeBottom){
        id item = bottomItem ? bottomItem : superview;
        NSLayoutAttribute attribute = bottomItem ? NSLayoutAttributeTop : NSLayoutAttributeBottom;
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:item attribute:attribute multiplier:1.0 constant:-offset]];
    }

    [superview addConstraints:constraints];
    return [constraints copy];
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
    UIView *superview = self.superview;
    NSAssert(superview, @"Can't create constraints without a superview");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:offset];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)kgn_centerVerticallyInSuperview{
    return [self kgn_centerVerticallyInSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)kgn_centerVerticallyInSuperviewWithOffset:(CGFloat)offset{
    UIView *superview = self.superview;
    NSAssert(superview, @"Can't create constraints without a superview");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:offset];
    [superview addConstraint:constraint];
    return constraint;
}

#pragma mark - Size

- (NSLayoutConstraint *)kgn_constrainToWidth:(CGFloat)width{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:width];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)kgn_constrainToHeight:(CGFloat)height{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:height];
    [self addConstraint:constraint];
    return constraint;
}

#pragma mark - Position

- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item{
    return [self kgn_positionAboveItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeTop ofItem:item withOffset:-offset];
}

- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item{
    return [self kgn_positionBelowItem:item withOffset:0];
}

- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item withOffset:(CGFloat)offset{
    return [self kgn_constrainAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofItem:item withOffset:offset];
}

#pragma mark - Attribute

- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item withOffset:(CGFloat)offset{
    NSParameterAssert(item);

    UIView *superview;
    if([item isKindOfClass:[UIView class]]){
        superview = [self commonSuperviewWithView:item];
    }else{
        superview = self.superview;
    }
    NSAssert(superview, @"Can't create constraints without a common superview");

    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:viewAttribute relatedBy:NSLayoutRelationEqual toItem:item attribute:itemAttribute multiplier:1.0 constant:offset];
    [superview addConstraint:constraint];
    return constraint;
}
@end
