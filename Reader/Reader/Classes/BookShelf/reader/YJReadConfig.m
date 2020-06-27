//
//  YJReadConfig.m
//  textReader
//
//  Created by Yang on 2020/6/26.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJReadConfig.h"

@implementation YJReadConfig
+(instancetype)shareInstance
{
    static YJReadConfig *readConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        readConfig = [[self alloc] init];
    });
    return readConfig;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        //从磁盘中读取
//        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"ReadConfig"];
//        if (data) {
//            //如果磁盘中存在
//            NSKeyedUnarchiver *unarchive = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//            //取出赋值
//            YJReadConfig *config = [unarchive decodeObjectForKey:@"ReadConfig"];
//            
//            //监听属性变化
//            [config addObserver:config forKeyPath:@"fontSize" options:NSKeyValueObservingOptionNew context:NULL];
//            [config addObserver:config forKeyPath:@"lineSpace" options:NSKeyValueObservingOptionNew context:NULL];
//            [config addObserver:config forKeyPath:@"fontColor" options:NSKeyValueObservingOptionNew context:NULL];
//            [config addObserver:config forKeyPath:@"theme" options:NSKeyValueObservingOptionNew context:NULL];
//            return config;
//        }
        
        //不在磁盘中
        _lineSpace = 10.0f;
        _fontSize = 14.0f;
        _fontColor = [UIColor blackColor];
        _theme = [UIColor whiteColor];
//        [self addObserver:self forKeyPath:@"fontSize" options:NSKeyValueObservingOptionNew context:NULL];
//        [self addObserver:self forKeyPath:@"lineSpace" options:NSKeyValueObservingOptionNew context:NULL];
//        [self addObserver:self forKeyPath:@"fontColor" options:NSKeyValueObservingOptionNew context:NULL];
//        [self addObserver:self forKeyPath:@"theme" options:NSKeyValueObservingOptionNew context:NULL];
//         [YJReadConfig updateLocalConfig:self];
    }
    return self;
}
//
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    [YJReadConfig updateLocalConfig:self];
//}
//
//+(void)updateLocalConfig:(YJReadConfig *)config
//{
//    NSMutableData *data=[[NSMutableData alloc] init];
//    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    [archiver encodeObject:config forKey:@"ReadConfig"];
//    [archiver finishEncoding];
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"ReadConfig"];
//}
//
//-(void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeDouble:self.fontSize forKey:@"fontSize"];
//    [aCoder encodeDouble:self.lineSpace forKey:@"lineSpace"];
//    [aCoder encodeObject:self.fontColor forKey:@"fontColor"];
//    [aCoder encodeObject:self.theme forKey:@"theme"];
//}
@end
