/**
 Constrain the width and height of the view.
 @param size The width and height to constrain the view to.
 @return The NSLayoutConstraint constraint.
 */
- (NSArray *)kgn_sizeToWidthAndHeight:(CGFloat)size;

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
 Position the views above the view.
 @param views The views to position above the view.
 */
- (void)kgn_positionViewsAbove:(NSArray *)views;

/**
 Position the views above the view.
 @param views The views to position above the view.
 @param offset How far to offset(seperate) the views.
 */
- (void)kgn_positionViewsAbove:(NSArray *)views withOffset:(CGFloat)offset;


/**
 Position the view to the right of an item.
 @param item Position the view to the right of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionToTheRightOfItem:(id)item;

/**
 Position the view to the right of an item.
 @param item Position the view to the right of this item, it may be a view or layout guide.
 @param offset How far to offset(seperate) the left of the view from the right of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionToTheRightOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Position the views to the right of the view.
 @param views The views to position to the right.
 */
- (void)kgn_positionViewsToTheRight:(NSArray *)views;

/**
 Position the views to the right of the view.
 @param views The views to position to the right.
 @param offset How far to offset(seperate) the views.
 */
- (void)kgn_positionViewsToTheRight:(NSArray *)views withOffset:(CGFloat)offset;


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
 Position the views below the view.
 @param views The views to position below the view.
 */
- (void)kgn_positionViewsBelow:(NSArray *)views;

/**
 Position the views below the view.
 @param views The views to position below the view.
 @param offset How far to offset(seperate) the views.
 */
- (void)kgn_positionViewsBelow:(NSArray *)views withOffset:(CGFloat)offset;


/**
 Position the view to the left of an item.
 @param item Position the view to the left of this item, it may be a view or layout guide.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionToTheLeftOfItem:(id)item;

/**
 Position the view to the left of an item.
 @param item Position the view to the left of this item, it may be a view or layout guide.
 @param offset How far to offset(seperate) the right of the view from the left of the item.
 @return The NSLayoutConstraint constraint.
 */
- (NSLayoutConstraint *)kgn_positionToTheLeftOfItem:(id)item withOffset:(CGFloat)offset;


/**
 Position the views to the right of the view.
 @param views The views to position to the right.
 */
- (void)kgn_positionViewsToTheLeft:(NSArray *)views;

/**
 Position the views to the right of the view.
 @param views The views to position to the right.
 @param offset How far to offset(seperate) the views.
 */
- (void)kgn_positionViewsToTheLeft:(NSArray *)views withOffset:(CGFloat)offset;


#pragma mark - Between

/**
 Fit the view between the top and bottom items.
 @param topItem The top item to fit below.
 @param bottomItem The bottom item to fit below.
 @return The top and bottom NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_fitBetweenTopItem:(id)topItem andBottomItem:(id)bottomItem;

/**
 Fit the view between the top and bottom items.
 @param topItem The top item to fit below.
 @param bottomItem The bottom item to fit below.
 @param offset How far to offset(seperate) the view from the top and bottom items.
 @return The top and bottom NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_fitBetweenTopItem:(id)topItem andBottomItem:(id)bottomItem withOffset:(CGFloat)offset;


/**
 Fit the view between the left and right items.
 @param leftItem The left item to fit below.
 @param rightItem The right item to fit below.
 @return The left and right NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_fitBetweenLeftItem:(id)leftItem andRightItem:(id)rightItem;

/**
 Fit the view between the left and right items.
 @param leftItem The left item to fit below.
 @param rightItem The right item to fit below.
 @param offset How far to offset(seperate) the view from the left and right items.
 @return The left and right NSLayoutConstraint constraints.
 */
- (NSArray *)kgn_fitBetweenLeftItem:(id)leftItem andRightItem:(id)rightItem withOffset:(CGFloat)offset;


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

/**
 Low-level method to create arbitrary constraint not covered by convenience methods above.
 */
- (NSLayoutConstraint *)kgn_constrainAttribute:(NSLayoutAttribute)viewAttribute toAttribute:(NSLayoutAttribute)itemAttribute ofItem:(id)item relatedBy:(NSLayoutRelation)relatedBy withOffset:(CGFloat)offset;

@end
