//
//  AndyMainViewController.m
//  AndyStatusBarHUD_Test
//
//  Created by 李扬 on 16/6/24.
//  Copyright © 2016年 andyli. All rights reserved.
//

#import "AndyMainViewController.h"

@interface AndyMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *showSuccessBtn;
@property (weak, nonatomic) IBOutlet UIButton *showFailureBtn;
@property (weak, nonatomic) IBOutlet UIButton *showLoadingBtn;
@property (weak, nonatomic) IBOutlet UIButton *hideBtn;
@property (weak, nonatomic) IBOutlet UIButton *showMessageBtn;
@end

@implementation AndyMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAutoLayout];
}

- (void)setupAutoLayout
{
    CGFloat commonVerticalMargin = 50;
    
    [self.showSuccessBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(self.view.top).offset(commonVerticalMargin);
    }];
    
    [self.showFailureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.showSuccessBtn.centerX);
        make.top.equalTo(self.showSuccessBtn.bottom).offset(commonVerticalMargin);
    }];
    
    [self.showLoadingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.showSuccessBtn.centerX);
        make.top.equalTo(self.showFailureBtn.bottom).offset(commonVerticalMargin);
    }];
    
    [self.hideBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.showSuccessBtn.centerX);
        make.top.equalTo(self.showLoadingBtn.bottom).offset(commonVerticalMargin);
    }];
    
    [self.showMessageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.showSuccessBtn.centerX);
        make.top.equalTo(self.hideBtn.bottom).offset(commonVerticalMargin);
    }];
}

- (IBAction)btnShowSuccess:(UIButton *)sender
{
    [AndyStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)btnShowFailure:(UIButton *)sender
{
    [AndyStatusBarHUD showError:@"加载失败"];
}

- (IBAction)btnShowLoading:(UIButton *)sender
{
    [AndyStatusBarHUD showLoading:@"正在加载..."];
}

- (IBAction)btnHide:(UIButton *)sender
{
    [AndyStatusBarHUD hide];
}

- (IBAction)btnShowMessage:(UIButton *)sender
{
    [AndyStatusBarHUD showMessage:@"显示消息"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
