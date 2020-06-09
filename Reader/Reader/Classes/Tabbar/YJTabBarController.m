//
//  YJTabBarController.m
//  Reader
//
//  Created by Yang on 2020/6/9.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJTabBarController.h"
#import <Foundation/Foundation.h>
#import "YJHomeViewController.h"
#import "YJShelfViewController.h"
#import "YJAnalysisViewController.h"
#import "YJProfileViewController.h"

@interface YJTabBarController ()

@end

@implementation YJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBarControllerConfiguration];
}

#pragma mark - 配置控制器
-(void)setTabBarControllerConfiguration{
}

#pragma mark - 初始化子控制器
-(void)setChild:(UIViewController *)childVC WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
}
@end
