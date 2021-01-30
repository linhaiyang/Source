//
//  ToolDemoViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "ToolDemoViewController.h"
#import "GCD.h"
#import "UIView+Frame.h"
#import "loadAinitializeTest.h"
//#import "loadAinitializeTest.h"
//#import <MWPhotoBrowser.h>
@interface ToolDemoViewController ()
@property(nonatomic,strong)UIView * operView;
@property (strong, readwrite, nonatomic) dispatch_semaphore_t dispatchSemaphore;
@end

@implementation ToolDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray * photos = [NSMutableArray array];
    
    NSString *file=[[NSBundle mainBundle]pathForResource:@"Array" ofType:@"plist"] ;
    NSData * data = [NSData dataWithContentsOfFile:file];
    NSArray * array = [NSArray arrayWithPlistData:data];
    Dlog(@"%@-----,",[array jsonStringEncoded]);
    
//    browser.autoPlayOnAppear = NO; // Auto-play first video
    
    /**
     GCD (Grand Central Dispatch) 是Apple公司开发的一种技术，
     它旨在优化多核环境中的并发操作并取代传统多线程的编程模式。 在Mac OS X 10.6和IOS 4.0之后开始支持GCD。
     queue:区分内部执行的线程是串行还是并行
     sync/async:线程----sync:在当前线程中执行   async：开辟新的线程
     */
    //串行与并行针对的是队列，而同步与异步，针对的则是线程
/**DISPATCH_QUEUE_SERIAL：串联
 DISPATCH_QUEUE_CONCURRENT：并联
 同步执行（sync）：同步添加任务到指定的队列中，在添加的任务执行结束之前，会一直等待，直到队列里面的任务完成之后再继续执行。
 只能在当前线程中执行任务，不具备开启新线程的能力。
 异步执行（async）：异步添加任务到指定的队列中，它不会做任何等待，可以继续执行任务。
 可以在新的线程中执行任务，具备开启新线程的能力。
 */
    /**
     同步执行 + 并发队列
     异步执行 + 并发队列
     同步执行 + 串行队列
     异步执行 + 串行队列
     区别                                 并发队列                                      串行队列                                                    主队列
     同步（sync）    没有开启新线程，串行执行任务                没有开启新线程，串行执行任务                死锁卡住不执行
     异步（async）    有开启新线程，并发执行任务                 有开启新线程（1条），串行执行任务        没有开启新线程，串行执行任务
     DISPATCH_QUEUE_SERIAL 队列中不能添加sync(queue),造成死锁
     没有开启新的线程，线程中任务都是串行执行
     并发功能只有在异步函数(dispatch_async)下才有效
     */
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /**
     Global queues是全局队列是并发队列，并由整个进程共享。进程中存在三个全局队列：高、中（默认）、低三个优先级队列。可以调用dispatch_get_global_queue函数传入优先级来访问队列。
     dispatch_queue_create使用户队列，由用户通过dispatch_queue_create来自行创建的串行队列，可以用于完成同步机制
     
     */
    
//    objc_msgSend()
    objc_getClass("1122321321");
    NSObject * obg = [NSObject new];
}
@end
