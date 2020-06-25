//
//  YJMainViewController.m
//  Reader
//
//  Created by Yang on 2020/6/25.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJMainViewController.h"
#import "YJReaderEasyPopView.h"

@interface YJMainViewController ()
@property (nonatomic, assign) BOOL statusBarHidden;
@end

@implementation YJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _statusBarHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isHiddenStatusBar) name:Notification_removePopView object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(muluBtnClick) name:Notification_showLeftVc object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIBarStyleBlack;
    [self hiddenNavBarAndTabbar];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIBarStyleDefault;
    [self hiddenNavBarAndTabbar];
}

-(void)hiddenNavBarAndTabbar{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

///实现/隐藏状态栏
-(void)isHiddenStatusBar{
    _statusBarHidden = !_statusBarHidden;
    [UIApplication sharedApplication].statusBarHidden = _statusBarHidden;
    [self.navigationController setNavigationBarHidden:_statusBarHidden animated:YES];
}

-(void)muluBtnClick{
    [YJReaderEasyPopView removeEasyPopViewWithAnimation:NO];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self isHiddenStatusBar];
    [YJReaderEasyPopView readerEasyPopView];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
