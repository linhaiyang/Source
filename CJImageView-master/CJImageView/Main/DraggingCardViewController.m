//
//  DraggingCardViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "DraggingCardViewController.h"

@interface DraggingCardViewController ()
@property(nonatomic,strong)NSThread * thread;
@end

@implementation DraggingCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableCharacterSet *base = [NSMutableCharacterSet lowercaseLetterCharacterSet]; //字母

      NSCharacterSet *decimalDigit = [NSCharacterSet decimalDigitCharacterSet];   //十进制数字

      [base formUnionWithCharacterSet:decimalDigit];    //字母加十进制

      NSString *string = @"ax@d5s#@sfn$5`SF$$%x^(#e{]e2";
    Dlog(@"%@---------------------",[string stringByTrimmingCharactersInSet:base]);//@d5s#@sfn$5`SF$$%x^(#e{]//这个方法 仅仅 去除了 开头 和 结尾 的指定字符集中连续字符
    NSString *encodedUrl = [string stringByAddingPercentEncodingWithAllowedCharacters:base];
    Dlog(@"%@-----------r----------",encodedUrl);//ax%40d5s%23%40sfn%245%60%53%46%24%24%25x%5E%28%23e%7B%5De2
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


    // 创建线程，并调用run1方法执行任务
       self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(run1) object:nil];
   // 开启线程
       [self.thread start];
    
    NSTimer*timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:true block:^(NSTimer * _Nonnull timer) {
    //        NSTimeInterval timerInter = [UIApplication sharedApplication].backgroundTimeRemaining;
//        NSLog(@"timer22222-----------------");
        }];
        [timer fire];
    
    CFRunLoopRef runloop = CFRunLoopGetMain();
    CFRunLoopObserverRef observer;
//        [NSNotificationCenter defaultCenter]add
    observer = CFRunLoopObserverCreate(CFAllocatorGetDefault(),
                                       kCFRunLoopBeforeWaiting | kCFRunLoopExit,//休眠或者退出的时候监听
                                       true,      // repeat
                                       0xFFFFFF,  // after CATransaction(2000000)
                                       YYRunLoopObserverCallBack, NULL);
    CFRunLoopAddObserver(runloop, observer, kCFRunLoopCommonModes);
    
    
    
    CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};

       CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);

       CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);

//       while (pageStillLoading) {
//
//           NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//
//           CFRunLoopRun();
//
//           [pool release];
//
//       }

       CFRunLoopRemoveSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);

       CFRelease(source);

}
static void YYRunLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) //监听的代码 CFRunLoopActivity activity, void *info
{
//    Dlog(@"kCFRunLoopBeforeWaiting---kCFRunLoopExit");
//    NSLog(@"kCFRunLoopBeforeWaiting---kCFRunLoopExit");
}
- (void) run1
{
    // 这里写任务
    NSLog(@"----run1-----");

//    NSTimer*timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:true block:^(NSTimer * _Nonnull timer) {
//    //        NSTimeInterval timerInter = [UIApplication sharedApplication].backgroundTimeRemaining;
//        NSLog(@"timer-----------------");
//        }];
//        [timer fire];
    // 添加下边两句代码，就可以开启RunLoop，之后self.thread就变成了常驻线程，可随时添加任务，并交于RunLoop处理
//    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];

    // 测试是否开启了RunLoop，如果开启RunLoop，则来不了这里，因为RunLoop开启了循环。
    NSLog(@"未开启RunLoop");
}
@end
