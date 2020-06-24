//
//  YJReaderPopView.m
//  Reader
//
//  Created by Yang on 2020/6/25.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJReaderPopView.h"
#import "YJReadViewController.h"
#import "YJPreNextView.h"

@interface YJReaderPopView ()

@property (nonatomic, strong)  YJReadViewController* readerVC;

@end



@implementation YJReaderPopView

UIView *bgReaderView;
YJReaderPopView *settingView;
CGFloat popViewHeight;
CGFloat popViewWidth = 102;
+(void)readerPopViewWithController:(YJReadViewController *)viewController{
    UIWindow *win = [[[UIApplication sharedApplication] windows] firstObject];
    
    
    bgReaderView = [[UIView alloc] initWithFrame:CGRectMake(0, YJNavBarHeight, YJScreenWidth, YJScreenHeight - YJNavBarHeight)];
    [win addSubview:bgReaderView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundClick)];
    [bgReaderView addGestureRecognizer:tap];
    
    popViewHeight = YJIsIphoneX ? (popViewWidth + YJTabBarHeight) : popViewWidth;
    settingView = [[YJReaderPopView alloc] initWithFrame:CGRectMake(0, YJScreenHeight, YJScreenWidth, popViewHeight)];
    settingView.readerVC = viewController;
    [win addSubview:settingView];
    settingView.backgroundColor = UIColorFromHex(0x595959);
    
    [self show];
    
}

+(void)show{
    [UIView animateWithDuration:0.3 animations:^{
        settingView.frame = CGRectMake(0, YJScreenHeight - popViewHeight, YJScreenWidth, popViewHeight);
    }];
}

+(void)removePopView{
    [UIView animateWithDuration:0.3 animations:^{
        settingView.frame = CGRectMake(0, YJScreenHeight, YJScreenWidth, popViewHeight);
    } completion:^(BOOL finished) {
        [bgReaderView removeFromSuperview];
        [settingView removeFromSuperview];
        bgReaderView = nil;
        settingView = nil;
    }];
    [settingView.readerVC hiddenNavBar];
}


+(void)tapBackgroundClick{
    [self removePopView];
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        YJPreNextView * preNextView = [[YJPreNextView alloc] initWithFrame:CGRectMake(0, 0, YJScreenWidth, 40)];
        [self addSubview:preNextView];
    }
    return self;
}


+(void)bottomView{
    
}


@end
