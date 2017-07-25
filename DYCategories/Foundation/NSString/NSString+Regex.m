//
//  NSString+Regex.m
//  DYCategories
//
//  Created by Damon on 20/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)
- (MatchingCase)matchWithRegex:(NSString *)regex {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
@end
