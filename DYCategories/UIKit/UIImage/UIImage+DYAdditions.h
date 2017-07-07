//
//  UIImage+DYAdditions.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DYAdditions)
#pragma mark - Creator
+ (nullable UIImage *)imageWithPDF:(id)dataOrPath;
+ (nullable UIImage *)imageWithPDF:(id)dataOrPath size:(CGSize)size;
+ (nullable UIImage *)imageWithColor:(UIColor *)color;
+ (nullable UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (nullable UIImage *)imageWithFont:(UIFont *)font named:(NSString *)iconNamed withTintColor:(UIColor *)tintColor clipsToBounds:(BOOL)clipsToBounds fontSize:(CGFloat)fontSize;
+ (UIImage *)imageByMergeImage:(UIImage *)first withImage:(UIImage *)second;
#pragma mark- Alpha
- (BOOL)hasAlphaChannel;
- (UIImage *)imageWithAlpha; // add alpha
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;
- (UIImage *)trimmedBetterSize;
#pragma mark- Modify
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips;;
- (nullable UIImage *)imageByResizeToSize:(CGSize)size;
- (nullable UIImage *)imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;
- (nullable UIImage *)imageByCropToRect:(CGRect)rect;
- (nullable UIImage *)imageByInsetsEdge:(UIEdgeInsets)insets withColor:(nullable UIColor *)color;
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius;
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;
- (nullable UIImage *)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;
- (nullable UIImage *)imageByRotateLeft90;
- (nullable UIImage *)imageByRotateRight90;
- (nullable UIImage *)imageByRotate180;
- (nullable UIImage *)imageByFlipVertical;
- (nullable UIImage *)imageByFlipHorizontal;
#pragma mark- Effect
- (nullable UIImage *)imageByTintColor:(UIColor *)color;
- (nullable UIImage *)imageByGrayscale;
- (nullable UIImage *)imageByBlurSoft;
- (nullable UIImage *)imageByBlurLight;
- (nullable UIImage *)imageByBlurExtraLight;
- (nullable UIImage *)imageByBlurDark;
- (nullable UIImage *)imageByBlurWithTint:(UIColor *)tintColor;
- (nullable UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                              tintColor:(nullable UIColor *)tintColor
                               tintMode:(CGBlendMode)tintBlendMode
                             saturation:(CGFloat)saturation
                              maskImage:(nullable UIImage *)maskImage;

@end
NS_ASSUME_NONNULL_END
