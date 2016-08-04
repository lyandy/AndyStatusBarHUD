//
//  AndyStatusBarHUD.h
//  AndyStatusBarHUD_Test
//
//  Created by 李扬 on 16/6/24.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AndyStatusBarHUD : NSObject

+ (void)showSuccess:(NSString *)msg;

+ (void)showError:(NSString *)msg;

+ (void)showLoading:(NSString *)msg;

+ (void)hide;

+ (void)showMessage:(NSString *)msg;

+ (void)showLoading:(NSString *)msg success:(NSString *)success icon:(NSString *)icon;

@end
