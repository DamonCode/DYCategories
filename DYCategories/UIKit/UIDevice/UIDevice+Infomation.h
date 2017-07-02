//
//  UIDevice+Infomation.h
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, DYPasswordStatus) {
    DYPasswordStatusUnknown,
    DYPasswordStatusEnabled,
    DYPasswordStatusDisabled,
};
@interface UIDevice (Infomation)
+ (double)systemVersion;
- (BOOL)isiPad;
- (BOOL)isSimulator;
- (BOOL)isJailbroken;
- (BOOL)canDial;
- (NSString *)deviceModel;
- (NSString *)deviceName;
- (NSDate *)systemUptime;
- (NSString *)ipAddressWIFI;
- (NSString *)ipAddressCellular;
- (int64_t)diskSpace;
- (int64_t)diskSpaceFree;
- (int64_t)diskSpaceUsed;
- (int64_t)memoryTotal;
- (int64_t)memoryUsed;
- (int64_t)memoryFree;
- (int64_t)memoryActive;
- (int64_t)memoryInactive;
- (int64_t)memoryWired;
- (int64_t)memoryPurgable;
- (NSUInteger)cpuCount;
- (float)cpuUsage;
- (NSArray<NSNumber *> *)cpuUsagePerProcessor;
- (NSString *)UUID;
@end
NS_ASSUME_NONNULL_END
