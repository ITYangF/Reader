//
//  YJReadView.m
//  textReader
//
//  Created by Yang on 2020/6/27.
//  Copyright © 2020 Yang. All rights reserved.
//

#import "YJReadView.h"
#import "YJMagnifierView.h"
#import "YJCTFrameParser.h"


@interface YJReadView (){BOOL _direction;
    NSMutableArray *_pathArray;
    CGRect _menuRect;
    CGRect _rect;
    NSRange _selectRange;
}
@property (nonatomic,strong) YJMagnifierView *magnifierView;
@end

@implementation YJReadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _pathArray = [NSMutableArray array];
        [self addGestureRecognizer:({
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
            longPress;
        })];
        [self addGestureRecognizer:({
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
            tap;
        })];
        
    }
    return self;
}
-(void)tap{
    NSLog(@"%s", __func__);
    [self hiddenMenu];
    [_pathArray removeAllObjects];
    [self setNeedsDisplay];
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_showPopView object:nil];
}
-(void)showMagnifier
{
    if (!_magnifierView) {
        self.magnifierView = [[YJMagnifierView alloc] init];
        self.magnifierView.readView = self;
        [self addSubview:self.magnifierView];
    }
}
-(void)hiddenMagnifier
{
    if (_magnifierView) {
        [self.magnifierView removeFromSuperview];
        self.magnifierView = nil;
    }
}


-(void)showMenu
{
    if ([self becomeFirstResponder]) {
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *menuItemCopy = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(menuCopy:)];
        UIMenuItem *menuItemNote = [[UIMenuItem alloc] initWithTitle:@"笔记" action:@selector(menuNote:)];
        UIMenuItem *menuItemShare = [[UIMenuItem alloc] initWithTitle:@"分享" action:@selector(menuShare:)];
        NSArray *menus = @[menuItemShare,menuItemCopy,menuItemNote];
        [menuController setMenuItems:menus];
        [menuController setTargetRect:CGRectMake(CGRectGetMidX(_menuRect), self.frame.size.height-CGRectGetMidY(_menuRect), CGRectGetHeight(_menuRect), CGRectGetWidth(_menuRect)) inView:self];
        [menuController setMenuVisible:YES animated:YES];
    }
        
}
- (BOOL)canBecomeFirstResponder {
    return YES;
}
-(void)menuCopy:(id)sender{
    [self hiddenMenu];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:[_content substringWithRange: _selectRange]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功复制以下内容" message:pasteboard.string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)menuNote:(id)sender{
    [self hiddenMenu];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"笔记" message:[_content substringWithRange:_selectRange]  preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder = @"输入内容";
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancel];
    [alertController addAction:confirm];
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            [(UIViewController *)nextResponder presentViewController:alertController animated:YES completion:nil];
            break;
        }
    }
    
}
-(void)menuShare:(id)sender{
    [self hiddenMenu];
}
-(void)hiddenMenu
{
     [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}
-(void)longPress:(UILongPressGestureRecognizer *)longPress
{
    
    //获取自己视图上点击的位置
    CGPoint point = [longPress locationInView:self];
    
    if (longPress.state == UIGestureRecognizerStateBegan || longPress.state == UIGestureRecognizerStateChanged){
        _rect = [YJCTFrameParser parserRectWithPoint:point frameRef:_frameRef withSeletedRange:&_selectRange  withcontent:_content];
        [self showMagnifier];
        self.magnifierView.touchPoint = point;
        if (!CGRectEqualToRect(_rect, CGRectZero)) {
            [_pathArray addObject:NSStringFromCGRect(_rect)];
            [self setNeedsDisplay];
        }
    }
    if (longPress.state == UIGestureRecognizerStateEnded) {
        [self hiddenMagnifier];
        if (!CGRectEqualToRect(_menuRect, CGRectZero)) {
            [self showMenu];
        }
    }
    
}


-(void)drawSelectedPath:(NSArray *)array{
    if (array.count == 0) {
        return;
    }
    CGMutablePathRef _path = CGPathCreateMutable();
    [[UIColor cyanColor] setFill];
    for (int i = 0; i < [array count]; i++) {
        CGRect rect = CGRectFromString([array objectAtIndex:i]);
        CGPathAddRect(_path, NULL, rect);
        if (i == 0) {
            _menuRect = rect;
        }
    }
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddPath(ctx, _path);
    CGContextFillPath(ctx);
    CGPathRelease(_path);
}
-(void)drawRect:(CGRect)rect{
    if (!_frameRef) {
        return;
    }
    //改变坐标
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    _menuRect = CGRectZero;
    [self drawSelectedPath:_pathArray];
    CTFrameDraw(_frameRef, ctx);
}

-(void)dealloc{
    if (_frameRef) {
        CFRelease(_frameRef);
        _frameRef = nil;
    }
}
-(void)setFrameRef:(CTFrameRef)frameRef
{
    if (_frameRef != frameRef) {
        if (_frameRef) {
            CFRelease(_frameRef);
            _frameRef = nil;
        }
        _frameRef = frameRef;
    }
}
@end
