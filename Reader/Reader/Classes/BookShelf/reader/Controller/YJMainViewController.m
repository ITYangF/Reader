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
    _statusBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNavBar) name:Notification_removePopView object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(muluBtnClick) name:Notification_showLeftVc object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hiddenNavBarAndTabbar];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
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

-(void)muluBtnClick{
    [self hiddenNavBarAndTabbar];
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
