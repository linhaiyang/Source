//
//  PersonListViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "PersonListViewController.h"

@interface PersonListViewController ()

@end

@implementation PersonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * str = @"ssstr我";
    const char *buffer= [str UTF8String];

    
    NSString * st = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    Dlog(@"%@--ssss---%s",st,buffer);
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
