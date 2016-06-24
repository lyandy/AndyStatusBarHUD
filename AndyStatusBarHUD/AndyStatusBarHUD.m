//
//  AndyStatusBarHUD.m
//  AndyStatusBarHUD_Test
//
//  Created by 李扬 on 16/6/24.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import "AndyStatusBarHUD.h"

#define AndyMessageFont [UIFont systemFontOfSize:12]

@implementation AndyStatusBarHUD

static CGFloat const AndyMessageDuration = 2.0;

static CGFloat const AndyAnimationDuration = 0.25;

static UIWindow *window;

static NSTimer *timer;

+ (void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window.hidden = YES;
    window = [[UIWindow alloc] init];
    window.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    window.windowLevel = UIWindowLevelAlert;
    window.frame = frame;
    window.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:AndyAnimationDuration animations:^{
        window.frame = frame;
    }];
}

+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    // 停止定时器
    [timer invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = AndyMessageFont;
    if (image != nil)
    {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window.bounds;
    [window addSubview:button];
    
    // 定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:AndyMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"AndyStatusBarHUD.bundle/info"]];
}

+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"AndyStatusBarHUD.bundle/success"]];
}

+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"AndyStatusBarHUD.bundle/error"]];
}

+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer invalidate];
    timer = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = AndyMessageFont;
    label.frame = window.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : AndyMessageFont}].width;
    CGFloat centerX = (window.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window addSubview:loadingView];
}

+ (void)hide
{
    [UIView animateWithDuration:AndyAnimationDuration animations:^{
        CGRect frame = window.frame;
        frame.origin.y =  - frame.size.height;
        window.frame = frame;
    } completion:^(BOOL finished) {
        window = nil;
        timer = nil;
    }];
}


@end
