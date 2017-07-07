//
//  NSData+DYAdditions.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSData (DYAdditions)
- (NSString *)md2String;


- (NSData *)md2Data;


- (NSString *)md4String;


- (NSData *)md4Data;


- (NSString *)md5String;


- (NSData *)md5Data;

- (NSString *)sha1String;


- (NSData *)sha1Data;


- (NSString *)sha224String;


- (NSData *)sha224Data;


- (NSString *)sha256String;


- (NSData *)sha256Data;

- (NSString *)sha384String;


- (NSData *)sha384Data;


- (NSString *)sha512String;


- (NSData *)sha512Data;


- (NSString *)hmacMD5StringWithKey:(NSString *)key;


- (NSData *)hmacMD5DataWithKey:(NSData *)key;


- (NSString *)hmacSHA1StringWithKey:(NSString *)key;


- (NSData *)hmacSHA1DataWithKey:(NSData *)key;


- (NSString *)hmacSHA224StringWithKey:(NSString *)key;


- (NSData *)hmacSHA224DataWithKey:(NSData *)key;

- (NSString *)hmacSHA256StringWithKey:(NSString *)key;


- (NSData *)hmacSHA256DataWithKey:(NSData *)key;


- (NSString *)hmacSHA384StringWithKey:(NSString *)key;


- (NSData *)hmacSHA384DataWithKey:(NSData *)key;


- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

- (NSData *)hmacSHA512DataWithKey:(NSData *)key;


#pragma mark - Encrypt and Decrypt
///=============================================================================
/// @name Encrypt and Decrypt
///=============================================================================



- (nullable NSData *)aes256EncryptWithKey:(NSData *)key iv:(nullable NSData *)iv;


- (nullable NSData *)aes256DecryptWithkey:(NSData *)key iv:(nullable NSData *)iv;


#pragma mark - Encode and decode

- (nullable NSString *)utf8String;


- (nullable NSString *)hexString;



+ (nullable NSData *)dataWithHexString:(NSString *)hexString;

- (nullable NSString *)base64EncodedString;


+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;


- (nullable id)jsonValueDecoded;





#pragma mark - Others


+ (nullable NSData *)dataNamed:(NSString *)name;
@end
NS_ASSUME_NONNULL_END
