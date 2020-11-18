//
//  HomeViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"

#import <objc/runtime.h>
#import <objc/message.h>
@interface HomeViewController ()
@property(nonatomic,copy)NSString * muStr;
@end

@implementation HomeViewController
@synthesize muStr=_muStr;
-(void)setMuStr:(NSString *)muStr{
//    _muStr = muStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.muStr = @"123";
    Dlog(@"%@---_muStr",_muStr);
    /**
     self.就是调用property自动生成的getter和setter方法，而_则是直接去调用实例变量（property会自动生成一个实例变量，如果你重写了getter与setter方法，property自动生成的实例变量就无效了，需要手动去申明一个实例变量或者用@@synthesize）
     
     */
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
