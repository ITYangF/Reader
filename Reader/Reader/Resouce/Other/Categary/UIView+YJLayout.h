//
//  UIView+YJLayout.h
//  Reader
//
//  Created by Yang on 2020/6/11.
//  Copyright © 2020 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YJLayout)
//顶,底,左,右
@property (nonatomic , assign)CGFloat top;
@property (nonatomic , assign)CGFloat bottom;
@property (nonatomic , assign)CGFloat left;
@property (nonatomic , assign)CGFloat right;

//坐标,x,y
@property (nonatomic , assign)CGFloat x;
@property (nonatomic , assign)CGFloat y;
@property (nonatomic , assign)CGPoint origin;

//中心点坐标 centerX,centerY
@property (nonatomic , assign)CGFloat centerX;
@property (nonatomic , assign)CGFloat centerY;


//大小 ,宽,高
@property (nonatomic , assign)CGFloat width;
@property (nonatomic , assign)CGFloat height;
@property (nonatomic , assign)CGSize size;
@end

NS_ASSUME_NONNULL_END
