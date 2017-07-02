//
//  UIView+Toast.h
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
#pragma mark- UIView + Toast
extern const NSString *DYToastPositionTop;
extern const NSString *DYToastPositionCenter;
extern const NSString *DYToastPositionBottom;

@class DYToastStyle;
@interface UIView (Toast)

- (void)makeToast:(NSString *)message;

- (void)makeToast:(NSString *)message
         duration:(NSTimeInterval)duration
         position:(id)position;

- (void)makeToast:(NSString *)message
         duration:(NSTimeInterval)duration
         position:(id)position
            style:(nullable DYToastStyle *)style;


- (void)makeToast:(NSString *)message
         duration:(NSTimeInterval)duration
         position:(id)position
            title:(NSString *)title
            image:(UIImage *)image
            style:(nullable DYToastStyle *)style
       completion:(void(^)(BOOL didTap))completion;


- (UIView *)toastViewForMessage:(NSString *)message
                          title:(nullable NSString *)title
                          image:(nullable UIImage *)image
                          style:(nullable DYToastStyle *)style;


- (void)hideToasts;

- (void)hideToast:(UIView *)toast;

- (void)makeToastActivity:(id)position;

- (void)hideToastActivity;

- (void)showToast:(UIView *)toast;


- (void)showToast:(UIView *)toast
         duration:(NSTimeInterval)duration
         position:(id)position
       completion:(nullable void(^)(BOOL didTap))completion;

@end


@interface DYToastStyle : NSObject


@property (strong, nonatomic) UIColor *backgroundColor;


@property (strong, nonatomic) UIColor *titleColor;


@property (strong, nonatomic) UIColor *messageColor;


@property (assign, nonatomic) CGFloat maxWidthPercentage;


@property (assign, nonatomic) CGFloat maxHeightPercentage;


@property (assign, nonatomic) CGFloat horizontalPadding;


@property (assign, nonatomic) CGFloat verticalPadding;


@property (assign, nonatomic) CGFloat cornerRadius;

@property (strong, nonatomic) UIFont *titleFont;


@property (strong, nonatomic) UIFont *messageFont;


@property (assign, nonatomic) NSTextAlignment titleAlignment;


@property (assign, nonatomic) NSTextAlignment messageAlignment;


@property (assign, nonatomic) NSInteger titleNumberOfLines;


@property (assign, nonatomic) NSInteger messageNumberOfLines;


@property (assign, nonatomic) BOOL displayShadow;


@property (strong, nonatomic) UIColor *shadowColor;


@property (assign, nonatomic) CGFloat shadowOpacity;


@property (assign, nonatomic) CGFloat shadowRadius;


@property (assign, nonatomic) CGSize shadowOffset;

@property (assign, nonatomic) CGSize imageSize;


@property (assign, nonatomic) CGSize activitySize;


@property (assign, nonatomic) NSTimeInterval fadeDuration;


- (instancetype)initWithDefaultStyle NS_DESIGNATED_INITIALIZER;


- (instancetype)init NS_UNAVAILABLE;

@end


@interface DYToastManager : NSObject


+ (void)setSharedStyle:(DYToastStyle *)sharedStyle;


+ (DYToastStyle *)sharedStyle;


+ (void)setTapToDismissEnabled:(BOOL)tapToDismissEnabled;


+ (BOOL)isTapToDismissEnabled;


+ (void)setQueueEnabled:(BOOL)queueEnabled;

+ (BOOL)isQueueEnabled;


+ (void)setDefaultDuration:(NSTimeInterval)duration;

+ (NSTimeInterval)defaultDuration;


+ (void)setDefaultPosition:(id)position;

+ (id)defaultPosition;

@end
NS_ASSUME_NONNULL_END
