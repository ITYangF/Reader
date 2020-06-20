//
//  YJShelfViewController.m
//  Reader
//
//  Created by Yang on 2020/6/9.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJShelfViewController.h"
#import "UIBarButtonItem+YJBarButtonItem.h"
#import "YJPulsView.h"
#import "YJNaviagtionController.h"
#import "YJShelfCollectionView.h"
#import "YJShelflItem.h"

@interface YJShelfViewController ()

@end

@implementation YJShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavigation];
    
    YJShelfCollectionView *collectionView = [[YJShelfCollectionView alloc] initCollectionViewWith:CGRectMake(0, YJNavBarHeight, YJScreenWidth, self.view.frame.size.height - YJNavBarHeight - YJTabBarHeight) dataArr:[self configurationDataArray] didSelected:^(NSString* name) {
        NSLog(@"%@", name);
    }];
    [self.view addSubview:collectionView];
}

-(void)setUpNavigation{
    self.title = @"我的书架";
    UIBarButtonItem *searchItem = [UIBarButtonItem btnWithImageName:@"search" target:self action:@selector(searchBtnDidClicked)];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:NULL action:NULL];
    spaceItem.width = 15;
    
    UIBarButtonItem *pulsItem = [UIBarButtonItem btnWithImageName:@"puls" target:self action:@selector(pulsBtnDidClicked)];
    
    self.navigationItem.rightBarButtonItems = @[spaceItem, pulsItem, spaceItem, searchItem];
}

-(NSArray *)configurationDataArray{
    NSArray * arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shelfCollectionViewList" ofType:@".plist"]];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        YJShelflItem * item = [[YJShelflItem alloc] initWithDict:dict];
        [temp addObject:item];
    }
    arr = temp;
    return arr;
}

-(void)searchBtnDidClicked
{
    NSLog(@"%s",__func__);

}
-(void)pulsBtnDidClicked
{
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pulsViewList" ofType:@".plist"]];
    [YJPulsView initWithFrame:CGRectMake(self.view.bounds.size.width - 100, YJNavBarHeight, 150, 200) datas:arr action:^(NSString * title) {
        NSLog(@"点击了---%@",title);
    }];
}
-(void)cancelPopView{
    [YJPulsView cancelPopView];
}
@end
