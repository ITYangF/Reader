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
#import "YJNavgationCollectionView.h"


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
    
    //轮播
    NSArray *imageArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"carouseViewList" ofType:@".plist"]];
    self.carouseView = [[YJCarouseView alloc] initWithFrame:CGRectMake(0, YJNavBarHeight + 20, self.view.frame.size.width, 150) imageArr:imageArr];
    [self.view addSubview:_carouseView];
    
    
    //导航视图
    YJNavgationCollectionView *collectionView = [[YJNavgationCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_carouseView.frame) + 20, self.view.frame.size.width, 250) parentView:self.view];
    [self.view addSubview:collectionView];
    
}



@end
