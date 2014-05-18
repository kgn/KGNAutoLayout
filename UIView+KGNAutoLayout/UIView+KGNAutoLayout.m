//
//  UIView+KGNAutoLayout.m
//  UIView+KGNAutoLayout
//
//  Created by David Keegan on 5/17/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

#import "UIView+KGNAutoLayout.h"

@implementation UIView(KGNAutoLayout)

- (NSArray *)kgn_pinToSuperview{
    return [self kgn_pinToSuperviewEdges:KGNAutoLayoutEdgeAll];
}

- (NSArray *)kgn_pinToSuperviewEdges:(KGNAutoLayoutEdge)edges{
    return [self kgn_pinToSuperviewEdges:edges offset:0];
}

- (NSArray *)kgn_pinToSuperviewEdges:(KGNAutoLayoutEdge)edges offset:(CGFloat)offset{
    UIView *superview = self.superview;
    NSAssert(superview,@"Can't pin to a superview if no superview exists");

    self.translatesAutoresizingMaskIntoConstraints = NO;

    NSMutableArray *constraints = [NSMutableArray new];

    if(edges & KGNAutoLayoutEdgeTop){
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:offset]];
    }
    if(edges & KGNAutoLayoutEdgeLeft){
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:offset]];
    }
    if(edges & KGNAutoLayoutEdgeRight){
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:-offset]];
    }
    if(edges & KGNAutoLayoutEdgeRight){
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-offset]];
    }

    [superview addConstraints:constraints];
    return [constraints copy];
}

//- (NSLayoutConstraint *)constrainViewBelow:(UIView *)view{
//    return [self constrainViewBelow:view withOffset:0];
//}
//
//- (NSLayoutConstraint *)constrainViewBelow:(UIView *)view withOffset:(CGFloat)offset{
//    return nil;
//}

@end
