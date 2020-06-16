//
//  YJHomeViewController.m
//  Reader
//
//  Created by Yang on 2020/6/9.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJHomeViewController.h"
#import "YJSearchController.h"
#import "YJCarouseView.h"


@interface YJHomeViewController () 
@property (nonatomic, strong) YJSearchController *searchVC;
@property (nonatomic, strong) YJCarouseView * carouseView;

@end

@implementation YJHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    //导航条搜索框
    self.searchVC = [[YJSearchController alloc] initSearchControllerWithResultView:self.view];
    self.navigationItem.titleView = _searchVC.searchBar;
    
    NSArray *imageArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"carouseViewList" ofType:@".plist"]];
    self.carouseView = [[YJCarouseView alloc] initWithFrame:CGRectMake(0, YJNavBarHeight + 20, self.view.frame.size.width, 200) imageArr:imageArr];
    [self.view addSubview:_carouseView];
    
}



@end
