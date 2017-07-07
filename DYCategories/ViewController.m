//
//  ViewController.m
//  DYCategories
//
//  Created by Damon on 23/06/2017.
//  Copyright © 2017 fi.sh. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Borders.h"
#import "UIView+Toast.h"
#import "UIView+Hierarchy.h"
#import "UIView+Animation.h"
#import "UIButton+DYAdditions.h"
#import "UILabel+Additions.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testBtn;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.testLabel dy_setTextWithAutomaticWritingAnimation:@"damon YU"];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
