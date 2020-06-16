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
@property (nonatomic, weak) UITextField * searchField;
@end

@implementation YJHomeViewController
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationItem.titleView.hidden = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.titleView.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航条搜索框
    //iOS 11 导航栏放置UISearchBar 导航栏高度变高解决办法 44 -> 56
    if (@available(iOS 11.0, *)) {
        [[_searchVC.searchBar.heightAnchor constraintEqualToConstant:44.0] setActive:YES];
        
    }
    self.searchVC = [[YJSearchController alloc] initSearchControllerWithResultView:self.view];
    self.navigationItem.titleView = _searchVC.searchBar;
    
    CGRect frame = _searchVC.searchBar.frame;
    _searchVC.searchBar.frame = CGRectMake(0, 0, frame.size.width, 44);
    //轮播
    NSArray *imageArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"carouseViewList" ofType:@".plist"]];
    self.carouseView = [[YJCarouseView alloc] initWithFrame:CGRectMake(0, YJNavBarHeight + 20, self.view.frame.size.width, 150) imageArr:imageArr];
    [self.view addSubview:_carouseView];
    
    
    //导航视图
    YJNavgationCollectionView *collectionView = [[YJNavgationCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_carouseView.frame) + 20, self.view.frame.size.width, 250) parentControlView:self];
    [self.view addSubview:collectionView];
    
}

-(void)adjustSearchBarHeight{
    CGFloat top = 8;
    CGFloat bottom = top;
    CGFloat left = 12;
    CGFloat right = left;
    UIEdgeInsets inset = UIEdgeInsetsMake(top, left, bottom, right);
    
    NSArray *subviewArr = _searchVC.searchBar.subviews;
    for(int i = 0; i < subviewArr.count ; i++) {
        UIView *viewSub = [subviewArr objectAtIndex:i];
        NSArray *arrSub = viewSub.subviews;
        for (int j = 0; j < arrSub.count ; j ++) {
            id tempId = [arrSub objectAtIndex:j];
            if([tempId isKindOfClass:[UITextField class]]) {
                _searchField = (UITextField *)tempId;
            }
        }
    }
    
    CGRect frame = _searchField.frame;
    CGFloat offsetX = frame.origin.x - inset.left;
    CGFloat offsetY = frame.origin.y - inset.top;
    frame.origin.x = inset.left;
    frame.origin.y = inset.top;
    frame.size.height += offsetY * 2;
    frame.size.width += offsetX * 2;
    _searchField.frame = frame;
}



@end
