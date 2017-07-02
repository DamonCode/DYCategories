//
//  UIView+CoordinatesTransform.h
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (CoordinatesTransform)
- (CGPoint)convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)toView;
- (CGPoint)convertPoint:(CGPoint)point fromVieworWindow:(nullable UIView *)fromView;
- (CGRect)convertRect:(CGRect)rect toViewOrWindow:(nullable UIView *)toView;
- (CGRect)convertRect:(CGRect)rect fromViewOrWindow:(nullable UIView *)fromView;

@end
NS_ASSUME_NONNULL_END
