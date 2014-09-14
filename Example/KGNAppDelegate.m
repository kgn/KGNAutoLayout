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
    viewController.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = viewController;

    // Navigation bar

    UIView *navigationBarView = [UIView new];
    navigationBarView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    [viewController.view addSubview:navigationBarView];
    [navigationBarView kgn_sizeToHeight:64];
    [navigationBarView kgn_pinToSideEdgesOfSuperview];
    [navigationBarView kgn_pinToTopEdgeOfSuperview];

    UIView *navigationBarContentView = [UIView new];
    [navigationBarView addSubview:navigationBarContentView];
    [navigationBarContentView kgn_positionBelowItem:viewController.topLayoutGuide];
    [navigationBarContentView kgn_pinToSideEdgesOfSuperview];
    [navigationBarContentView kgn_pinToBottomEdgeOfSuperview];

    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftButton setTitle:NSLocalizedString(@"Menu", @"Menu button title") forState:UIControlStateNormal];
    [navigationBarContentView addSubview:leftButton];
    [leftButton kgn_pinToLeftEdgeOfSuperviewWithOffset:10];
    [leftButton kgn_centerVerticallyInSuperview];

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightButton setTitle:NSLocalizedString(@"Settings", @"Settings button title") forState:UIControlStateNormal];
    [navigationBarContentView addSubview:rightButton];
    [rightButton kgn_pinToRightEdgeOfSuperviewWithOffset:10];
    [rightButton kgn_centerVerticallyInSuperview];

    UILabel *titleLabel = [UILabel new];
    titleLabel.text = NSLocalizedString(@"Auto Layout", @"Auto layout title");
    [navigationBarContentView addSubview:titleLabel];
    [titleLabel kgn_centerInSuperview];

    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [navigationBarView addSubview:lineView];
    [lineView kgn_sizeToHeight:0.5];
    [lineView kgn_pinToSideEdgesOfSuperview];
    [lineView kgn_pinToBottomEdgeOfSuperview];

    // Content

    UIScrollView *scrollView = [UIScrollView new];
    scrollView.clipsToBounds = NO;
    [viewController.view insertSubview:scrollView belowSubview:navigationBarView];
    [scrollView kgn_sizeToWidthOfItem:scrollView.superview];
    [scrollView kgn_positionBelowItem:navigationBarView];
    [scrollView kgn_pinToBottomEdgeOfSuperview];

    UILabel *contentTitleLabel = [UILabel new];
    contentTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    contentTitleLabel.text = @"A Tale of Two Cities";
    [scrollView addSubview:contentTitleLabel];
    [contentTitleLabel kgn_centerHorizontallyInSuperview];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tale-of-two-cities-book-cover.jpg"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:imageView];
    [imageView kgn_sizeToWidthOfItem:imageView.superview];
    [imageView kgn_sizeToHeight:200];

    UILabel *intoLabel = [UILabel new];
    intoLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    intoLabel.numberOfLines = 0;
    intoLabel.text = @"IT WAS the best of times, it was the worst of times, it was the age of wisdom,"
    " it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity,"
    " it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair,"
    " we had everything before us, we had nothing before us, we were all going direct to Heaven,"
    " we were all going direct the other way- in short, the period was so far like the present period,"
    " that some of its noisiest authorities insisted on its being received, for good or for evil,"
    " in the superlative degree of comparison only.";
    [scrollView addSubview:intoLabel];
    [intoLabel kgn_sizeToWidthOfItem:intoLabel.superview withOffset:20];
    [intoLabel kgn_centerHorizontallyInSuperview];

    UIView *shareView = [UIView new];
    [scrollView addSubview:shareView];
    [shareView kgn_sizeWidthToHeightOfItem:shareView.superview];
    [shareView kgn_centerHorizontallyInSuperview];

    UIImageView *facebookImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Facebook"]];
    [shareView addSubview:facebookImageView];
    [facebookImageView kgn_pinToTopEdgeOfSuperview];

    UIImageView *twitterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Twitter"]];
    [shareView addSubview:twitterImageView];
    [twitterImageView kgn_pinToTopEdgeOfSuperview];

    UIImageView *linkedinImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Linked-in"]];
    [shareView addSubview:linkedinImageView];
    [linkedinImageView kgn_pinToTopEdgeOfSuperview];

    [shareView kgn_centerViewsHorizontally:@[facebookImageView, twitterImageView, linkedinImageView] withSeparation:20];

    UIImageView *evernoteImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Evernote"]];
    [shareView addSubview:evernoteImageView];
    [evernoteImageView kgn_positionBelowItem:twitterImageView withOffset:10];

    UIImageView *pinterestImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Pinterest"]];
    [shareView addSubview:pinterestImageView];
    [pinterestImageView kgn_positionBelowItem:twitterImageView withOffset:10];

    [shareView kgn_pinBottomEdgeToBottomEdgeOfItem:pinterestImageView];
    [shareView kgn_centerViewsHorizontally:@[evernoteImageView, pinterestImageView] withSeparation:20];

    [scrollView kgn_boundVerticallyLayoutViews:@[contentTitleLabel, imageView, intoLabel, shareView] withSeparation:20];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
