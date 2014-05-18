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

    UIView *centerView = [UIView new];
    centerView.backgroundColor = [UIColor redColor];
    [viewController.view addSubview:centerView];
    [centerView kgn_pinToSuperview];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
