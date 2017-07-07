//
//  UIScrollView+DYAdditions.h
//  DYCategories
//
//  Created by Damon on 07/07/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (DYAdditions)

- (void)scrollToTop;
 
- (void)scrollToBottom;


- (void)scrollToLeft;

- (void)scrollToRight;


- (void)scrollToTopAnimated:(BOOL)animated;


- (void)scrollToBottomAnimated:(BOOL)animated;


- (void)scrollToLeftAnimated:(BOOL)animated;


- (void)scrollToRightAnimated:(BOOL)animated;
@end
NS_ASSUME_NONNULL_END
