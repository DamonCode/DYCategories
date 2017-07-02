//
//  UIApplication+Sanbox.h
//  DYCategories
//
//  Created by Damon on 02/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIApplication (Sanbox)
- (NSURL *)documentURL;
- (NSString *)documentPath;

- (NSURL *)libraryURL;
- (NSString *)libraryPath;

- (NSURL *)cachesURL;
- (NSString *)cachesPath;


@end
NS_ASSUME_NONNULL_END
