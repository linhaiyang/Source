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
- (void)viewDidLoad {
    [super viewDidLoad];


    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    Dlog(@"runloop--------------%@",loop);
    [[GCDQueue globalQueue]execute:^{
        NSRunLoop *loop = [NSRunLoop currentRunLoop];
    }];
    CFRunLoopRef runLoop = [NSRunLoop currentRunLoop].getCFRunLoop;
//    __weak KWBackgroundTask *weakSelf = self;
    CFRunLoopTimerRef timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + 10.0, 0, 0, 0, ^(CFRunLoopTimerRef timer) {
//        [NSException raise:KWBackgroundTaskException format:@"Task %@ timed out", weakSelf];
        Dlog(@"112222");
        CFRunLoopStop(runLoop);
    });
    CFRunLoopAddTimer(runLoop, timer, kCFRunLoopDefaultMode);
    CFRunLoopRun();

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
