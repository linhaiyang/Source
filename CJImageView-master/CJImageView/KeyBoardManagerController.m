//
//  KeyBoardManagerController.m
//  CJImageView
//
//  Created by shengkai li on 2020/12/11.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "KeyBoardManagerController.h"

@interface KeyBoardManagerController ()

@end

@implementation KeyBoardManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField * field = [UITextField new];
    field.placeholder = @"输入筛选数据";
    field.frame = CGRectMake(100, 100, 200, 50);
    [self.view addSubview:field];
}

@end
