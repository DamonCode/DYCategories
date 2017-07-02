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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    [v addBorderWithWidth:5 borderColor:[UIColor greenColor] borderStyle:UIViewBorderSidesTop | UIViewBorderSidesLeft];
    
    [self.view makeToast:@"test" duration:1 position:DYToastPositionCenter];
    [self.view logSuperHierarchy];
    [self.view logSubHierarchy];
    [self.view debugLogHierarchy];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [v shake];

    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
