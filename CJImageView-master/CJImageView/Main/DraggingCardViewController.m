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
    
    
    NSMutableCharacterSet *base = [NSMutableCharacterSet lowercaseLetterCharacterSet]; //字母

      NSCharacterSet *decimalDigit = [NSCharacterSet decimalDigitCharacterSet];   //十进制数字

      [base formUnionWithCharacterSet:decimalDigit];    //字母加十进制

      NSString *string = @"ax@d5s#@sfn$5`SF$$%x^(#e{]e";

    Dlog(@"%@---------------------",[string stringByTrimmingCharactersInSet:base]);
    NSString *encodedUrl = [string stringByAddingPercentEncodingWithAllowedCharacters:base];

      //用上面的base隔开string然后组成一个数组，然后通过componentsJoinedByString，来连接成一个字符串
    NSArray<NSString *> *  ary = [string componentsSeparatedByCharactersInSet:base];
      NSLog(@"%@",[[string componentsSeparatedByCharactersInSet:base] componentsJoinedByString:@""]);//--@---#@---$-`SF$$%-^(#-{]-

      [base invert];  //非 字母加十进制
    NSArray<NSString *> *  ary2 = [string componentsSeparatedByCharactersInSet:base];

      NSLog(@"%@",[[string componentsSeparatedByCharactersInSet:base] componentsJoinedByString:@"-"]);

//    答应结果：ax-d5s--sfn-5------x---e--e
//
//
//
//     ax@d-s#@sfn$-`SF$$%x^(#e{]e


    
    
}


@end
