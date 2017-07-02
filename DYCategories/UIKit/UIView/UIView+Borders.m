//
//  UIView+Borders.m
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UIView+Borders.h"
#import "UIView+Frame.h"
@implementation UIView (Borders)
- (void)makeRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:corners
                                                     cornerRadii:(CGSize){radius, radius}];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    [self.layer setMask:maskLayer];
}
- (void)addBorderWithWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor borderStyle:(UIViewBorderSides)borderStyle {
    if (borderStyle & UIViewBorderSidesLeft) {[self addLeftBorderWithWidth:borderWidth borderColor:borderColor];}
    if (borderStyle & UIViewBorderSidesTop) {[self addTopBorderWithWidth:borderWidth borderColor:borderColor];}
    if (borderStyle & UIViewBorderSidesRight) {[self addRightBorderWithWidth:borderWidth borderColor:borderColor];}
    if (borderStyle & UIViewBorderSidesBottom) {[self addBottomBorderWithWidth:borderWidth borderColor:borderColor];}
    if (borderStyle & UIViewBorderSidesAll) {[self addLeftBorderWithWidth:borderWidth borderColor:borderColor];
                                            [self addTopBorderWithWidth:borderWidth borderColor:borderColor];
                                            [self addRightBorderWithWidth:borderWidth borderColor:borderColor];
                                            [self addBottomBorderWithWidth:borderWidth borderColor:borderColor];}
}
- (void)addLeftBorderWithWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self removeBorderWithSides:UIViewBorderSidesLeft];
    UIView *border = [UIView new];
    border.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints;
    border.userInteractionEnabled = NO;
    border.backgroundColor = borderColor;
    border.tag = UIViewBorderSidesLeft;
    [self addSubview:border];
    if (border.translatesAutoresizingMaskIntoConstraints) {border.frame = (CGRect){0,0,borderWidth,self.dy_height}; return;};
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}
- (void)addTopBorderWithWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self removeBorderWithSides:UIViewBorderSidesTop];
    UIView *border = [UIView new];
    border.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints;
    border.userInteractionEnabled = NO;
    border.backgroundColor = borderColor;
    border.tag = UIViewBorderSidesTop;
    [self addSubview:border];
    if (border.translatesAutoresizingMaskIntoConstraints) {border.frame = (CGRect){0,0,self.dy_width,borderWidth}; return;};
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
    
}
- (void)addRightBorderWithWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self removeBorderWithSides:UIViewBorderSidesRight];
    UIView *border = [UIView new];
    border.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints;
    border.userInteractionEnabled = NO;
    border.backgroundColor = borderColor;
    border.tag = UIViewBorderSidesRight;
    [self addSubview:border];
    if (border.translatesAutoresizingMaskIntoConstraints) {border.frame = (CGRect){self.dy_width-borderWidth,0,borderWidth,self.dy_height}; return;};
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}
- (void)addBottomBorderWithWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self removeBorderWithSides:UIViewBorderSidesBottom];
    UIView *border = [UIView new];
    border.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints;
    border.userInteractionEnabled = NO;
    border.backgroundColor = borderColor;
    border.tag = UIViewBorderSidesBottom;
    [self addSubview:border];
    if (border.translatesAutoresizingMaskIntoConstraints) {border.frame = (CGRect){0,self.dy_bottom-borderWidth,self.dy_width,borderWidth}; return;};
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
}
- (void)removeBorderWithSides:(UIViewBorderSides)sides {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subview, NSUInteger idx, BOOL * _Nonnull stop) {
        if (subview.tag == sides) {
            [subview removeFromSuperview];
        }
    }];
}
@end
