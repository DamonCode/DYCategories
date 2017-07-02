//
//  UIView+Animation.h
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DYShakeDirection) {
    DYShakeDirectionHorizontal = 0,
    DYShakeDirectionVertical,
    DYShakeDirectionRotation,
};
@class DYViewAction;
@class DYViewActionSequence;
typedef void(^DYViewActionBlock)();
typedef void(^DYViewActionCompletion)(BOOL finished);
NS_ASSUME_NONNULL_BEGIN
@interface UIView (Animation)
+ (void)dy_runAction:(DYViewAction *)action;
+ (void)dy_runAction:(DYViewAction *)action completion:(nullable DYViewActionCompletion)completion;
- (void)shake;


// shake effect
- (void)shake:(int)times withDelta:(CGFloat)delta;
- (void)shake:(int)times withDelta:(CGFloat)delta completion:(nullable void (^)(void))handler;
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval;
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(nullable void (^)(void))handler;
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DYShakeDirection)shakeDirection;
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DYShakeDirection)shakeDirection completion:(nullable void (^)(void))completion;
@end
@interface DYViewAction : NSObject
@property (nonatomic, readonly) NSTimeInterval duration;
+ (DYViewAction *)action:(DYViewActionBlock)action withDuration:(NSTimeInterval)duration;
+ (DYViewAction *)action:(DYViewActionBlock)action withOptions:(UIViewAnimationOptions)options duration:(NSTimeInterval)duration;
+ (DYViewAction *)springAction:(DYViewActionBlock)action withDamping:(CGFloat)dampingRatio initialVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options duration:(NSTimeInterval)duration;
+ (DYViewAction *)waitForDuration:(NSTimeInterval)duration;
+ (DYViewAction *)group:(NSArray<DYViewAction *> *)actions;
+ (DYViewActionSequence *)sequence:(NSArray<DYViewAction *> *)sequence;


@end
@interface DYViewActionSequence : DYViewAction
@property (nonatomic, readonly, getter=isCanceled) BOOL canceled;
- (void)appendAction:(DYViewAction *)action;
- (void)cancel;
@end
NS_ASSUME_NONNULL_END
