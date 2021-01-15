//
//  DraggingCardViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "DraggingCardViewController.h"

@interface DraggingCardViewController ()

@end

@implementation DraggingCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * str = @"ssstr我";
    const char *buffer= [str UTF8String];

    
    NSString * st = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet whitespaceCharacterSet]];
    Dlog(@"%@--ssss---%s",st,buffer);//ssstr%E6%88%91--ssss---ssstrÊàë
    
    
}


@end
