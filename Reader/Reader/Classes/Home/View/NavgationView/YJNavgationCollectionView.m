//
//  YJNavgationCollectionView.m
//  Reader
//
//  Created by Yang on 2020/6/16.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJNavgationCollectionView.h"
#import "YJNavgationCell.h"



@interface YJNavgationCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, weak) UIView *parentView;
@end

static NSString * navCell = @"navgationCell";
static CGFloat margin = 10;
@implementation YJNavgationCollectionView
- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navgationList" ofType:@".plist"]];
    }
    return _dataArr;;
}

-(instancetype)initWithFrame:(CGRect)frame parentView:(UIView *)parentView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemW = (YJScreenWidth - 4 * margin) / 3;
    CGFloat itemH = (frame.size.height - 3 * margin) / 2;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.parentView = parentView;
        self.dataSource = self;
        self.delegate = self;
        self.contentInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        self.backgroundColor = [UIColor whiteColor];
        
        [self registerNib:[UINib nibWithNibName:@"YJNavgationCell" bundle:nil] forCellWithReuseIdentifier:navCell];
    }
    return self;
}




- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    YJNavgationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:navCell forIndexPath:indexPath];
    cell.dict = _dataArr[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"111");
}

@end
