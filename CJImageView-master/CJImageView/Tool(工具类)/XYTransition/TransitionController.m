//
//  TransitionController.m
//  CJImageView
//
//  Created by shengkai li on 2020/12/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "TransitionController.h"
#import "XYTransitionProtocol.h"
#import "XYTransition.h"
#import "TransitionToController.h"

@interface TransitionController ()<XYTransitionProtocol,UINavigationControllerDelegate>
@property(nonatomic,strong)UIImageView * baseImage;
@property (nonatomic, readonly) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;
/** Property indicating the duration of the animation, default is 1.5s. Should be set prior to -[startAnimating] */
@property (nonatomic, readwrite) NSTimeInterval duration;

@property (nonatomic, readonly) CAShapeLayer *layer;
@end

@implementation TransitionController
@synthesize progressLayer=_progressLayer;
@synthesize layer=_layer;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    CALayer * imgLayer = [CALayer new];
    imgLayer.position=CGPointMake(200, NavBarHeight()+100);;
    imgLayer.bounds =  CGRectMake(0, 0, 50, 50);
    UIImage * img = [UIImage imageNamed:@"test_image_2"];
    imgLayer.contents = (__bridge id _Nullable)(img.CGImage);
    [self.view.layer addSublayer:imgLayer];
    
//    UIImage * testImage = [UIImage imageNamed:@"test_image_2"];
//    self.baseImage = [[UIImageView alloc]initWithImage:testImage];
//    self.baseImage.frame = CGRectMake(0, KNavHeight+100, testImage.size.width/4, testImage.size.height/4);
//    [self.view addSubview:_baseImage];
//    self.baseImage.userInteractionEnabled = true;
//    @weakify(self);
//    [self.baseImage addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
//        @strongify(self);
//        TransitionToController * controller = [TransitionToController new];
//        [self.navigationController pushViewController:controller animated:YES];
//    }];
    self.view.backgroundColor = UIColor.whiteColor;
    _timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    self.duration = 1.5f;
    
    self.progressLayer.frame = CGRectMake(0, 0, KScreen_Width(), KScreen_Height());
    [self updatePath];
    [self.view.layer addSublayer:self.progressLayer];
    [self layerAnimation];
    
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,70,30)];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(keyFrameAnimate)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
    
    _layer = [CAShapeLayer layer];
//    layer.contents =
    _layer.position=CGPointMake(300, 300);;
    _layer.bounds =  CGRectMake(0, 0, 50, 50);
    _layer.strokeColor = UIColor.blueColor.CGColor;
    _layer.lineWidth = 1.5f;
    [self.view.layer addSublayer:_layer];
    CGPoint center = CGPointMake(_layer.bounds.size.width/2, _layer.bounds.size.height/2);

    CGFloat radius = _layer.bounds.size.width/2;
    CGFloat startAngle = (CGFloat)(0);
    CGFloat endAngle = (CGFloat)(2*M_PI);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    _layer.path = path.CGPath;

    _layer.strokeStart = 0.f;
    _layer.strokeEnd = 1.f;
//    _layer.backgroundColor=[UIColor redColor].CGColor;
//    UIImage * img = [UIImage imageNamed:@"test_image_2"];
//    _layer.contents = (__bridge id _Nullable)(img.CGImage);
    
//    self.layer = layer;
}
-(instancetype)init{
   self =  [super init];
    
    return self;
}
- (CAShapeLayer *)progressLayer {
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.strokeColor = UIColor.blueColor.CGColor;
        _progressLayer.fillColor = nil;
        _progressLayer.lineWidth = 1.5f;
    }
    return _progressLayer;
}

-(void)keyFrameAnimate{
    
    CAKeyframeAnimation * animate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef ref = CGPathCreateMutable();
    CGPathMoveToPoint(ref, nil, 20, 20);
    CGPathAddCurveToPoint(ref, nil, 160, 30, 220, 220, 240, 380);
    animate.path = ref;
    animate.duration = 10.f;
    animate.timingFunction = self.timingFunction;
    animate.rotationMode = @"auto";
    [self.layer addAnimation:animate forKey:nil];
}

- (void)updatePath {
    CGPoint center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    
    CGFloat radius = MIN(CGRectGetWidth(self.view.bounds) / 6, CGRectGetHeight(self.view.bounds) / 6) - self.progressLayer.lineWidth / 2;
    CGFloat startAngle = (CGFloat)(0);
    CGFloat endAngle = (CGFloat)(2*M_PI);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    self.progressLayer.path = path.CGPath;
    
    self.progressLayer.strokeStart = 0.f;
    self.progressLayer.strokeEnd = 0.f;
}
-(void)layerAnimation{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 1.5/ 0.375f;
    animation.fromValue = @(0.f);
    animation.toValue = @(2 * M_PI);
    animation.repeatCount = INFINITY;
    animation.removedOnCompletion = NO;
    [self.progressLayer addAnimation:animation forKey:@"rotation"];
    
    CABasicAnimation *headAnimation = [CABasicAnimation animation];
    headAnimation.keyPath = @"strokeStart";
    headAnimation.duration = self.duration / 1.5f;
    headAnimation.fromValue = @(0.f);
    headAnimation.toValue = @(0.25f);
    headAnimation.timingFunction = self.timingFunction;
    
    CABasicAnimation *tailAnimation = [CABasicAnimation animation];
    tailAnimation.keyPath = @"strokeEnd";
    tailAnimation.duration = self.duration / 1.5f;
    tailAnimation.fromValue = @(0.f);
    tailAnimation.toValue = @(1.f);
    tailAnimation.timingFunction = self.timingFunction;
    
    CABasicAnimation *endHeadAnimation = [CABasicAnimation animation];
    endHeadAnimation.keyPath = @"strokeStart";
    endHeadAnimation.beginTime = self.duration / 1.5f;
    endHeadAnimation.duration = self.duration / 3.0f;
    endHeadAnimation.fromValue = @(0.25f);
    endHeadAnimation.toValue = @(1.f);
    endHeadAnimation.timingFunction = self.timingFunction;
    
    CABasicAnimation *endTailAnimation = [CABasicAnimation animation];
    endTailAnimation.keyPath = @"strokeEnd";
    endTailAnimation.beginTime = self.duration / 1.5f;
    endTailAnimation.duration = self.duration / 3.0f;
    endTailAnimation.fromValue = @(1.f);
    endTailAnimation.toValue = @(1.f);
    endTailAnimation.timingFunction = self.timingFunction;
     
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    [animations setDuration:self.duration];
    [animations setAnimations:@[headAnimation, tailAnimation, endHeadAnimation, endTailAnimation]];//
    animations.repeatCount = INFINITY;
    animations.removedOnCompletion = NO;
    [self.progressLayer addAnimation:animations forKey:@"Stroke"];
    
    /*
    CATransition *anima = [CATransition animation];
    anima.timingFunction = UIViewAnimationCurveEaseInOut;//过程
    anima.type =  @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 0.3f;
    
//    self.window.rootViewController = self.mainTabBar;
    
    [self.view.layer addAnimation:anima forKey:@"revealAnimation"];
    */
    /* 动画的类型
fade     //交叉淡化过渡(不支持过渡方向)
push     //新视图把旧视图推出去
moveIn   //新视图移到旧视图上面
reveal   //将旧视图移开,显示下面的新视图
cube     //立方体翻滚效果
oglFlip  //上下左右翻转效果
suckEffect   //收缩效果，如一块布被抽走(不支持过渡方向)
rippleEffect //滴水效果(不支持过渡方向)
pageCurl     //向上翻页效果
pageUnCurl   //向下翻页效果
cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向)
cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
*/
    
}

-(void)uiviewAnimation{
    
    
    
    
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    XYTransition * transition = [XYTransition new];
    transition.isPush = true;
    if (operation == UINavigationControllerOperationPop) {
        return nil;
    }
    return transition;
}

/**
 转场动画的目标View 需要转场动画的对象必须实现该方法并返回要做动画的View

 @return view
 */
-(UIView *)targetTransitionView{
    return self.baseImage;
}


/**
 *  是否是需要实现转场效果，不需要转场动画可不实现，需要必须实现并返回YES
 *
 *  @return 是否
 */
-(BOOL)isNeedTransition{
    return true;
}
@end
