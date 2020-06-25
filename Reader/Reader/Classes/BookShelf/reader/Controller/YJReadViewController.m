//
//  YJReadViewController.m
//  Reader
//
//  Created by Yang on 2020/6/20.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJReadViewController.h"
#import "YJMainViewController.h"
#import "YJLeftViewController.h"
#import "UIBarButtonItem+YJBarButtonItem.h"
#import "YJReaderEasyPopView.h"

#define leftSlideWidth (YJScreenWidth - 50)

@interface YJReadViewController ()
@property (nonatomic, strong) YJMainViewController * mainVC;
@property (nonatomic, strong) YJLeftViewController * leftVC;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@end

@implementation YJReadViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mainVC = [[YJMainViewController alloc] init];
        self.leftVC = [[YJLeftViewController alloc] init];
        
        [self addChildViewController:self.leftVC];
        [self addChildViewController:self.mainVC];
        
        [self.view addSubview:self.leftVC.view];
        [self.view addSubview:self.mainVC.view];
        
        self.leftVC.view.frame = self.view.bounds;
        self.mainVC.view.frame = self.view.bounds;
        
        _coverView = [[UIView alloc] initWithFrame:self.view.bounds];
        _coverView.backgroundColor = UIColor.blackColor;
        _coverView.alpha = 0;
        _coverView.hidden = YES;
        
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideLeftVc)];
        [_coverView addGestureRecognizer:_tapGesture];
        [self.mainVC.view addSubview:_coverView];
    }
    return self;
}

-(void)hideLeftVc{
    self.coverView.hidden = YES;
    self.coverView.alpha = 0.0;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame = self.mainVC.view.frame;
        frame.origin.x = 0;
        self.mainVC.view.frame = frame;
    } completion:^(BOOL finished) {
    }];
}
-(void)showLeftVc{
    _coverView.hidden = NO;
    [_mainVC.view bringSubviewToFront:_coverView];
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame = self.mainVC.view.frame;
        frame.origin.x = leftSlideWidth;
        self.mainVC.view.frame = frame;
        self.coverView.alpha = 0.3f;
    } completion:^(BOOL finished) {
    }];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showLeftVc) name:Notification_showLeftVc object:nil];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setUpNavBar];
    
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

    self.navigationItem.rightBarButtonItems = @[menuBtn, erjiBtn, spaceItem, giftBtn, spaceItem];
}
- (void)back{
    [YJReaderEasyPopView removeEasyPopViewWithAnimation:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)run{
    NSLog(@"%s", __func__);
}

@end
