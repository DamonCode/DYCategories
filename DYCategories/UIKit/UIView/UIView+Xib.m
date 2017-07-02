//
//  UIView+Xib.m
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "UIView+Xib.h"

@implementation UIView (Xib)

+ (UINib *)loadNib {
    return [self loadNibWithNibName:NSStringFromClass([self class])];
}
+ (UINib *)loadNibWithNibName:(NSString *)name {
    return [UINib nibWithNibName:name bundle:[NSBundle mainBundle]];
}
+ (instancetype)initFromNib {
    return [self initFromNibWithNibName:NSStringFromClass([self class])];
}
+ (instancetype)initFromNibWithNibName:(NSString *)name {
    return [self initFromNibWithNibName:name owner:nil];
}
+ (instancetype)initFromNibWithNibName:(NSString *)name owner:(id)owner {
    return [self initFromNibWithNibName:name owner:owner bundle:[NSBundle mainBundle]];
}
+ (instancetype)initFromNibWithNibName:(NSString *)name owner:(id)owner
                                bundle:(NSBundle *)bundle {
    NSArray *elements = [bundle loadNibNamed:name owner:owner options:nil];
    for (id obj in elements) {
        if ([obj isKindOfClass:[self class]]) {
            return obj;
            break;
        }
    }
    return nil;
}
@end
