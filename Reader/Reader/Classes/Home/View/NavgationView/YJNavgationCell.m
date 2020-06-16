//
//  YJNavgationCell.m
//  Reader
//
//  Created by Yang on 2020/6/16.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJNavgationCell.h"

@interface YJNavgationCell ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YJNavgationCell
-(void)setDict:(NSDictionary *)dict{
    _dict = dict;
    _imageView.image = [UIImage imageNamed:dict[@"imageName"]];
    _label.text = dict[@"title"];
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

@end
