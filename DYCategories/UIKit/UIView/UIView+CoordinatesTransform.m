//
//  UIView+CoordinatesTransform.m
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UIView+CoordinatesTransform.h"

@implementation UIView (CoordinatesTransform)
- (CGPoint)convertPoint:(CGPoint)point toViewOrWindow:(UIView *)toView {
    if (!toView) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point toWindow:nil];
        } else {
            return [self convertPoint:point toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [toView isKindOfClass:[UIWindow class]] ? (id)toView : toView.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point toView:toView];
    point = [self convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    point = [toView convertPoint:point fromView:to];
    return point;
}
- (CGPoint)convertPoint:(CGPoint)point fromVieworWindow:(UIView *)fromView {
    if (!fromView) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point fromWindow:nil];
        } else {
            return [self convertPoint:point fromView:nil];
        }
    }
    
    UIWindow *from = [fromView isKindOfClass:[UIWindow class]] ? (id)fromView : fromView.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point fromView:fromView];
    point = [from convertPoint:point fromView:fromView];
    point = [to convertPoint:point fromWindow:from];
    point = [self convertPoint:point fromView:to];
    return point;
}
- (CGRect)convertRect:(CGRect)rect toViewOrWindow:(UIView *)toView {
    if (!toView) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect toWindow:nil];
        } else {
            return [self convertRect:rect toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [toView isKindOfClass:[UIWindow class]] ? (id)toView : toView.window;
    if (!from || !to) return [self convertRect:rect toView:toView];
    if (from == to) return [self convertRect:rect toView:toView];
    rect = [self convertRect:rect toView:from];
    rect = [to convertRect:rect fromWindow:from];
    rect = [toView convertRect:rect fromView:to];
    return rect;
}
- (CGRect)convertRect:(CGRect)rect fromViewOrWindow:(UIView *)fromView {
    if (!fromView) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect fromWindow:nil];
        } else {
            return [self convertRect:rect fromView:nil];
        }
    }
    
    UIWindow *from = [fromView isKindOfClass:[UIWindow class]] ? (id)fromView : fromView.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertRect:rect fromView:fromView];
    rect = [from convertRect:rect fromView:fromView];
    rect = [to convertRect:rect fromWindow:from];
    rect = [self convertRect:rect fromView:to];
    return rect;
}
@end
