//
//  UILabel+Additions.m
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UILabel+Additions.h"
#import <objc/runtime.h>


NSTimeInterval const UILabelAWDefaultDuration = 0.4f;

unichar const UILabelAWDefaultCharacter = 124;

static inline void dy_AutomaticWritingSwizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

static char kAutomaticWritingOperationQueueKey;
static char kAutomaticWritingEdgeInsetsKey;
@implementation UILabel (Additions)
@dynamic dy_automaticWritingOperationQueue, dy_edgeInsets;

- (CGSize)dy_suggestedSizeForWidth:(CGFloat)width {
    if (self.attributedText)
        return [self dy_suggestSizeForAttributedString:self.attributedText width:width];
    
    return [self dy_suggestSizeForString:self.text width:width];
}

- (CGSize)dy_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

- (CGSize)dy_suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [self dy_suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: self.font}] width:width];
}




+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dy_AutomaticWritingSwizzleSelector([self class], @selector(textRectForBounds:limitedToNumberOfLines:), @selector(dy_automaticWritingTextRectForBounds:limitedToNumberOfLines:));
        dy_AutomaticWritingSwizzleSelector([self class], @selector(drawTextInRect:), @selector(dy_drawAutomaticWritingTextInRect:));
    });
}

-(void)dy_drawAutomaticWritingTextInRect:(CGRect)rect
{
    [self dy_drawAutomaticWritingTextInRect:UIEdgeInsetsInsetRect(rect, self.dy_edgeInsets)];
}

- (CGRect)dy_automaticWritingTextRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [self dy_automaticWritingTextRectForBounds:UIEdgeInsetsInsetRect(bounds, self.dy_edgeInsets) limitedToNumberOfLines:numberOfLines];
    return textRect;
}

- (void)setDy_edgeInsets:(UIEdgeInsets)edgeInsets
{
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, [NSValue valueWithUIEdgeInsets:edgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)dy_edgeInsets
{
    NSValue *edgeInsetsValue = objc_getAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey);
    
    if (edgeInsetsValue)
    {
        return edgeInsetsValue.UIEdgeInsetsValue;
    }
    
    edgeInsetsValue = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
    
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, edgeInsetsValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return edgeInsetsValue.UIEdgeInsetsValue;
}

- (void)setDy_automaticWritingOperationQueue:(NSOperationQueue *)automaticWritingOperationQueue
{
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, automaticWritingOperationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSOperationQueue *)dy_automaticWritingOperationQueue
{
    NSOperationQueue *operationQueue = objc_getAssociatedObject(self, &kAutomaticWritingOperationQueueKey);
    
    if (operationQueue)
    {
        return operationQueue;
    }
    
    operationQueue = NSOperationQueue.new;
    operationQueue.name = @"Automatic Writing Operation Queue";
    operationQueue.maxConcurrentOperationCount = 1;
    
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, operationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return operationQueue;
}

- (void)dy_setTextWithAutomaticWritingAnimation:(NSString *)text
{
    [self dy_setText:text automaticWritingAnimationWithBlinkingMode:UILabelJKlinkingModeNone];
}

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelJKlinkingMode)blinkingMode
{
    [self dy_setText:text automaticWritingAnimationWithDuration:UILabelAWDefaultDuration blinkingMode:blinkingMode];
}

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
{
    [self dy_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:UILabelJKlinkingModeNone];
}

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode
{
    [self dy_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:UILabelAWDefaultCharacter];
}

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter
{
    [self dy_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:blinkingCharacter completion:nil];
}

- (void)dy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelJKlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(void (^)(void))completion
{
    self.dy_automaticWritingOperationQueue.suspended = YES;
    self.dy_automaticWritingOperationQueue = nil;
    
    self.text = @"";
    
    NSMutableString *automaticWritingText = NSMutableString.new;
    
    if (text)
    {
        [automaticWritingText appendString:text];
    }
    
    [self.dy_automaticWritingOperationQueue addOperationWithBlock:^{
        [self dy_automaticWriting:automaticWritingText duration:duration mode:blinkingMode character:blinkingCharacter completion:completion];
    }];
}

#pragma mark - Private Methods

- (void)dy_automaticWriting:(NSMutableString *)text duration:(NSTimeInterval)duration mode:(UILabelJKlinkingMode)mode character:(unichar)character completion:(void (^)(void))completion
{
    NSOperationQueue *currentQueue = NSOperationQueue.currentQueue;
    if ((text.length || mode >= UILabelJKlinkingModeWhenFinish) && !currentQueue.isSuspended)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (mode != UILabelJKlinkingModeNone)
            {
                if ([self dy_isLastCharacter:character])
                {
                    [self dy_deleteLastCharacter];
                }
                else if (mode != UILabelJKlinkingModeWhenFinish || !text.length)
                {
                    [text insertString:[self dy_stringWithCharacter:character] atIndex:0];
                }
            }
            
            if (text.length)
            {
                [self dy_appendCharacter:[text characterAtIndex:0]];
                [text deleteCharactersInRange:NSMakeRange(0, 1)];
                if ((![self dy_isLastCharacter:character] && mode == UILabelJKlinkingModeWhenFinishShowing) || (!text.length && mode == UILabelJKlinkingModeUntilFinishKeeping))
                {
                    [self dy_appendCharacter:character];
                }
            }
            
            if (!currentQueue.isSuspended)
            {
                [currentQueue addOperationWithBlock:^{
                    [self dy_automaticWriting:text duration:duration mode:mode character:character completion:completion];
                }];
            }
            else if (completion)
            {
                completion();
            }
        });
    }
    else if (completion)
    {
        completion();
    }
}

- (NSString *)dy_stringWithCharacter:(unichar)character
{
    return [self dy_stringWithCharacters:@[@(character)]];
}

- (NSString *)dy_stringWithCharacters:(NSArray *)characters
{
    NSMutableString *string = NSMutableString.new;
    
    for (NSNumber *character in characters)
    {
        [string appendFormat:@"%C", character.unsignedShortValue];
    }
    
    return string.copy;
}

- (void)dy_appendCharacter:(unichar)character
{
    [self dy_appendCharacters:@[@(character)]];
}

- (void)dy_appendCharacters:(NSArray *)characters
{
    self.text = [self.text stringByAppendingString:[self dy_stringWithCharacters:characters]];
}

- (BOOL)dy_isLastCharacters:(NSArray *)characters
{
    if (self.text.length >= characters.count)
    {
        return [self.text hasSuffix:[self dy_stringWithCharacters:characters]];
    }
    return NO;
}

- (BOOL)dy_isLastCharacter:(unichar)character
{
    return [self dy_isLastCharacters:@[@(character)]];
}

- (BOOL)dy_deleteLastCharacters:(NSUInteger)characters
{
    if (self.text.length >= characters)
    {
        self.text = [self.text substringToIndex:self.text.length-characters];
        return YES;
    }
    return NO;
}

- (BOOL)dy_deleteLastCharacter
{
    return [self dy_deleteLastCharacters:1];
}


@end
