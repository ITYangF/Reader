//
//  YJPreNextView.m
//  Reader
//
//  Created by Yang on 2020/6/25.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJPreNextView.h"

@interface YJPreNextView ()
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIView *middleView;
@property (nonatomic, strong)UIView *bottomView;
@end

static CGFloat preNextViewMargin = 15;
static CGFloat preNextViewSpace = 20;
@implementation YJPreNextView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTopView];
        [self setMiddleView];
        [self setBottomView];
    }
    return self;
}


-(void)setBtn:(UIButton *)btn withtitle:(NSString *)title{
    [btn setTintColor:[UIColor whiteColor]];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)btnDidClicked:(UIButton *)btn{
    NSLog(@"%s", __func__);
}


-(void)setTopView{
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YJScreenWidth, 40)];
//    _topView.backgroundColor = [UIColor redColor];
    [self addSubview:_topView];
    
    
//    UIButton *preBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UISlider *slider = [[UISlider alloc] init];
//    [_topView addSubview:preBtn];
//    [_topView addSubview:nextBtn];
//    [_topView addSubview:slider];
//
//    [self setBtn:preBtn withtitle:@"上一章"];
//    [self setBtn:nextBtn withtitle:@"下一章"];
//    slider.value = 0.0;
//    slider.tintColor = [UIColor redColor];
//
//    CGFloat width = self.frame.size.width / 3;
//
//    preBtn.frame = CGRectMake(preNextViewMargin, 10, width, self.frame.size.height);
//    slider.frame = CGRectMake(CGRectGetMaxX(preBtn.frame) + preNextViewMargin, 10, width, 40);
//    nextBtn.frame = CGRectMake(CGRectGetMaxX(slider.frame) + preNextViewMargin, 10, width, 40);
    
    
            
}

-(void)setMiddleView{
    _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), YJScreenWidth, 2)];
    _middleView.backgroundColor = [UIColor greenColor];
    [self addSubview:_middleView];
}

-(void)setBottomView{
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_middleView.frame), YJScreenWidth, 60)];
    _bottomView.backgroundColor = [UIColor blueColor];
    [self addSubview:_bottomView];
}
@end
