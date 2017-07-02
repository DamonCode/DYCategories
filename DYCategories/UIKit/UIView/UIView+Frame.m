//
//  UIView+Frame.m
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
#pragma mark- properties
// origin.x
- (void)setDy_left:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)dy_left {
    return self.frame.origin.x;
}
// origin.x + size.width
- (void)setDy_right:(CGFloat)dy_right {
    CGRect rect = self.frame;
    rect.origin.x = dy_right - rect.size.width;
    self.frame = rect;
}
- (CGFloat)dy_right {
    return self.frame.origin.x + self.frame.size.width;
}
// origin.y
- (void)setDy_top:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (CGFloat)dy_top {
    return self.frame.origin.y;
}
// origin.y + height
- (void)setDy_bottom:(CGFloat)dy_bottom {
    CGRect rect = self.frame;
    rect.origin.y = dy_bottom - self.frame.size.height;
    self.frame = rect;
}
- (CGFloat)dy_bottom {
    return self.frame.size.height + self.frame.origin.y;
}
// width
- (void)setDy_width:(CGFloat)dy_width {
    CGRect rect = self.frame;
    rect.size.width = dy_width;
    self.frame = rect;
}
- (CGFloat)dy_width {
    return self.frame.size.width;
}
// height
- (void)setDy_height:(CGFloat)dy_height {
    CGRect rect = self.frame;
    rect.size.height = dy_height;
    self.frame = rect;
}
- (CGFloat)dy_height {
    return self.frame.size.height;
}
// center x
- (void)setDy_centerX:(CGFloat)dy_centerX {
    self.center = CGPointMake(dy_centerX, self.center.y);
}
- (CGFloat)dy_centerX {
    return self.center.x;
}
// center y
- (void)setDy_centerY:(CGFloat)dy_centerY {
    self.center = CGPointMake(self.center.x, dy_centerY);
}
- (CGFloat)dy_centerY {
    return self.center.y;
}
// origin
- (void)setDy_origin:(CGPoint)dy_origin {
    CGRect rect = self.frame;
    rect.origin = dy_origin;
    self.frame = rect;
}
- (CGPoint)dy_origin {
    return self.frame.origin;
}
// size
- (void)setDy_size:(CGSize)dy_size {
    CGRect rect = self.frame;
    rect.size = dy_size;
    self.frame = rect;
}
- (CGSize)dy_size {
    return self.frame.size;
}
@end
