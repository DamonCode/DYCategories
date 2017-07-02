//
//  UIView+Hierarchy.h
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (Hierarchy)

/**
 add subviews from a set

 @param subviews a set of subviews
 */
- (void)addSubviews:(NSSet<UIView *> *)subviews;
- (void)removeAllSubviews;
/**
 find subview at index

 @param index subview index
 @return subview
 */
- (nullable __kindof UIView *)findSubviewAtIndex:(NSInteger)index;
- (nullable __kindof UIView *)findSuperviewWithClassType:(Class)cls;
- (void)logSubHierarchy;
- (void)logSuperHierarchy;
- (void)debugLogHierarchy;


- (CGAffineTransform)convertTransformToView:(nullable UIView *)toView;
/**
 find the view controller that current view in
 */
- (nullable __kindof UIViewController *)firstAvailableViewController;
- (__kindof UIViewController *)topMostController;


@end
NS_ASSUME_NONNULL_END
