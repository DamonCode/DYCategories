//
//  UIView+Xib.h
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (Xib)
+ (UINib *)loadNib;
+ (UINib *)loadNibWithNibName:(NSString *)name;
+ (instancetype)initFromNib;
+ (instancetype)initFromNibWithNibName:(NSString *)name;
+ (instancetype)initFromNibWithNibName:(NSString *)name owner:(nullable id)owner;
+ (instancetype)initFromNibWithNibName:(NSString *)name owner:(nullable id)owner bundle:(NSBundle *)bundle;
@end
NS_ASSUME_NONNULL_END
