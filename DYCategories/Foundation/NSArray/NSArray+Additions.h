//
//  NSArray+Additions.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSArray (Additions)
+ (nullable NSMutableArray *)arrayWithPlistData:(NSData *)plist;
+ (nullable NSMutableArray *)arrayWithPlistString:(NSString *)plist;
- (nullable NSData *)plistData;
- (nullable NSString *)plistString;

@end
NS_ASSUME_NONNULL_END
