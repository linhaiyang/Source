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
@property(nonatomic,strong)UIView * animateCube;
@end

@implementation DraggingCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect targetBounds = (CGRect){CGPointZero,CGSizeMake(200, 200)};
       self.animateCube = [[UIView alloc] initWithFrame:targetBounds];
       _animateCube.center = self.view.center;
    _animateCube.backgroundColor = UIColor.orangeColor;
       [self.view addSubview:self.animateCube];
    
    CALayer * layer = [[CALayer alloc]init];
    layer.transform = CATransform3DTranslate(layer.transform, 0, 0, 100);
    layer.bounds = targetBounds;
    layer.position = self.animateCube.center;
    layer.backgroundColor = UIColor.orangeColor.CGColor;

    CALayer * layer2 = [[CALayer alloc]init];
    layer2.transform = CATransform3DTranslate(layer2.transform, 0, 0, -100);
    layer2.bounds = targetBounds;
    layer2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    layer2.position = self.animateCube.center;

    CALayer * layer3 = [[CALayer alloc]init];
    layer3.transform = CATransform3DTranslate(layer3.transform, -100, 0, 0);
    layer3.transform = CATransform3DRotate(layer3.transform, M_PI_2, 0, 1, 0);
    layer3.bounds = targetBounds;
    layer3.position = self.animateCube.center;
    layer3.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;


    CALayer * layer4 = [[CALayer alloc]init];
    layer4.transform = CATransform3DTranslate(layer4.transform, 100, 0, 0);
    layer4.transform = CATransform3DRotate(layer4.transform, M_PI_2, 0, 1, 0);
    layer4.bounds = targetBounds;
    layer4.position = self.animateCube.center;
    layer4.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;


    CALayer * layer5 = [[CALayer alloc]init];
    layer5.transform = CATransform3DTranslate(layer5.transform, 0, 100, 0);
    layer5.transform = CATransform3DRotate(layer5.transform, M_PI_2, 1, 0, 0);
    layer5.bounds = targetBounds;
    layer5.position = self.animateCube.center;
    layer5.backgroundColor = [[UIColor magentaColor] colorWithAlphaComponent:0.5].CGColor;



    CALayer * layer6 = [[CALayer alloc]init];
    layer6.transform = CATransform3DTranslate(layer6.transform, 0, -100, 0);
    layer6.transform = CATransform3DRotate(layer6.transform, M_PI_2, -1, 0, 0);
    layer6.bounds = targetBounds;
    layer6.position = self.animateCube.center;
    layer6.backgroundColor = [[UIColor brownColor] colorWithAlphaComponent:0.5].CGColor;


//    [self.animateCube.layer addSublayer:layer];
//    [self.animateCube.layer addSublayer:layer2];
//    [self.animateCube.layer addSublayer:layer3];
//    [self.animateCube.layer addSublayer:layer4];
//    [self.animateCube.layer addSublayer:layer5];
//    [self.animateCube.layer addSublayer:layer6];


    UIView *test = [[UIView alloc] initWithFrame:targetBounds];// front
    test.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    test.layer.transform = CATransform3DTranslate(test.layer.transform, 0, 0, 100);

    UIView *test1 = [[UIView alloc] initWithFrame:targetBounds];// back
    test1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    test1.layer.transform = CATransform3DTranslate(test1.layer.transform, 0, 0, -100);

    UIView *test2 = [[UIView alloc] initWithFrame:targetBounds];// left
    test2.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    test2.layer.transform = CATransform3DTranslate(test2.layer.transform, -100, 0, 0);
    test2.layer.transform = CATransform3DRotate(test2.layer.transform, M_PI_2, 0, 1, 0);

    UIView *test3 = [[UIView alloc] initWithFrame:targetBounds];// right
    test3.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.5];
    test3.layer.transform = CATransform3DTranslate(test3.layer.transform, 100, 0, 0);
    test3.layer.transform = CATransform3DRotate(test3.layer.transform, M_PI_2, 0, 1, 0);

    UIView *test4 = [[UIView alloc] initWithFrame:targetBounds];// head
    test4.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    test4.layer.transform = CATransform3DTranslate(test4.layer.transform, 0, 100, 0);
    test4.layer.transform = CATransform3DRotate(test4.layer.transform, M_PI_2, 1, 0, 0);

    UIView *test5 = [[UIView alloc] initWithFrame:targetBounds];// foot
    test5.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    test5.layer.transform = CATransform3DTranslate(test5.layer.transform, 0, -100, 0);
    test5.layer.transform = CATransform3DRotate(test5.layer.transform, M_PI_2, -1, 0, 0);
//https://www.jianshu.com/p/3dd14cfbdc53
//        [self.animateCube addSubview:test];
//        [self.animateCube addSubview:test1];
//        [self.animateCube addSubview:test2];
//        [self.animateCube addSubview:test3];
//        [self.animateCube addSubview:test4];
//        [self.animateCube addSubview:test5];
       self.animateCube.transform = CGAffineTransformMakeScale(0.5, 0.5);//CGAffineTransform
//
    [self.animateCube.layer setTransformTranslationX:100];
    [self.animateCube.layer setTransformRotationZ:M_PI_2/2];
       __block CATransform3D transform = CATransform3DIdentity;
//
////       NSLog(@"%@",[NSString logForCATransform3D:transform]);
//
//       // Label
        [self.animateCube addSubview:test];
        [self.animateCube addSubview:test1];
        [self.animateCube addSubview:test2];
        [self.animateCube addSubview:test3];
        [self.animateCube addSubview:test4];
        [self.animateCube addSubview:test5];
       self.animateCube.transform = CGAffineTransformMakeScale(0.5, 0.5);//CGAffineTransform

//       __block CATransform3D transform = CATransform3DIdentity;

//       NSLog(@"%@",[NSString logForCATransform3D:transform]);

       // Label
       UILabel *label = [[UILabel alloc] init];
       label.frame = CGRectOffset(self.animateCube.frame, 0, - 100);
       label.text = @"AnimatedCube";
       [label sizeToFit];
       [self.view addSubview:label];

       transform.m34 = 1.0/-500;

       float angle = M_PI / 360;
       self.animateCube.layer.sublayerTransform = transform;
       NSTimer *timer = [NSTimer timerWithTimeInterval:1.0/60 repeats:YES block:^(NSTimer * _Nonnull timer) {
               transform = CATransform3DRotate(transform, angle, 1, 1, 0.5);
               self.animateCube.layer.sublayerTransform = transform;//
//       NSTimer *timer = [NSTimer timerWithTimeInterval:1.0/60 repeats:YES block:^(NSTimer * _Nonnull timer) {
//           transform = CATransform3DRotate(transform, angle, 1, 1, 0.5);
//           self.animateCube.layer.sublayerTransform = transform;//
       }];
    
       [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
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
