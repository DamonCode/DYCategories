//
//  UIView+Snapshot.h
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (Snapshot)
- (nullable UIImage *)snapshotImage;
- (nullable UIImage *)snapshotImageAfterScreenUpdate:(BOOL)afterUpdate;
- (nullable UIImage *)snapshotImageWithWidth:(CGFloat)expectWidth;
- (nullable NSData *)snapshotPDF;
@end
NS_ASSUME_NONNULL_END
