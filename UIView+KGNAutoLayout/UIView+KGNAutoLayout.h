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

/** 
 Pin a view to all four edges of it's super view.
 @return The top, right, bottom, and left NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_pinToEdgesOfSuperview;

/**
 Pin a view to all four edges of it's super view, with an offset(inset from the edges).
 @param offset How far to offset(inset) the edges of the view from the superview's edges.
 @return The top, right, bottom, and left NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_pinToEdgesOfSuperviewWithOffset:(CGFloat)offset;


/**
 Pin the top edge of the view to the top edge of it's superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToTopEdgeOfSuperview;

/**
 Pin the top edge of the view to the top edge of it's superview.
 @param offset How far to offset the top edge of the view from the top edge of its superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToTopEdgeOfSuperviewWithOffset:(CGFloat)offset;


/**
 Pin the right edge of the view to the right edge of it's superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToRightEdgeOfSuperview;

/**
 Pin the right edge of the view to the right edge of it's superview.
 @param offset How far to offset the right edge of the view from the right edge of its superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToRightEdgeOfSuperviewWithOffset:(CGFloat)offset;


/**
 Pin the bottom edge of the view to the bottom edge of it's superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfSuperview;

/**
 Pin the bottom edge of the view to the bottom edge of it's superview.
 @param offset How far to offset the bottom edge of the view from the bottom edge of its superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToBottomEdgeOfSuperviewWithOffset:(CGFloat)offset;


/**
 Pin the left edge of the view to the left edge of it's superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfSuperview;

/**
 Pin the left edge of the view to the left edge of it's superview.
 @param offset How far to offset the left edge of the view from the left edge of its superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinToLeftEdgeOfSuperviewWithOffset:(CGFloat)offset;


/**
 Pin the left and right edges of the view to the left and right edges of it's superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSArray *)kgn_pinToSideEdgesOfSuperview;

/**
 Pin the left and right edges of the view to the left and right edges of it's superview.
 @param offset How far to offset the left and right edges of the view from the left and right edges of its superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSArray *)kgn_pinToSideEdgesOfSuperviewWithOffset:(CGFloat)offset;

#pragma mark - Pin: Edges

/**
 Pin the top edge of the view to the top edge of another item.
 @param item Constrain the top edge of the view to the top edge of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinTopEdgeToTopEdgeOfItem:(id)item;

/**
 Pin the top edge of the view to the top edge of another item.
 @param item Constrain the top edge of the view to the top edge of this item, it may be a view or layout guide.
 @param offset How far to offset the top edge of the view from the top edge of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinTopEdgeToTopEdgeOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Pin the right edge of the view to the right edge of another item.
 @param item Constrain the right edge of the view to the right edge of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinRightEdgeToRightEdgeOfItem:(id)item;

/**
 Pin the right edge of the view to the right edge of another item.
 @param item Constrain the right edge of the view to the right edge of this item, it may be a view or layout guide.
 @param offset How far to offset the right edge of the view from the right edge of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinRightEdgeToRightEdgeOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Pin the bottom edge of the view to the bottom edge of another item.
 @param item Constrain the bottom edge of the view to the bottom edge of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinBottomEdgeToBottomEdgeOfItem:(id)item;

/**
 Pin the bottom edge of the view to the bottom edge of another item.
 @param item Constrain the bottom edge of the view to the bottom edge of this item, it may be a view or layout guide.
 @param offset How far to offset the bottom edge of the view from the bottom edge of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinBottomEdgeToBottomEdgeOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Pin the left edge of the view to the left edge of another item.
 @param item Constrain the left edge of the view to the left edge of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinLeftEdgeToLeftEdgeOfItem:(id)item;

/**
 Pin the left edge of the view to the left edge of another item.
 @param item Constrain the left edge of the view to the left edge of this item, it may be a view or layout guide.
 @param offset How far to offset the left edge of the view from the left edge of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_pinLeftEdgeToLeftEdgeOfItem:(id)item withOffset:(CGFloat)offset;

#pragma mark - Center

/**
 Center the view horizontally and vertically within it's superview.
 @return The horizontal and vertical NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_centerInSuperview;


/**
 Center the view horizontally within it's superview.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperview;

/**
 Center the view horizontally within it's super view.
 @param offset How far to horizontally offset the center of the view from the superview's center.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_centerHorizontallyInSuperviewWithOffset:(CGFloat)offset;


/**
 Center the view vertically within it's super view.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_centerVerticallyInSuperview;

/**
 Center the view vertically within it's super view.
 @param offset How far to vertically offset the center of the view from the superview's center.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_centerVerticallyInSuperviewWithOffset:(CGFloat)offset;

#pragma mark - Size

/**
 Constrain the width of the view.
 @param width The width to constrain the view to.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeToWidth:(CGFloat)width;

/**
 Constrain the height of the view.
 @param height The height to constrain the view to.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeToHeight:(CGFloat)height;

/**
 Constrain the width and height of the view.
 @param size The width and height to constrain the view to.
 @return The NSLayoutConstraint constraint.
 */
- (NSArray *)kgn_sizeToWidthAndHeight:(CGFloat)size;


/**
 Constrain the width of the view to the width of an item.
 @param item Constrain the width of the view to the width of the item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeToWidthOfItem:(id)item;

/**
 Constrain the width of the view to the width of an item.
 @param item Constrain the width of the view to the width of the item, it may be a view or layout guide.
 @param offset How far to offset the width of the view from the width of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeToWidthOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Constrain the height of the view to the height of an item.
 @param item Constrain the height of the view to the height of the item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item;

/**
 Constrain the height of the view to the height of an item.
 @param item Constrain the height of the view to the height of the item, it may be a view or layout guide.
 @param offset How far to offset the height of the view from the height of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeToHeightOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Constrain the height of the view to the width of an item.
 @param item Constrain the height of the view to the width of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeHeightToWidthOfItem:(id)item;

/**
 Constrain the width of the view to the height of an item.
 @param item Constrain the width of the view to the height of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_sizeWidthToHeightOfItem:(id)item;

/**
 Constrain the width and height of the view to the width and height of an item.
 @param item Constrain the width and height of the view to the width and height of the item, it may be a view or layout guide.
 @return The width and height NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_sizeToWidthAndHeightOfItem:(id)item;

/**
 Constrain the width and height of the view to the width and height of an item.
 @param item Constrain the width and height of the view to the width and height of the item, it may be a view or layout guide.
 @param offset How far to offset the width and height of the view from the width and height of the item.
 @return The width and height NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_sizeToWidthAndHeightOfItem:(id)item withOffset:(CGFloat)offset;

#pragma mark - Position

/**
 Position the view above an item.
 @param item Position the view above this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item;

/**
 Position the view above an item.
 @param item Position the view above this item, it may be a view or layout guide.
 @param offset How far to offset(seperate) the bottom of the view from the top of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionAboveItem:(id)item withOffset:(CGFloat)offset;


/**
 Position the view to the right of an item.
 @param item Position the view to the right of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionRightOfItem:(id)item;

/**
 Position the view to the right of an item.
 @param item Position the view to the right of this item, it may be a view or layout guide.
 @param offset How far to offset(seperate) the left of the view from the right of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionRightOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Position the view below an item.
 @param item Position the view below this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item;

/**
 Position the view below an item.
 @param item Position the view below this item, it may be a view or layout guide.
 @param offset How far to offset(seperate) the top of the view from the bottom of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionBelowItem:(id)item withOffset:(CGFloat)offset;


/**
 Position the view to the left of an item.
 @param item Position the view to the left of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionLeftOfItem:(id)item;

/**
 Position the view to the left of an item.
 @param item Position the view to the left of this item, it may be a view or layout guide.
 @param offset How far to offset(seperate) the right of the view from the left of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionLeftOfItem:(id)item withOffset:(CGFloat)offset;

// TODO
//#pragma mark - Fit: Between
//
//- (NSArray *)kgn_fitBetweenTopItem:(id)item andBottomItem:(id)item;
//- (NSArray *)kgn_fitBetweenTopItem:(id)item andBottomItem:(id)item withOffset:(CGFloat)offset;
//
//- (NSArray *)kgn_fitBetweenLeftItem:(id)item andRightItem:(id)item;
//- (NSArray *)kgn_fitBetweenLeftItem:(id)item andRightItem:(id)item withOffset:(CGFloat)offset;

#pragma mark - Fill

/**
 Horizontally layout and fill the view with views.
 @param views An array of views to horizontally layout and fill the view with.
 */
- (void)kgn_fillHorizontallyWithViews:(NSArray *)views;

/**
 Horizontally layout and fill the view with views.
 @param views An array of views to horizontally layout and fill the view with.
 @param separation The separation between the views.
 */
- (void)kgn_fillHorizontallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation;


/**
 Vertically layout and fill the view with views.
 @param views An array of views to vertically layout and fill the view with.
 */
- (void)kgn_fillVerticallyWithViews:(NSArray *)views;

/**
 Vertically layout and fill the view with views.
 @param views An array of views to vertically layout and fill the view with.
 @param separation The separation between the views.
 */
- (void)kgn_fillVerticallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation;

#pragma mark - Bound

/**
 Horizontally layout views and then bound the left and right edges of the view to the left and right edges of the first and last views.
 This method is useful for filling scroll views with views becuase the passed views will be laid out, 
 and then the calling view(scroll view) will be bound to their total width.
 @param views An array of views to layout horizontally. The left and right edges of the view are bound to the left and right edges of first and last views.
 */
- (void)kgn_boundHorizontallyWithViews:(NSArray *)views;

/**
 Horizontally layout views and then bound the left and right edges of the view to the left and right edges of the first and last views.
  This method is useful for filling scroll views with views becuase the passed views will be laid out, 
 and then the calling view(scroll view) will be bound to their total width.
 @param views An array of views to layout horizontally. The left and right edges of the view are bound to the left and right edges of first and last views.
 @param separation The separation between the views.
 */
- (void)kgn_boundHorizontallyWithViews:(NSArray *)views withSeparation:(CGFloat)separation;


/**
 Vertically layout views and then bound the top and bottom edges of the view to the top and bottom edges of the first and last views.
 This method is useful for filling scroll views with views becuase the passed views will be laid out,
 and then the calling view(scroll view) will be bound to their total height.
 @param views An array of views to layout vertically. The top and bottom edges of the view are bound to the top and bottom edges of first and last views.
 */
- (void)kgn_boundVerticallyLayoutViews:(NSArray *)views;

/**
 Vertically layout views and then bound the top and bottom edges of the view to the top and bottom edges of the first and last views.
 This method is useful for filling scroll views with views becuase the passed views will be laid out,
 and then the calling view(scroll view) will be bound to their total height.
 @param views An array of views to layout vertically. The top and bottom edges of the view are bound to the top and bottom edges of first and last views.
 @param separation The separation between the views.
 */
- (void)kgn_boundVerticallyLayoutViews:(NSArray *)views withSeparation:(CGFloat)separation;

@end
