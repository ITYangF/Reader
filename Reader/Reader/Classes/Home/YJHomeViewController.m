//
//  YJHomeViewController.m
//  Reader
//
//  Created by Yang on 2020/6/9.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJHomeViewController.h"
#import "YJSearchController.h"


@interface YJHomeViewController () 
@property (nonatomic, strong) YJSearchController *searchVC;

@end

@implementation YJHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    //导航条搜索框
    self.searchVC = [[YJSearchController alloc] initSearchControllerWithResultView:self.view];
    self.navigationItem.titleView = _searchVC.searchBar;
}





@end
