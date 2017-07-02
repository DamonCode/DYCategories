//
//  UIView+Frame.h
//  DYCategories
//
//  Created by Damon on 30/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (Frame)
@property (nonatomic) CGFloat dy_left;
@property (nonatomic) CGFloat dy_right;
@property (nonatomic) CGFloat dy_top;
@property (nonatomic) CGFloat dy_bottom;
@property (nonatomic) CGFloat dy_width;
@property (nonatomic) CGFloat dy_height;
@property (nonatomic) CGFloat dy_centerX;
@property (nonatomic) CGFloat dy_centerY;
@property (nonatomic) CGPoint dy_origin;
@property (nonatomic) CGSize  dy_size;
NS_ASSUME_NONNULL_END

@end
