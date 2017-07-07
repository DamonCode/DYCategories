//
//  UIButton+DYAdditions.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (DYAdditions)
#pragma mark- Alignment
- (void)dy_titleImageHorizontalAlignmentWithSpace:(CGFloat)space;
- (void)dy_imageTitleHorizontalAlignmentWithSpace:(CGFloat)space;
- (void)dy_titleImageVerticalAlignmentWithSpace:(CGFloat)space;
- (void)dy_imageTItleVerticalAlignmentWithSpace:(CGFloat)space;
#pragma mark- AreaInsets
@property (nonatomic) UIEdgeInsets dy_touchAreaInsets;
#pragma mark- Effect
- (void)dy_showIndicator;
- (void)dy_hideIndicator;
- (void)dy_startCountDownWithTimeout:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle;
@end
NS_ASSUME_NONNULL_END
