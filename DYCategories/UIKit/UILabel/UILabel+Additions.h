//
//  UILabel+Additions.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
//! Project version number for UILabel-AutomaticWriting.
FOUNDATION_EXPORT double UILabelAutomaticWritingVersionNumber;

//! Project version string for UILabel-AutomaticWriting.
FOUNDATION_EXPORT const unsigned char UILabelAutomaticWritingVersionString[];

extern NSTimeInterval const UILabelAWDefaultDuration;

extern unichar const UILabelAWDefaultCharacter;

typedef NS_ENUM(NSInteger, UILabelJKlinkingMode)
{
    UILabelJKlinkingModeNone,
    UILabelJKlinkingModeUntilFinish,
    UILabelJKlinkingModeUntilFinishKeeping,
    UILabelJKlinkingModeWhenFinish,
    UILabelJKlinkingModeWhenFinishShowing,
    UILabelJKlinkingModeAlways
};
NS_ASSUME_NONNULL_BEGIN
@interface UILabel (Additions)

- (CGSize)dy_suggestedSizeForWidth:(CGFloat)width;
- (CGSize)dy_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;
- (CGSize)dy_suggestSizeForString:(NSString *)string width:(CGFloat)width;

@property (strong, nonatomic, nullable) NSOperationQueue *dy_automaticWritingOperationQueue;
@property (assign, nonatomic) UIEdgeInsets dy_edgeInsets;

- (void)dy_setTextWithAutomaticWritingAnimation:(NSString *)text;

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelJKlinkingMode)blinkingMode;

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration;

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode;

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter;

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(nullable void (^)(void))completion;

@end
NS_ASSUME_NONNULL_END
