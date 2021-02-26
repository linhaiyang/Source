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
#import "NSObject+RACKVOWrapper.h"

//#import "loadAinitializeTest.h"
//#import <MWPhotoBrowser.h>
NSString * const kNotificationName = @"kNotificationName";
@interface ToolDemoViewController ()<CALayerDelegate>
@property(nonatomic,strong)UIView * operView;
@property (strong, readwrite, nonatomic) dispatch_semaphore_t dispatchSemaphore;
@property(nonatomic, strong) UITableView *tableView;    // toView
@property (strong, nonatomic) MKMapView *mapView;    // fromView
@end

@implementation ToolDemoViewController
- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx
{
    //1.使用UIKit进行绘制，因为UIKit只会对当前上下文栈顶的context操作，所以要把形参中的context设置为当前上下文
    UIGraphicsPushContext(ctx);
    UIImage* image = [UIImage imageNamed:@"test_image_2.png"];
    //指定位置和大小绘制图片
    [image drawInRect:CGRectMake(0, 0,100 , 100)];
    UIGraphicsPopContext();
    
    //    UIGraphicsPushContext(ctx);
    //2.使用Core Graphics进行绘制，需要显式使用context
    //    //画一个椭圆
    //    CGContextAddEllipseInRect(ctx, CGRectMake(0,0,100,100));
    //    //填充颜色为蓝色
    //    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    //    //在context上绘制
    //    CGContextFillPath(ctx);
    //    UIGraphicsPopContext();
}
- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer* layer = [CALayer layer];
        layer.anchorPoint = CGPointMake(0.5, 0);//锚定点  position 在layer中位置。。。定义旋转 缩放等操作的轴/点
        layer.position = CGPointMake(100, 100);
        layer.bounds = CGRectMake(0, 0, 200, 200);
        layer.delegate = self;
        //需要显式调用setNeedsDisplay来刷新才会绘制layer
        [layer setNeedsDisplay];
    layer.shouldRasterize = YES;//视图光栅化
        [self.view.layer addSublayer:layer];
//    layer.transform = CATransform3DScale(layer.transform, 0.5, 0.5, 1);
//    [layer setTransformScale:0.5];
//    [layer setTransformRotationZ:M_PI_2/2]; 
    layer.backgroundColor = UIColor.orangeColor.CGColor;
    @weakify(self);
    [self configRightBaritemWithImage:[UIImage imageNamed:@"icon_tabbar_homepage_selected"] buttonItemClick:^(UIBarButtonItem *barButton) {
        @strongify(self);
//        [self listOrMapShowItemClick];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationName object:@"通知说话开始"];

        NSNotification *notification = [NSNotification notificationWithName:kNotificationName
                                                                         object:@"通知说话开始"];
            [[NSNotificationQueue defaultQueue] enqueueNotification:notification
                                                       postingStyle:NSPostASAP];
           NSLog(@"按钮说话");
    }];
    
    NSMutableArray * photos = [NSMutableArray array];
    
    NSString *file=[[NSBundle mainBundle]pathForResource:@"Array" ofType:@"plist"] ;
    NSData * data = [NSData dataWithContentsOfFile:file];
    NSArray * array = [NSArray arrayWithPlistData:data];
    Dlog(@"%@-----,",[array jsonStringEncoded]);
    NSDictionary * dic = @{
        @"dev#ice" :@"iOS",
        @"nonce" : @"073581",
        @"signature" :@"44955f66e40c7c7f2ae5f644432c5f62",
        @"timestamp" : @"1611892024"
    };
    /**
     {
         "dev#ice" = iOS;
         nonce = 029595;
         signature = ccbd64a7f1954c5dbc8450429218dc2e;
         timestamp = 1611899960;
     }
     
     */
    NSString * str = [dic jsonStringEncoded];
    Dlog(@"%@------",str);
    /**
     {"nonce":"073581","dev#ice":"iOS","signature":"44955f66e40c7c7f2ae5f644432c5f62","timestamp":"1611892024"}
     */
    
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
    
//    _ioQueue = dispatch_queue_create("com.hackemist.SDWebImageCache", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSFileManager*fileManager = [NSFileManager new];
        Dlog(@"12123312321---fileManager");
        Dlog(@"%@",NSThread.currentThread);
    });
    Dlog(@"12123312321");
    /**
     Global queues是全局队列是并发队列，并由整个进程共享。进程中存在三个全局队列：高、中（默认）、低三个优先级队列。可以调用dispatch_get_global_queue函数传入优先级来访问队列。
     dispatch_queue_create使用户队列，由用户通过dispatch_queue_create来自行创建的串行队列，可以用于完成同步机制
     
<<<<<<< HEAD
     */    
//    loadAinitializeTest * test =  [loadAinitializeTest new];
//    test.frame = CGRectMake(0, 100, 300, 300);
//    [self.view addSubview:test];
//    [self transition];
//    objc_msgSend()
    objc_getClass("1122321321");
    NSObject * obg = [NSObject new];
    
    
    loadAinitializeTest * test =  [loadAinitializeTest new];
    test.frame = CGRectMake(0, 100, 300, 300);
    [self.view addSubview:test];
//    [self transition];
//    NSObject * obgj  =  [NSObject new];
    [test addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [test rac_observeKeyPath:@"name" options:NSKeyValueObservingOptionNew observer:self block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
            
    }];

    // 注册通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(actionNotification:)
                                                     name:kNotificationName
                                                   object:nil];
}

- (void) actionNotification: (NSNotification*)notification
{
    NSString* message = notification.object;
    NSLog(@"%@",message);

    sleep(3);

    NSLog(@"通知说话结束");
}


- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{

}
-(void)transition{
    MKMapView *mapView = [[MKMapView alloc] init];
    mapView.frame = self.view.bounds;
    self.mapView = mapView;
    
    [self.view addSubview:self.mapView];  // 首先显示mapView视图
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.rotateEnabled = NO; // 不旋转

    // toView
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = self.view.bounds;
    tableView.backgroundColor = UIColor.orangeColor;
//    tableView.delegate = self;
//    tableView.dataSource = self;
    self.tableView = tableView;
}
- (void)listOrMapShowItemClick{

//    static BOOL tran;
//   if (tran == false) {
//          // 点击 “列表”  翻转显示到列表tableview
//       tran = true;
//          // 翻转到列表那一页
//          // tableView添加到mapView的父视图上， mapView从父视图移除
//          [UIView transitionFromView:self.mapView toView:self.tableView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
//                  NSLog(@"翻转到了列表页面");
//           }];
//   }else{
//       tran = false;
//           // 点击 地图 翻转显示 地图页面
////           self.listOrMapShowItem.title = @"列表";
//           // mapView添加到tableView的父视图上， tableView从父视图移除
//           [UIView transitionFromView:self.tableView toView:self.mapView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
//                   NSLog(@"翻转到了地图页面");
//           }];
//        }
}
@end
