//
//  YMCardToViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/22.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "YMCardToViewController.h"

@interface YMCardToViewController ()

@end

@implementation YMCardToViewController
- (void)loadView {
    [super loadView];
    self.preferredContentSize = CGSizeMake(self.view.bounds.size.width, 420);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.layer.cornerRadius = 16;
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
