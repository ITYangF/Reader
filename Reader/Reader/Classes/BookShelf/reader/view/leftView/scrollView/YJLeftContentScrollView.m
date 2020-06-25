//
//  YJLeftContentScrollView.m
//  Reader
//
//  Created by Yang on 2020/6/26.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJLeftContentScrollView.h"
#import "YJListTableView.h"

@implementation YJLeftContentScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = CGSizeMake(self.frame.size.width * 3, self.frame.size.height);
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.scrollEnabled = NO;
        self.bounces = NO;
        [self addTableViews];
    }
    return self;
}

-(void)addTableViews{
    for (int i = 0; i < 3; i++) {
        YJListTableView *tableView = [[YJListTableView alloc] initWithFrame:CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        tableView.backgroundColor = YJRandomColor;
        [self addSubview:tableView];
    }
}

- (void)hasBtnDidClick:(NSInteger)index {
    [self setContentOffset:CGPointMake(self.frame.size.width * index, 0) animated:NO];
}

@end
