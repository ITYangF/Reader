//
//  YJLeftViewController.m
//  Reader
//
//  Created by Yang on 2020/6/25.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJLeftViewController.h"
#import "YJLeftTopScrollView.h"
#import "YJLeftContentScrollView.h"

static CGFloat screenMarginX = 50;

@interface YJLeftViewController ()

@end

@implementation YJLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view .backgroundColor = [UIColor redColor];
    
    //topScrollView
    YJLeftTopScrollView *leftTopScrollView = [[YJLeftTopScrollView alloc] initWithFrame:CGRectMake(screenMarginX, 0, YJScreenWidth - screenMarginX, YJNavBarHeight)];
    [self.view addSubview:leftTopScrollView];
    
    leftTopScrollView.backgroundColor = [UIColor redColor];
    
    //contentScrollView
    YJLeftContentScrollView *leftContentScrollView = [[YJLeftContentScrollView alloc] initWithFrame:CGRectMake(screenMarginX, 0, YJScreenWidth - screenMarginX, YJNavBarHeight)];
    [self.view addSubview:leftContentScrollView];
    
    leftContentScrollView.backgroundColor = [UIColor greenColor];
}

@end
