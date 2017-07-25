//
//  NSString+Regex.h
//  DYCategories
//
//  Created by Damon on 20/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MatchingCase) {
    MatchingCaseFailed = 0,
    MatchingCaseSuccess,
};

NS_ASSUME_NONNULL_BEGIN
@interface NSString (Regex)
- (MatchingCase)matchWithRegex:(NSString *)regex;
- (MatchingCase)dy_isMobilePhone;
- (MatchingCase)dy_isTelephone;
- (MatchingCase)dy_isEmail;
- (MatchingCase)dy_isIdentityCard;
@end
NS_ASSUME_NONNULL_END
