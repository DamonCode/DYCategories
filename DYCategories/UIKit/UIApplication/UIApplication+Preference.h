//
//  UIApplication+Preference.h
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIApplication (Preference)
- (NSString *)appBundleName;
- (NSString *)appBundleID;
- (NSString *)appVersion;
- (NSString *)appBuildVersion;
- (BOOL)isPirated;
- (BOOL)isBeingDebugged;
- (int64_t)memoryUsage;
- (float)cpuUsage;
+ (BOOL)isAppExtension;
+ (nullable UIApplication *)sharedExtensionApplication;
@end
NS_ASSUME_NONNULL_END
