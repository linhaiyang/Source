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

@interface ToolDemoViewController ()
@property(nonatomic,strong)UIView * operView;
@property (strong, readwrite, nonatomic) dispatch_semaphore_t dispatchSemaphore;
@end

@implementation ToolDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个自动释放池
     @autoreleasepool {
         //模拟：宠物中心派出小狗
         loadAinitializeTest * test = [[loadAinitializeTest alloc]init];
//         loadAinitializeTest * test = [dog copy];
         [test initCSocket];
//         Dlog(@"%ld",[dog ]);
//
//         //模拟：xiaoming需要和小狗玩耍，需要将其引用计数加1
//         [dog retain];
//         NSLog(@"小狗的引用计数为 %ld",dog.retainCount);
//
//         //模拟：xiaohong需要和小狗玩耍，需要将其引用计数加1
//         [dog retain];
//         NSLog(@"小狗的引用计数为 %ld",dog.retainCount);
//
//         //模拟：xiaoming确定不想和小狗玩耍了，需要将其引用计数减1
//         [dog release];
//         NSLog(@"小狗的引用计数为 %ld",dog.retainCount);
//
//         //模拟：xiaohong不确定何时不想和小狗玩耍了，将其设置为自动释放
//         [dog autorelease];
//         NSLog(@"小狗的引用计数为 %ld",dog.retainCount);
//
//         //没人需要和小狗玩耍了，将其引用计数减1
//         [dog release];
         
//         NSLog(@"释放池子");
     }
    loadAinitializeTest * test = [[loadAinitializeTest alloc]init];
//         loadAinitializeTest * test = [dog copy];
    [test initCSocket];
    
    
//    NSArray * array = [NSArray new];
//    NSString * string = [array objectAtIndex:1];
    
    
//    [loadAinitializeTest initializeTestBegin];
//    loadAinitializeTest * load = [loadAinitializeTest new];
//    [loadAinitializeTest initializeTestBegin];
    
    
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

   
    
//    dispatch_async(queue2, ^{
//        [NSThread sleepForTimeInterval:2];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            Dlog(@"%@---0当前线程",[NSThread currentThread]);
//        });
//        Dlog(@"%@---2当前线程",[NSThread currentThread]);
//    });
//    dispatch_async(queue2, ^{
////        [NSThread sleepForTimeInterval:2];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            Dlog(@"%@---3当前线程",[NSThread currentThread]);
//        });
//        Dlog(@"%@---4当前线程",[NSThread currentThread]);
//    });
////
//    dispatch_async(queue, ^{
//        Dlog(@"%@---2当前线程",[NSThread currentThread]);
//        dispatch_sync(queue2, ^{
//            Dlog(@"%@---3当前线程",[NSThread currentThread]);
//        });
//        dispatch_sync(queue2, ^{
//
//            Dlog(@"%@---4当前线程",[NSThread currentThread]);
//        });
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            Dlog(@"%@---5当前线程",[NSThread currentThread]);
//            });
//        Dlog(@"%@---6当前线程",[NSThread currentThread]);
//    });

//    Dlog(@"%@---7当前线程",[NSThread currentThread]);
    
    
    
//    dispatch_sync([GCDQueue highPriorityGlobalQueue].dispatchQueue, ^{
//        Dlog(@"1111");
//    });
    self.operView = [[UIView alloc]init];
    self.operView.backgroundColor = [UIColor blueColor];
    self.operView.frame = CGRectMake(10, KNavHeight, 50, 50);
    [self.view addSubview:self.operView];
    
    [self addOperation];
//    [self testdispatchGroup];
    
//    self.dispatchSemaphore = dispatch_semaphore_create(5);
//    [self testDispatchSemaphore];
    
}


-(void)testDispatchSemaphore{
    /**
     dispatch_semaphore_s是信号量的结构体。代码如下：
     
     struct dispatch_semaphore_s {
         DISPATCH_STRUCT_HEADER(dispatch_semaphore_s, dispatch_semaphore_vtable_s);
         long dsema_value;   //当前信号量
         long dsema_orig;    //初始化信号量
         size_t dsema_sent_ksignals;
     #if USE_MACH_SEM && USE_POSIX_SEM
     #error "Too many supported semaphore types"
     #elif USE_MACH_SEM
         semaphore_t dsema_port;
         semaphore_t dsema_waiter_port;
     #elif USE_POSIX_SEM
         sem_t dsema_sem;
     #else
     #error "No supported semaphore type"
     #endif
         size_t dsema_group_waiters;
         struct dispatch_sema_notify_s *dsema_notify_head; //notify链表头部
         struct dispatch_sema_notify_s *dsema_notify_tail; //notify链表尾部
     };

     typedef mach_port_t     semaphore_t;

     struct dispatch_sema_notify_s {
         struct dispatch_sema_notify_s *volatile dsn_next; //下一个信号节点
         dispatch_queue_t dsn_queue; //操作的队列
         void *dsn_ctxt;             //上下文
         void (*dsn_func)(void *);   //执行函数
     };
     
     */
    
//    dispatch_semaphore_t semphore = dispatch_semaphore_create(2);
    
//    调用dispatch_semaphore_wait信号量减1，调用dispatch_semaphore_signal信号量加1
    
}


-(void)testdispatchGroup{
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_group_async(group, queue, ^{
//        for (int i = 0; i<5; i++) {
//            NSLog(@"任务1 ----%@",[NSThread currentThread]);
//        };
//    });
//
//    dispatch_group_async(group, queue, ^{
//        for (int i = 0; i<5; i++) {
//            NSLog(@"任务2 ----%@",[NSThread currentThread]);
//        };
//    });
//
//    //等前面的任务都执行完,会自动执行这个任务
//    dispatch_group_notify(group, queue, ^{
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            for (int i = 0; i<5; i++) {
//                NSLog(@"任务3 ----%@",[NSThread currentThread]);
//            };
//        });
//    });
    
//    [[GCDGroup new]groupTest];
}

-(void)addOperation{
    
    
    // 1.创建队列
   NSOperationQueue *queue = [[NSOperationQueue alloc] init];

   // 2.设置最大并发操作数
   queue.maxConcurrentOperationCount = 1; // 串行队列
    
    self.dispatchSemaphore = dispatch_semaphore_create(3);
    
//    dispatch_semaphore_wait(self.dispatchSemaphore, 0);
//    [self operOnMainThread];
//    dispatch_semaphore_wait(self.dispatchSemaphore, DISPATCH_TIME_FOREVER);
//    [self operOnMainThread2];
    // 使用 NSBlockOperation 创建操作3
    @weakify(self);
       NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
           @strongify(self);
           [self operOnMainThread];
       }];



    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        @strongify(self);
        [self operOnMainThread2];
//        [UIView animateWithDuration:0.3 animations:^{
//            @strongify(self);
//            self.operView.left= self.operView.frame.origin.x + 10;
//        }];
    }];

    // 3.使用 addOperation: 添加所有操作到队列中
        [queue addOperation:op3];
    [queue addOperation:op2];
    
    // 3.添加操作
//       [queue addOperationWithBlock:^{
//           @strongify(self);
////           [self operOnMainThread];
//           for (int i = 0; i < 2; i++) {
//               [NSThread sleepForTimeInterval:4]; // 模拟耗时操作
//               NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
//           }
//       }];
//       [queue addOperationWithBlock:^{
//           @strongify(self);
////           [self operOnMainThread2];
//
//           for (int i = 0; i < 2; i++) {
//               [NSThread sleepForTimeInterval:3]; // 模拟耗时操作
//               NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
//           }
//       }];
//       [queue addOperationWithBlock:^{
//           for (int i = 0; i < 2; i++) {
//               [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
//               NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
//           }
//       }];
//       [queue addOperationWithBlock:^{
//           for (int i = 0; i < 2; i++) {
//               [NSThread sleepForTimeInterval:1]; // 模拟耗时操作
//               NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
//           }
//       }];
    
    Dlog(@"%@---1当前线程",[NSThread currentThread]);

}
-(void)operOnMainThread{
    @weakify(self);
//    dispatch_semaphore_wait(self.dispatchSemaphore, DISPATCH_TIME_FOREVER);
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
        
//        [UIView anima]
        
        [UIView animateWithDuration:0.3 animations:^{
            @strongify(self);
//            dispatch_async(dispatch_get_main_queue(), ^{
                self.operView.ui_left= self.operView.frame.origin.x + 50;
//            });
            
        }completion:^(BOOL finished) {
            intptr_t y =   dispatch_semaphore_signal(self.dispatchSemaphore);
            Dlog(@"%ld-------",y);
        }];
    });
//    [NSThread sleepForTimeInterval:0.3];
}
-(void)operOnMainThread2{
    @weakify(self);
    intptr_t y =   dispatch_semaphore_wait(self.dispatchSemaphore, DISPATCH_TIME_NOW);//当返回值为0时表示当前并没有线程等待其处理的信号量，其处理的信号量的值加1即可。当返回值不为0时，表示其当前有（一个或多个）线程等待其处理的信号量，
    Dlog(@"%ld+++++++",y);
    dispatch_async(dispatch_get_main_queue(), ^{
    [UIView animateWithDuration:0.3 animations:^{
//        dispatch_async(dispatch_get_main_queue(), ^{
            @strongify(self);
            self.operView.ui_top= self.operView.frame.origin.y + 50;
//        });
    }completion:^(BOOL finished) {
//        dispatch_semaphore_signal(self.dispatchSemaphore);
    }];
    });
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
