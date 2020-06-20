//
//  YJShelfCollectionView.h
//  Reader
//
//  Created by Yang on 2020/6/20.
//  Copyright © 2020 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^cellDidClick)(NSString *);

@interface YJShelfCollectionView : UICollectionView
-(instancetype)initCollectionViewWith:(CGRect)frame
                               dataArr:(NSArray *)dataArr
                           didSelected:(cellDidClick)cell;
@end

NS_ASSUME_NONNULL_END
