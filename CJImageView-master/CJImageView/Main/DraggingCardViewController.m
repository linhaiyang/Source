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

/**
 frame = (0 0; 200 200); transform3D =
 [1, 0, 0, 0;
 0, 1, 0, 0;
 0, 0, 1, 0;
 0, 0, 100, 1];
 
 */
    UIView *test = [[UIView alloc] initWithFrame:targetBounds];// front
    test.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:1];
    test.layer.transform = CATransform3DTranslate(test.layer.transform, 0, 0, 100);
/**
 frame = (0 0; 200 200); transform3D =
 1, 0, 0, 0;
 0, 1, 0, 0;
 0, 0, 1, 0;
 0, 0, -100, 1];
 
 */
    UIView *test1 = [[UIView alloc] initWithFrame:targetBounds];// back
    test1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1];
    test1.layer.transform = CATransform3DTranslate(test1.layer.transform, 0, 0, -100);

    /**
     frame = (0 0; 0 200); transform3D =
     [0, 0, -1, 0;
     0, 1, 0, 0;
     1, 0, 0, 0;
     -100, 0, 0, 1];
     
     */
    UIView *test2 = [[UIView alloc] initWithFrame:targetBounds];// left
    test2.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:1];
    test2.layer.transform = CATransform3DTranslate(test2.layer.transform, -100, 0, 0);
    test2.layer.transform = CATransform3DRotate(test2.layer.transform, M_PI_2, 0, 1, 0);

    /**
     
     frame = (200 0; 0 200); transform3D =
     [0, 0, -1, 0;
     0, 1, 0, 0;
     1, 0, 0, 0;
     100, 0, 0, 1];
     */
    UIView *test3 = [[UIView alloc] initWithFrame:targetBounds];// right
    test3.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:1];
    test3.layer.transform = CATransform3DTranslate(test3.layer.transform, 100, 0, 0);
    test3.layer.transform = CATransform3DRotate(test3.layer.transform, M_PI_2, 0, 1, 0);

    /**
     frame = (0 200; 200 0); transform3D =
     [1, 0, 0, 0;
     0, 0, 1, 0;
     0,-1, 0, 0;
     0, 100, 0, 1];
     */
    UIView *test4 = [[UIView alloc] initWithFrame:targetBounds];// head
    test4.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:1];
    test4.layer.transform = CATransform3DTranslate(test4.layer.transform, 0, 100, 0);
    test4.layer.transform = CATransform3DRotate(test4.layer.transform, M_PI_2, 1, 0, 0);

    /**
     frame = (0 0; 200 0); transform3D =
     [1, 0, 0, 0;
     0, 0, -1, 0;
     0, 1, 0, 0;
     0, -100, 0, 1];
     */
    UIView *test5 = [[UIView alloc] initWithFrame:targetBounds];// foot
    test5.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:1];
    test5.layer.transform = CATransform3DTranslate(test5.layer.transform, 0, -100, 0);
    test5.layer.transform = CATransform3DRotate(test5.layer.transform, M_PI_2, -1, 0, 0);
//https://www.jianshu.com/p/3dd14cfbdc53
       self.animateCube.transform = CGAffineTransformMakeScale(0.5, 0.5);//CGAffineTransform
//    [self.animateCube.layer setTransformTranslationX:100];
//    [self.animateCube.layer setTransformRotationZ:M_PI_2/2];
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

       float angle = M_PI / 360;  //M_PI代表角度
//       self.animateCube.layer.sublayerTransform = CATransform3DMakeRotation(0.78, 1, 1, 0.5);
//       NSTimer *timer = [NSTimer timerWithTimeInterval:1.0/60 repeats:YES block:^(NSTimer * _Nonnull timer) {
//               transform = CATransform3DRotate(transform, angle, 1, 1, 0.5);
//               self.animateCube.layer.sublayerTransform = transform;//
//       }];
//       [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    /**
     CAAimation动画
     translation对应平行移动;scale对应缩放;rotation对应旋转.
     
     
     UIView动画
     坐标尺寸类bounds，frame，center
     视图显示类 backgroundColor alpha hidden
     形态变化类 transform：修改这个属性可以实现旋转、形变、移动、翻转等动画效果，其通过矩阵运算的方式来实现，因此更加强大
     
     1242 × 828
     */
    UIImage * image = [UIImage imageNamed:@"test_image_2.png"];
    CGFloat imageWidth =floorf(image.size.width / 5);
    CGFloat imageheight =floorf(image.size.height / 5);
    UIView * contentView = [[UIView alloc]initWithFrame:CGRectMake(0, self.animateCube.ui_bottom + 100, imageWidth, imageheight)];
//    contentView.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:contentView];
    contentView.userInteractionEnabled = true;
    
    UIView * layer0 = [UIView new];
    layer0.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    layer0.frame = CGRectMake(0, imageheight/2, imageWidth, imageheight/2);
    layer0.layer.contents = (__bridge id _Nullable)(image.CGImage);
    [contentView addSubview:layer0];
    
    // 创建渐变图层
    CAGradientLayer *shadomLayer = [CAGradientLayer layer];

    // 设置渐变颜色
        shadomLayer.colors = @[(id)[UIColor clearColor],(id)[[UIColor blackColor] CGColor]];

        shadomLayer.frame = layer0.bounds;

//        _shadomLayer = shadomLayer;

    // 设置不透明度 0
        shadomLayer.opacity = 0;

        [layer0.layer addSublayer:shadomLayer];
    
    
    UIView * layer1 = [UIView new];
    layer1.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    layer1.layer.anchorPoint = CGPointMake(0.5, 1);
    layer1.frame = CGRectMake(0, 0, imageWidth, imageheight/2);
    layer1.layer.contents = (__bridge id _Nullable)(image.CGImage);

    [contentView addSubview:layer1];
    

    
    UIPanGestureRecognizer * tap = [[UIPanGestureRecognizer alloc]initWithActionBlock:^(UIPanGestureRecognizer * sender) {
        // 获取手指偏移量
            CGPoint transP = [sender translationInView:contentView];

        // 初始化形变
            CATransform3D transform3D = CATransform3DIdentity;

        // 设置立体效果
            transform3D.m34 = -1 / 1000.0;

        CGFloat transY = transP.y<imageheight?transP.y :imageheight;
        // 计算折叠角度，因为需要逆时针旋转，所以取反
            CGFloat angle = -transY / imageheight * M_PI;

        layer1.layer.transform = CATransform3DRotate(transform3D, angle, 1, 0, 0);
        
        shadomLayer.opacity = transY * 1 /  imageheight;
        if (sender.state == UIGestureRecognizerStateEnded) { // 手指抬起
                // 还原
                [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.1f initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{

                    layer1.layer.transform = CATransform3DIdentity;
                    // 还原阴影
                    shadomLayer.opacity = 0;
                } completion:nil];
            }

    }];
    [contentView addGestureRecognizer:tap];
    
    
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
    
    -(void)addAnimation{
        CGSize size =CGSizeMake(141, 60);
        CGFloat kPadding = YYTextCGFloatPixelHalf(6.0),kRadius = 5.f;
        CGFloat kHeight = 32.0;
        CGFloat kArrow =14.0;
        CGRect rect = (CGRect) {.size = size, .origin = CGPointZero};
        CAShapeLayer * layer = [CAShapeLayer new];
        [self.view.layer addSublayer:layer];
        CGPathRef boxPath = CGPathCreateWithRect(rect, NULL);
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, kPadding + kRadius, kPadding);
        CGPathAddLineToPoint(path, NULL, size.width - kPadding - kRadius, kPadding);
        CGPathAddQuadCurveToPoint(path, NULL, size.width - kPadding, kPadding, size.width - kPadding, kPadding + kRadius);
        CGPathAddLineToPoint(path, NULL, size.width - kPadding, kHeight);
        CGPathAddCurveToPoint(path, NULL, size.width - kPadding, kPadding + kHeight, size.width - kPadding - kRadius, kPadding + kHeight, size.width - kPadding - kRadius, kPadding + kHeight);
        CGPathAddLineToPoint(path, NULL, size.width / 2 + kArrow, kPadding + kHeight);
        CGPathAddLineToPoint(path, NULL, size.width / 2, kPadding + kHeight + kArrow);
        CGPathAddLineToPoint(path, NULL, size.width / 2 - kArrow, kPadding + kHeight);
        CGPathAddLineToPoint(path, NULL, kPadding + kRadius, kPadding + kHeight);
        CGPathAddQuadCurveToPoint(path, NULL, kPadding, kPadding + kHeight, kPadding, kHeight);
        CGPathAddLineToPoint(path, NULL, kPadding, kPadding + kRadius);
        CGPathAddQuadCurveToPoint(path, NULL, kPadding, kPadding, kPadding + kRadius, kPadding);
        CGPathCloseSubpath(path);
        layer.path = path;
        layer.size = size;
        layer.center = self.view.center;
        layer.lineWidth = 2;
        layer.contentsScale = [[UIScreen mainScreen] scale];
        layer.strokeColor = UIColor.blueColor.CGColor;
        layer.lineCap = kCALineCapRound;
        layer.lineJoin = kCALineJoinBevel;
        layer.fillColor = nil; // 默认为blackColor
        NSTimeInterval animationDuration = 0.8;
        CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = INFINITY;
        animationGroup.removedOnCompletion = NO;
        animationGroup.timingFunction = linearCurve;

        CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        strokeStartAnimation.fromValue = @0.015;
        strokeStartAnimation.toValue = @0.515;
    //x-xcode-debug-views://7f8040e76640?DBGViewDebuggerLaunchSessionParameter=7f8040e76640: runtime: Layout Issues: Position is ambiguous for RefreshAnimation.

        CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.fromValue = @0.485;
        strokeEndAnimation.toValue = @0.985;

        animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
    }
    
@end
