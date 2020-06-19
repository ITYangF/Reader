//
//  YJSearchController.h
//  Reader
//
//  Created by Yang on 2020/6/16.
//  Copyright © 2020 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJSearchController : UISearchController
-(instancetype)initSearchControllerWithResultView:(UIView *)homeView;
-(void)cancelSearchResultTableView;
@end

NS_ASSUME_NONNULL_END
