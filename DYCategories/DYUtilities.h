//
//  DYUtilities.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
NS_ASSUME_NONNULL_BEGIN
CGFloat DYScreenScale();
CGSize DYScreenSize();
static inline CGFloat DegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}
static CGFloat RadiansToDegress(CGFloat radians) {
    return radians * 180/M_PI;
}
NS_ASSUME_NONNULL_END
