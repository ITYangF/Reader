//
//  YJLeftViewController.m
//  Reader
//
//  Created by Yang on 2020/6/25.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJLeftViewController.h"
#import "YJLeftTopView.h"
#import "YJLeftContentScrollView.h"
#import "YJTagNavView.h"


@interface YJLeftViewController ()

@end

@implementation YJLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view .backgroundColor = [UIColor whiteColor];
    
    //topScrollView
    NSArray *titles = @[@"目录", @"想法", @"书签"];
    YJLeftTopView *leftTopScrollView = [[YJLeftTopView alloc] initWithFrame:CGRectMake(0, 0, YJScreenWidth - 50, YJNavBarHeight)  titles:titles];
    [self.view addSubview:leftTopScrollView];
    
    leftTopScrollView.backgroundColor = [UIColor whiteColor];
    
    //contentScrollView
    
    YJLeftContentScrollView *leftContentScrollView = [[YJLeftContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(leftTopScrollView.frame), YJScreenWidth - 50, YJScreenHeight - YJNavBarHeight)];
    [self.view addSubview:leftContentScrollView];
    leftContentScrollView.backgroundColor = [UIColor whiteColor];
    
    leftTopScrollView.delegate = leftContentScrollView;
}

@end
