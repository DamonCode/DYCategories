//
//  NSDictionary+DYAdditions.h
//  DYCategories
//
//  Created by Damon on 08/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSDictionary (DYAdditions)
+ (nullable NSDictionary *)dictionaryWithPlistData:(NSData *)plist;
+ (nullable NSDictionary *)dictionaryWithPlistString:(NSString *)plist;
- (nullable NSData *)plistData;
- (nullable NSString *)plistString;
- (BOOL)containsObjectForKey:(id)key;

NS_ASSUME_NONNULL_END
@end
