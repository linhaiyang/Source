//
//  HomeViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "HomeViewController.h"
#import "loadAinitializeTest.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UIColor+Gradient.h"
#import "NSString+Encrypt.h"
#import "NSString+hash.h"
#import "NSString+Base64.h"

typedef NSString * NSStringResourceKey NS_STRING_ENUM;

@interface HomeViewController ()
@property(nonatomic,copy)NSString * muStr;
@end

@implementation HomeViewController
@synthesize muStr=_muStr2;
-(void)setMuStr:(NSString *)muStr{
//    _muStr = muStr;
    Dlog(@"111111");
}

static NSString *base64_encode_data(NSData *data){
    
    return nil;
}
- (void)viewDidLoad  {
    [super viewDidLoad];
        
    NSDate * date = [NSDate new];
    NSInteger year = date.year;
    NSInteger month = date.month;
    NSInteger day = date.day;
    NSInteger hour = date.hour;
    NSInteger min = date.minute;
    NSInteger second = date.second;
    NSString * dateStr = [date stringWithFormat:@"yyyyMMdd HHmmss"];
    
    NSDate * currentDate = [NSDate dateWithString:dateStr
                                           format:@"yyyyMMdd HHmmss"];
    
    Class class1=objc_getClass("HomeViewController");
    Class class2=object_getClass(class1);
    Class class3=object_getClass(class2);
    Class class4=object_getClass(class3);
    Class class5=object_getClass(class4);
    NSLog(@"%p time isa points to address: %p  %p  %p  %p",class1,class2,class3,class4,class5);
    
    YYTextView * label = [[YYTextView alloc]init];//WithFrame:CGRectMake(0, 100, 100, 50)
    label.text = @"time isa points to address";
    [self.view addSubview:label];
//    label.editable = false;
    
//    label.keyboardType = UIKeyboardTypeNumberPad;
//    label.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    [self addsub:NSStringResourceKeyNamedPipe];
    [label makeConstraints:^(MASConstraintMaker *make) {
//        make.size.equalTo(CGSizeMake(100, 50));
        make.left.equalTo(0);
        make.center.equalTo(self.view);
        make.height.equalTo(kScreenHeight/2);
    }];
    
    
    CALayer *line = [CALayer layer];
    [self.view.layer addSublayer:line];
    line.size =  CGSizeMake(50, 50);
    line.backgroundColor = UIColor.orangeColor.CGColor;
    [line yy_setImageWithURL:[NSURL URLWithString:@"http://ww4.sinaimg.cn/wap720/48e3f28djw1evvhkx7o7pj20m211cqaz.jpg"] placeholder:nil];
    line.centerX = self.view.ui_centerX;
    line.centerY = self.view.ui_centerY + 100;
    NSMutableDictionary * dic;

    NSArray * array = @[@1,@2,@3];
    for(NSNumber * num in array){
        if (num.longValue == 1)continue;
        Dlog(@"%@-----5555+++++++++++++++++++++",num);
    }
    
    
}

-(void)addsub:(NSStringResourceKey)resoure{
    NSString *bananas = @"t123.321abc137d efg/hij kl";
     NSString *separatorString = @"fg";
     BOOL result;

     NSScanner *aScanner = [NSScanner scannerWithString:bananas];

     //扫描字符串
     //扫描到指定字符串时停止，返回结果为指定字符串之前的字符串
     NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
    
    
    NSString *container;
        result = [aScanner scanUpToString:separatorString intoString:&container];
        NSLog(@"扫描成功：%@", result?@"YES":@"NO");
        NSLog(@"扫描的返回结果：%@", container);
        NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
    
    
    //扫描整数
      //将会接着上一次扫描结束的位置继续扫描
      NSLog(@"-------------------------------------1");
      NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
      NSInteger anInteger;
      result = [aScanner scanInteger:&anInteger];
      NSLog(@"扫描成功：%@", result?@"YES":@"NO");
      NSLog(@"扫描的返回结果：%ld", anInteger);
      NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
    
    
    NSLog(@"-------------------------------------2");
    aScanner.scanLocation = 1;      //将扫描仪的位置置为首位置
    NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
    NSInteger anInteger2;
    result = [aScanner scanInteger:&anInteger2];
    NSLog(@"扫描成功：%@", result?@"YES":@"NO");
    NSLog(@"扫描的返回结果：%ld", anInteger2);
    NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
    
    
    NSLog(@"-------------------------------------5");
    aScanner.scanLocation = 0;      //将扫描仪的位置置为首位置
    NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
    NSString *str;
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"/"];
    result = [aScanner scanUpToCharactersFromSet:characterSet intoString:&str];
    NSLog(@"扫描成功：%@", result?@"YES":@"NO");
    NSLog(@"扫描的返回结果：%@", str);
    NSLog(@"扫描仪所在的位置：%lu", aScanner.scanLocation);
    
    
    NSLog(@"-------------------------------------6");
    NSString * numStr = @"a 1 b 2 c 3 d 4 e 5 f 6 o";
        NSScanner * bscanner = [NSScanner scannerWithString:numStr];
        NSCharacterSet * numSet = [NSCharacterSet decimalDigitCharacterSet];
        while ( NO == [bscanner isAtEnd]) {
            NSString * intoStr2;
            NSLog(@"----%ld",bscanner.scanLocation);
            if ([bscanner scanUpToCharactersFromSet:numSet intoString:&intoStr2]) {
//                NSLog(@"-----------%@",intoStr2);
                NSLog(@"----%ld",bscanner.scanLocation);
                int num;
                if ([bscanner scanInt:&num]) {
                    NSLog(@"num=%d, %ld",num, bscanner.scanLocation);
                }
            }
        }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
NSStringResourceKey const NSStringResourceKeyNamedPipe;
NSStringResourceKey const NSStringResourceKeyUserPipe;
@end
