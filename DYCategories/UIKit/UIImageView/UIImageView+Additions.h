//
//  UIImageView+Additions.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImageView (Additions)
// water mark
- (void)dy_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
- (void)dy_setImage:(UIImage *)image withWaterMarkString:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void)dy_setImage:(UIImage *)image withWaterMarkString:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;

@end
NS_ASSUME_NONNULL_END
