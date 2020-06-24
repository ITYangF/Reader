//
//  YJReadViewController.m
//  Reader
//
//  Created by Yang on 2020/6/20.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJReadViewController.h"
#import "UIBarButtonItem+YJBarButtonItem.h"
#import "YJReaderPopView.h"

@interface YJReadViewController ()
@property (nonatomic, assign) BOOL statusBarHidden;
@end

@implementation YJReadViewController

- (BOOL)prefersStatusBarHidden{
    return self.statusBarHidden;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hiddenNavBarAndTabbar];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self hiddenNavBarAndTabbar];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

-(void)hiddenNavBarAndTabbar{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)isHiddenStatusBar{
    _statusBarHidden = !_statusBarHidden;
    [self setNeedsStatusBarAppearanceUpdate];
    [self.navigationController setNavigationBarHidden:_statusBarHidden animated:YES];
}

-(void)hiddenNavBar{
    [self isHiddenStatusBar];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _statusBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavBar];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self isHiddenStatusBar];
    [YJReaderPopView readerPopViewWithController:self];
}
-(void)setUpNavBar{
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *backbtn = [UIBarButtonItem btnWithImageName:@"readback" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backbtn;
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:NULL action:NULL];
    spaceItem.width = 15;
    
    UIBarButtonItem *menuBtn = [UIBarButtonItem btnWithImageName:@"channelMoreWhite" target:self action:@selector(run)];
    UIBarButtonItem *erjiBtn = [UIBarButtonItem btnWithImageName:@"icon_category_erji" target:self action:@selector(run)];
    UIBarButtonItem *giftBtn = [UIBarButtonItem btnWithImageName:@"read_top_gift" target:self action:@selector(run)];
    
//    UIBarButtonItem *goumaiBtn = [UIBarButtonItem btnWithTitle:@"购买" target:self action:@selector(run)];

    self.navigationItem.rightBarButtonItems = @[menuBtn, erjiBtn, spaceItem, giftBtn, spaceItem];
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)run{
    NSLog(@"%s", __func__);
}

@end
