//
//  KGNAppDelegate.m
//  UIView+KGNAutoLayout
//
//  Created by David Keegan on 5/17/14.
//  Copyright (c) 2014 David Keegan. All rights reserved.
//

#import "KGNAppDelegate.h"
#import "UIView+KGNAutoLayout.h"

@implementation KGNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UIViewController *viewController = [UIViewController new];
    self.window.rootViewController = viewController;
    
    UIView *rootView = [UIView new];
    rootView.backgroundColor = [UIColor whiteColor];
    [viewController.view addSubview:rootView];
    [rootView kgn_pinToSuperview];

    UIView *innerView = [UIView new];
    innerView.backgroundColor = [UIColor redColor];
    [viewController.view addSubview:innerView];
    [innerView kgn_pinToSuperviewEdges:KGNAutoLayoutEdgeAll withinViewController:viewController andOffset:10];

    UIView *centerView = [UIView new];
    centerView.backgroundColor = [UIColor blueColor];
    [innerView addSubview:centerView];
    [centerView kgn_centerInSuperview];
    [centerView kgn_constrainToWidth:100];
    [centerView kgn_constrainToHeight:80];

    UIView *aboveView = [UIView new];
    aboveView.backgroundColor = [UIColor yellowColor];
    [innerView addSubview:aboveView];
    [aboveView kgn_positionAboveItem:centerView withOffset:10];
    [aboveView kgn_centerHorizontallyInSuperview];
    [aboveView kgn_constrainToWidth:60];
    [aboveView kgn_constrainToHeight:20];

    UIView *belowView = [UIView new];
    belowView.backgroundColor = [UIColor purpleColor];
    [viewController.view addSubview:belowView];
    [belowView kgn_positionBelowItem:centerView withOffset:10];
    [belowView kgn_centerHorizontallyInSuperview];
    [belowView kgn_constrainToWidth:60];
    [belowView kgn_constrainToHeight:20];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
