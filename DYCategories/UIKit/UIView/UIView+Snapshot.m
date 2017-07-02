//
//  UIView+Snapshot.m
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UIView+Snapshot.h"
#import "UIView+Frame.h"
@implementation UIView (Snapshot)
- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}
- (UIImage *)snapshotImageAfterScreenUpdate:(BOOL)afterUpdate {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdate];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}
- (UIImage *)snapshotImageWithWidth:(CGFloat)expectWidth {
    CGAffineTransform beforeTransform = self.transform;
    CGAffineTransform scaleTransform = CGAffineTransformIdentity;
    if (!isnan(expectWidth) && expectWidth > 0) {
        CGFloat maxScale = expectWidth / self.dy_width;
        CGAffineTransform transformScale = CGAffineTransformMakeScale(maxScale, maxScale);
        scaleTransform = CGAffineTransformConcat(beforeTransform, transformScale);
    }
    if (!CGAffineTransformEqualToTransform(scaleTransform, CGAffineTransformIdentity)) {
        self.transform = scaleTransform;
    }
    CGRect afterFrame = self.frame;
    CGRect afterBounds = self.bounds;
    
    UIGraphicsBeginImageContextWithOptions(afterFrame.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, afterFrame.size.width/2, afterFrame.size.height/2);
    CGContextConcatCTM(ctx, self.transform);
    CGPoint anchorPoint = self.layer.anchorPoint;
    CGContextTranslateCTM(ctx, -afterBounds.size.width*anchorPoint.x, -afterBounds.size.height*anchorPoint.y);
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.transform = beforeTransform;
    return snapshot;
}
- (NSData *)snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData* data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}
@end
