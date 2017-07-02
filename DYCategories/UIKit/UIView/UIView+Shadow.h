//
//  UIView+Shadow.h
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)
- (void)setLayerShadow:(nullable UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;

@end
