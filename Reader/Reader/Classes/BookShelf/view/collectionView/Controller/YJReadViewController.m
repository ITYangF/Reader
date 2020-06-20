//
//  YJReadViewController.m
//  Reader
//
//  Created by Yang on 2020/6/20.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJReadViewController.h"

@interface YJReadViewController ()

@end

@implementation YJReadViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view .backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.navigationController.navigationBar.hidden = !self.navigationController.navigationBar.hidden;
}
@end
