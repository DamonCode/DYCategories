//
//  NSString+Encrypt.h
//  DYCategories
//
//  Created by Damon on 25/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)
- (NSString *)dy_toMD5; // 32bit
- (NSString *)dy_to16MD5; // 16bit
- (NSString *)dy_sha1;
- (NSString *)dy_sha256;
- (NSString *)dy_sha512;


@end
