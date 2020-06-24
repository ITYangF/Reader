//
//  YJPreNextView.m
//  Reader
//
//  Created by Yang on 2020/6/25.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJPreNextView.h"
#import "Masonry.h"

@interface YJPreNextView ()
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIImageView *middleView;
@property (nonatomic, strong)UIView *bottomView;
@end

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
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTintColor:[UIColor whiteColor]];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setBtn:(UIButton *)btn withimage:(NSString *)image{
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnDidClicked:(UIButton *)btn{
    NSLog(@"%s", __func__);
}


-(void)setTopView{
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YJScreenWidth, 40)];
    [self addSubview:_topView];

    UIButton *preBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setBtn:preBtn withtitle:@"上一章"];
    [_topView addSubview:preBtn];
    [preBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topView.mas_left);
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topView.mas_bottom);
        make.width.equalTo(_topView.mas_width).with.multipliedBy(0.2);
    }];
    
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setBtn:nextBtn withtitle:@"下一章"];
    [_topView addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_topView.mas_right);
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topView.mas_bottom);
        make.width.equalTo(_topView.mas_width).with.multipliedBy(0.2);
    }];
    
    
    
    UISlider *slider = [[UISlider alloc] init];
    [_topView addSubview:slider];
    slider.value = 0.0;
    slider.minimumTrackTintColor = [UIColor redColor];
    [slider setThumbImage:[UIImage imageNamed:@"progressSlider2"] forState:UIControlStateNormal];

    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(preBtn.mas_right);
        make.right.equalTo(nextBtn.mas_left);
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topView.mas_bottom);
    }];
    
    
            
}

-(void)setMiddleView{
    _middleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), YJScreenWidth, 2)];
    _middleView.image = [UIImage imageNamed:@"fenge"];
    [self addSubview:_middleView];
}

-(void)setBottomView{
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_middleView.frame), YJScreenWidth, 60)];
    [self addSubview:_bottomView];

    UIButton *muluBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setBtn:muluBtn withimage:@"目录"];
    [_bottomView addSubview:muluBtn];
    [muluBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomView.mas_left);
        make.top.equalTo(_middleView.mas_bottom);
        make.bottom.equalTo(_bottomView.mas_bottom);
        make.width.equalTo(_bottomView.mas_width).with.multipliedBy(0.15);
    }];

    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setBtn:moreBtn withtitle:@"Aa"];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [_bottomView addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.equalTo(_bottomView.mas_right);
       make.top.equalTo(_bottomView.mas_top);
       make.bottom.equalTo(_bottomView.mas_bottom);
       make.width.equalTo(_bottomView.mas_width).with.multipliedBy(0.15);
    }];
    
    UIButton *nigthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setBtn:nigthBtn withimage:@"night"];
    [_bottomView addSubview:nigthBtn];
    [nigthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bottomView.mas_centerX);
        make.centerY.equalTo(moreBtn.mas_centerY);
        make.width.equalTo(moreBtn.mas_width);
        make.height.equalTo(moreBtn.mas_height);
    }];
    
}
@end
