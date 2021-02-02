//
//  RootWebViewController.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "RootWebViewController.h"
//#import <YYKit.h>
#import <StoreKit/StoreKit.h>

@interface RootWebViewController ()

@property (nonatomic,assign) double lastProgress;//上次进度条位置
@end

@implementation RootWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@(1382195436)} completionBlock:^(BOOL result, NSError * _Nullable error) {
//    if (error) {
//    //handle the error
//    }
//    }];

}

//-(void)updateNavigationItems

-(void)leftBtnClick:(UIButton *)btn{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

