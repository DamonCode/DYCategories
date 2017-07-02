//
//  UIView+Hierarchy.m
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UIView+Hierarchy.h"
#import "UIView+Frame.h"

@implementation UIView (Hierarchy)

- (void)addSubviews:(NSSet<UIView *> *)subviews {
    for (UIView *subview in subviews) {
        [self addSubview:subview];
    }
}
- (void)removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    };
}
- (UIView *)findSubviewAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.subviews.count) {
        return nil;
    }
    return self.subviews[index];
}
- (UIView *)findSuperviewWithClassType:(Class)cls {
    if (self == nil || self.superview == nil) {
        return nil;
    }
    else if ([self.superview isKindOfClass:cls]) {
        return self.superview;
    }
    else {
        return [self.superview findSuperviewWithClassType:cls];
    }
}
- (void)logSubHierarchy {
       NSLog(@"%@", [self subHierarchy]);
}
- (void)logSuperHierarchy {
    NSLog(@"%@", [self superHierarchy]);
}
- (void)debugLogHierarchy {
    NSLog(@"%@", [self debugHierarchy]);
}
- (CGAffineTransform)convertTransformToView:(UIView *)toView {
    if (!toView) {
        toView = self.window;
    }
    CGAffineTransform myTransform = CGAffineTransformIdentity;
    if (self.superview) myTransform = CGAffineTransformConcat(self.transform, [self.superview convertTransformToView:nil]);
    else                myTransform = self.transform;
    CGAffineTransform viewTransform = CGAffineTransformIdentity;
    if (self.superview) viewTransform = CGAffineTransformConcat(toView.transform, [self.superview convertTransformToView:nil]);
    else if (toView) viewTransform = toView.transform;
    return  CGAffineTransformConcat(myTransform, CGAffineTransformInvert(viewTransform));
}
- (UIViewController *)firstAvailableViewController {
    return (UIViewController *)[self traverseResponderChainForViewController];
}
- (UIViewController *)topMostController {
    NSMutableArray *controllersHierarchy = @[].mutableCopy;
    UIViewController *topController = self.window.rootViewController;
    if (topController) {
        [controllersHierarchy addObject:topController];
    }
    while ([topController presentedViewController]) {
        topController = [topController presentedViewController];
        [controllersHierarchy addObject:topController];
    }
    UIResponder *matchController = [self firstAvailableViewController];
    while (matchController && ![controllersHierarchy containsObject:matchController]) {
        do {
            matchController = [matchController nextResponder];
        }while (matchController && ![matchController isKindOfClass:[UIViewController class]]);
    }
    return (UIViewController *)matchController;
}
#pragma mark- private
- (id)traverseResponderChainForViewController {
    UIResponder *nextResponder = self.nextResponder;
    do {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return nextResponder;
        }
    }while (nextResponder);
    return nil;
}
- (NSInteger)depth {
    NSInteger depth = 0;
    if (self.superview) depth = [self.superview depth] + 1;
    return depth;
}
- (NSString *)debugHierarchy {
    NSMutableString *debugInfo = @"".mutableCopy;
    [debugInfo appendFormat:@"%@: ( %.0f, %.0f, %.0f, %.0f )",  NSStringFromClass([self class]),
                                                                self.dy_left,
                                                                self.dy_top,
                                                                self.dy_width,
                                                                self.dy_height];
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView*)self;
        [debugInfo appendFormat:@"%@: ( %.0f, %.0f )",NSStringFromSelector(@selector(contentSize)),scrollView.contentSize.width,scrollView.contentSize.height];
    }
    if (CGAffineTransformEqualToTransform(self.transform, CGAffineTransformIdentity) == false)
    {
        [debugInfo appendFormat:@"%@: %@",NSStringFromSelector(@selector(transform)),NSStringFromCGAffineTransform(self.transform)];
    }
    return debugInfo;
}
- (NSString *)subHierarchy {
    NSMutableString *debugInfo = @"\n".mutableCopy;
    NSInteger depth = [self depth];
    for (int count = 0; count < depth; count ++ ) {
        [debugInfo appendString:@"|  "];
    }
    [debugInfo appendString:[self debugHierarchy]];
    for (UIView *subview in self.subviews) {
        [debugInfo appendString:[subview subHierarchy]];
    }
    return debugInfo;
}
- (NSString *)superHierarchy {
    NSMutableString *debugInfo = @"".mutableCopy;
    if (self.superview) {[debugInfo appendString:[self.superview superHierarchy]];}
    else {[debugInfo appendString:@"\n"];}
    NSInteger depth = [self depth];
    for (int count = 0; count < depth; count++) {
        [debugInfo appendString:@"|  "];
    }
    [debugInfo appendString:[self debugHierarchy]];
    [debugInfo appendString:@"\n"];
    return debugInfo;
}
@end
