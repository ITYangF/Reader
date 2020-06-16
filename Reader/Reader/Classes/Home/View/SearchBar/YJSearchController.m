//
//  YJSearchController.m
//  Reader
//
//  Created by Yang on 2020/6/16.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJSearchController.h"
#import "YJResultTableView.h"

@interface YJSearchController () <UISearchBarDelegate>
@property (nonatomic, strong)  YJResultTableView* tabbleView;
@property (nonatomic, weak) UIView * homeView;
@end

@implementation YJSearchController


/*
 UILabel *label = [[UILabel alloc]init];
 label.text = @"这是一个inputAccessoryView";
 label.textAlignment = NSTextAlignmentCenter;
 label.textColor = [UIColor blackColor];
 
 label.frame = CGRectMake(0, 0, 0, 30);
 label.backgroundColor = [UIColor redColor];
 self.searchBar.inputAccessoryView = label;
 */

- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController{
    self = [super initWithSearchResultsController:searchResultsController];
    if (self) {
        //展示结果的tableview
        self.tabbleView = [[YJResultTableView alloc] initWithFrame:CGRectMake(0, YJNavBarHeight, self.view.frame.size.width, self.view.frame.size.height - YJNavBarHeight) style:UITableViewStylePlain];
        [self.homeView addSubview:_tabbleView];
        //隐藏tableView
        _tabbleView.hidden = YES;
        
        //不使用遮照视图
        self.hidesNavigationBarDuringPresentation = NO;
        //结果展示视图
        self.searchResultsUpdater = _tabbleView;
        //不隐藏导航条
        self.dimsBackgroundDuringPresentation = NO;
        
        self.searchBar.placeholder = @"请输入书籍名称";
        
        //显示书籍图片
        self.searchBar.showsBookmarkButton = YES;
        
        [self.searchBar setImage:[UIImage imageNamed:@"find"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        self.searchBar.delegate = self;
    }
    return self;
}

-(instancetype)initSearchControllerWithResultView:(UIView *)homeView{
    self.homeView = homeView;
    return [self initWithSearchResultsController:nil];
}



- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    _tabbleView.hidden = NO;
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // 由于其子控件是懒加载模式, 所以找之前先将其显示
    [searchBar setShowsCancelButton:YES animated:YES];
    for (UIView *subview in searchBar.subviews) {
        
        for (UIView *tempView in subview.subviews) {
            // 找到cancelButton
            if ([tempView isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
                // 在这里转化为UIButton, 设置其属性
                UIButton *btn = (UIButton*)tempView;
                [btn setTitle:@"取消" forState:UIControlStateNormal];
            }
        }
    }
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    _tabbleView.hidden = YES;
}

@end
