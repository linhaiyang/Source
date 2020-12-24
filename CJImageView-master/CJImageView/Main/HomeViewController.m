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
- (void)viewDidLoad {
    [super viewDidLoad];
//    CGFloat statuheight = KStatusBarHeight;
    

//    const char c [4] = "ccc";
    
    
    CFArrayRef cfArray=CFRunLoopCopyAllModes(CFRunLoopGetMain());
    
    [loadAinitializeTest initializeTestBegin];
    
    [loadAinitializeTest dataWithBytesNoCopy:(__bridge void * _Nonnull)(self)];
    
    /**
     <__NSArrayM 0x60000015e400>(
     UITrackingRunLoopMode,
     GSEventReceiveRunLoopMode,
     kCFRunLoopDefaultMode,
     kCFRunLoopCommonModes
     )
     */
    
    
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, KScreen_Height)];
//    bgView.backgroundColor = [UIColor orangeColor];
//    bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;//横屏后 屏幕宽度 变化，子视图跟着变化
////  [self.tableV insertSubview:bgView atIndex:0];
//    [self.view addSubview:bgView];
//    Dlog(@"%f-------%f",KScreen_Width,bgView);
//
//    IQTextView * textView = [[IQTextView alloc]init];
    
    YYLabel * label = [[YYLabel alloc]initWithFrame:CGRectMake(10, 100, 100, 20)];
    label.backgroundColor = UIColor.cyanColor;
    label.text = @"YYLabel";
    [self.view addSubview:label];
    
    CATextLayer * textLayer = [CATextLayer layer];
    
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
