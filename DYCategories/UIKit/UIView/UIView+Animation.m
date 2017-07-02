//
//  UIView+Animation.m
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UIView+Animation.h"
@interface DYViewAction ()
@property (nonatomic) DYViewActionBlock block;
@property (nonatomic) UIViewAnimationOptions options;
@property (nonatomic, readwrite) NSTimeInterval duration;
- (void)dy_runWithCompletion:(DYViewActionCompletion)completion;
@end
@interface DYViewActionGroup: DYViewAction
@property (nonatomic, strong) NSArray<DYViewAction *> *actions;
@end
@interface DYViewWaitAction : DYViewAction
@end
@interface DYViewActionSequence ()
@property (strong, nonatomic) NSMutableArray<DYViewAction *> *actions;
@end
@interface DYViewSpringAction: DYViewAction
@property (nonatomic) CGFloat damping, initialVelocity;
@end
@implementation UIView (Animation)
+ (void)dy_runAction:(DYViewAction *)action {
    [self dy_runAction:action completion:nil];
}
+ (void)dy_runAction:(DYViewAction *)action completion:(DYViewActionCompletion)completion {
    [action dy_runWithCompletion:completion];
}
/***************************************************************************************************************************************/
- (void)shake {
    [self shake:10 withDelta:5 speed:0.03];
}

- (void)shake:(int)times withDelta:(CGFloat)delta {
    [self shake:times withDelta:delta completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta completion:(nullable void (^)(void))handler {
    [self shake:times withDelta:delta speed:0.03 completion:handler];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self shake:times withDelta:delta speed:interval completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(nullable void (^)(void))handler {
    [self shake:times withDelta:delta speed:interval shakeDirection:DYShakeDirectionHorizontal completion:handler];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DYShakeDirection)shakeDirection {
    [self shake:times withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DYShakeDirection)shakeDirection completion:(nullable void (^)(void))completion {
    [self _shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:completion];
}

- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DYShakeDirection)shakeDirection completion:(void (^)(void))completionHandler {
    [UIView animateWithDuration:interval animations:^{
        switch (shakeDirection) {
            case DYShakeDirectionVertical:
                self.layer.affineTransform = CGAffineTransformMakeTranslation(0, delta * direction);
                break;
            case DYShakeDirectionRotation:
                self.layer.affineTransform = CGAffineTransformMakeRotation(M_PI * delta / 1000.0f * direction);
                break;
            case DYShakeDirectionHorizontal:
                self.layer.affineTransform = CGAffineTransformMakeTranslation(delta * direction, 0);
            default:
                break;
        }
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _shake:(times - 1)
               direction:direction * -1
            currentTimes:current + 1
               withDelta:delta
                   speed:interval
          shakeDirection:shakeDirection
              completion:completionHandler];
    }];
}
@end
#pragma mark- DYViewAction implementation


@implementation DYViewAction
+ (DYViewAction *)action:(DYViewActionBlock)action withDuration:(NSTimeInterval)duration {
    return [self action:action withOptions:kNilOptions duration:duration];
}
+ (DYViewAction *)action:(DYViewActionBlock)action withOptions:(UIViewAnimationOptions)options duration:(NSTimeInterval)duration {
    return [[DYViewAction alloc] initWithBlock:action options:options duration:duration];
}
+ (DYViewAction *)springAction:(DYViewActionBlock)action withDamping:(CGFloat)dampingRatio initialVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options duration:(NSTimeInterval)duration {
    DYViewSpringAction *springAction = [[DYViewSpringAction alloc] initWithBlock:action options:options duration:duration];
    springAction.damping = dampingRatio;
    springAction.initialVelocity = velocity;
    return springAction;
}
+ (DYViewAction *)waitForDuration:(NSTimeInterval)duration {
    NSAssert(duration >= 0, @"%@ wait duration must be non-negative", NSStringFromClass([DYViewAction class]));
    DYViewAction *waitAction = [[DYViewWaitAction alloc] init];
    waitAction.duration = duration;
    return waitAction;
}
+ (DYViewActionSequence *)sequence:(NSArray<DYViewAction *> *)sequence {
    DYViewActionSequence *actionSeq  = [[DYViewActionSequence alloc] init];
    actionSeq.actions = sequence.mutableCopy;
    return actionSeq;
}
+ (DYViewAction *)group:(NSArray<DYViewAction *> *)actions {
    DYViewActionGroup *group = [[DYViewActionGroup alloc] init];
    group.actions = actions;
    return group;
}
#pragma mark- Private
#pragma mark- DYViewAction Contructor
- (instancetype)initWithBlock:(DYViewActionBlock)block options:(UIViewAnimationOptions)options duration:(NSTimeInterval)duration {
    NSCParameterAssert(block);
    if (self = [super init]) {
        _block = block;
        _options = options;
        _duration = duration;
    }
    return self;
}
- (void)dy_runWithCompletion:(DYViewActionCompletion)completion {
    [UIView animateWithDuration:self.duration delay:0.0 options:self.options animations:self.block completion:completion];
}

@end
#pragma mark- DYSpringAction implementation

@implementation DYViewSpringAction

- (void)dy_runWithCompletion:(DYViewActionCompletion)completion {
    if (!completion) {
        if (self.duration > 0.0) {
            [self performSelector:@selector(dy_finishedWithCompletion:) withObject:completion afterDelay:self.duration inModes:@[NSRunLoopCommonModes]];
        }
        else {
            [self dy_finishedWithCompletion:completion];
        }
    }
}
- (void)dy_finishedWithCompletion:(DYViewActionCompletion)completion {
    completion(YES);
}
@end
#pragma mark- DYViewActionSequence implementation

@implementation DYViewActionSequence

- (void)setActions:(NSMutableArray<DYViewAction *> *)actions {
    _actions = actions;
    self.duration = [[actions valueForKeyPath:@"@sum.duration"] doubleValue];
    
}
- (void)appendAction:(DYViewAction *)action {
    [self.actions addObject:action];
    self.duration += action.duration;
}
- (void)dy_runWithCompletion:(DYViewActionCompletion)completion {
}
- (void)dy_runActionAtIndex:(NSInteger)index withCompletion:(DYViewActionCompletion)completion {
    if (index < self.actions.count) {
        [self.actions[index] dy_runWithCompletion:^(BOOL finished) {
            if (self.isCanceled) {
                if (completion) {
                    completion(NO);
                }
            }
            else {
                [self dy_runActionAtIndex:index+1 withCompletion:completion];
            }
        }];
    }
    else if(completion) {
        completion(YES);
    }
}
- (void)cancel {
    _canceled = YES;
}
@end
#pragma mark- DYViewActionGroup

@implementation DYViewActionGroup

- (void)setActions:(NSArray *)actions {
    _actions = [actions copy];
    self.duration = [[actions valueForKeyPath:@"@max.duration"] doubleValue];
    
}
- (void)dy_runWithCompletion:(DYViewActionCompletion)completion {
    dispatch_group_t actionGroup = dispatch_group_create();
    [self.actions enumerateObjectsUsingBlock:^(DYViewAction * _Nonnull action, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(actionGroup);
        [action dy_runWithCompletion:^(BOOL finished) {
            dispatch_group_leave(actionGroup);
        }];
    }];
    if (completion) {
        dispatch_group_notify(actionGroup, dispatch_get_main_queue(), ^{
            completion(YES);
        });
    }
}

@end

#pragma mark- DYViewWaitAction

@implementation DYViewWaitAction

- (void)dy_runWithCompletion:(DYViewActionCompletion)completion {
    if (completion) {
        if (self.duration > 0.0) {
            [self performSelector:@selector(dy_finishedWithCompletion:) withObject:completion afterDelay:self.duration inModes:@[NSRunLoopCommonModes]];
        }
        else {
            [self dy_finishedWithCompletion:completion];
        }
    }
}
- (void)dy_finishedWithCompletion:(DYViewActionCompletion)completion {
    completion(YES);
}
@end

