//
//  UIView+Borders.h
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, UIViewBorderSides) {
    UIViewBorderSidesLeft =     1 << 0,
    UIViewBorderSidesTop =      1 << 1,
    UIViewBorderSidesRight =    1 << 2,
    UIViewBorderSidesBottom =   1 << 3,
    UIViewBorderSidesAll =      1 << 4,
    
};
@interface UIView (Borders)
- (void)makeRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;
- (void)addBorderWithWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor borderStyle:(UIViewBorderSides)borderStyle;
- (void)removeBorderWithSides:(UIViewBorderSides)sides;

@end
