//
//  DashLineView.m
//  QuYiBao_iOS
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "DashLineView.h"

@implementation DashLineView

- (instancetype)initWithFrame:(CGRect)frame withLineLength:(NSInteger)lineLength withLineSpacing:(NSInteger)lineSpacing withLineColor:(UIColor *)lineColor{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _lineLength = lineLength;
        _lineSpacing = lineSpacing;
        _lineColor = lineColor;
        _height = frame.size.height;
//        [self makeBezierPath];
    }
    return self;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self makeBezierPath];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
        if (self) {
            self.backgroundColor = [UIColor whiteColor];
            self.translatesAutoresizingMaskIntoConstraints = NO;
//            _lineLength = lineLength;
//            _lineSpacing = lineSpacing;
//            _lineColor = lineColor;
//            _height = frame.size.height;
            [self makeBezierPath];
        }
        return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"%f  %f  %f  %f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    // Drawing code
//    CGContextRef context =UIGraphicsGetCurrentContext();
    
//    CGContextBeginPath(context);
//    CGContextSetLineWidth(context,10);
//    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
//    CGFloat lengths[] = {_lineLength,_lineSpacing};
//    CGContextSetLineDash(context, 0, lengths,2);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 0,_height);
//    CGContextStrokePath(context);
//    CGContextClosePath(context);
    
    //画一个正方形图形 没有边框/
//    CGContextSetRGBFillColor(context,0,0.25,0,0.5);
//
//    CGContextFillRect(context,CGRectMake(2,2,270,270));
//
//    CGContextStrokePath(context);

    //写文字
//   CGContextSetLineWidth(context,1.0);
//
//   CGContextSetRGBFillColor(context,0,0.25,0,0.5);
//
//   UIFont  *font =[UIFont boldSystemFontOfSize:11.0];
//
//   [@"fangyp" drawInRect:CGRectMake(40,40,80,20)withFont:font];
    
//    画一条线

//    CGContextSetRGBStrokeColor(context,0.5,0.5,0.5,0.5);//线条颜色
//
//    CGContextMoveToPoint(context,20,20);
//
//    CGContextAddLineToPoint(context,200,20);
//
//    CGContextStrokePath(context);
 
      //获取上下文  UIBezierPath 路径
        CGContextRef ctx = UIGraphicsGetCurrentContext();
//        //或者绘图路径对象（可以了理解为画笔）
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
//        //绘图
//        [bezierPath moveToPoint:CGPointMake(50, 50)];
//        //通过控制点（ControlPoint来改变直线的弧度)
//        [bezierPath addQuadCurveToPoint:CGPointMake(250, 250) controlPoint:CGPointMake(50, 250)];
//        [bezierPath addLineToPoint:CGPointMake(250, 20)];
//    /**********设置上下文的状态***********/
//        CGContextSetLineWidth(ctx, 10);
//        CGContextSetLineJoin(ctx, kCGLineJoinRound);
//        CGContextSetLineCap(ctx, kCGLineCapRound);
//        //改变路径颜色
//        [[UIColor redColor] setStroke];
//    /***********************************/
//        //把路径添加到上下文
//        CGContextAddPath(ctx, bezierPath.CGPath);
//        //渲染上下文(layer)
//        CGContextStrokePath(ctx);
    /*
    NSString *str = @"HELLO";
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    mutableDict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    mutableDict[NSForegroundColorAttributeName]  = [UIColor blueColor];
    mutableDict[NSStrokeColorAttributeName] = [UIColor redColor];
    mutableDict[NSStrokeWidthAttributeName]  = @5;
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(5, 5);
    shadow.shadowColor = [UIColor yellowColor];
    mutableDict[NSShadowAttributeName] = shadow;
    //drawInRect 会匹配内容，绘图适配
    [str drawInRect:rect withAttributes:mutableDict];
    
    */
}

-(void)makeBezierPath{
    /**
        CAShapeLayer属于QuartzCore框架，继承自CALayer。CAShapeLayer是在坐标系内绘制贝塞尔曲线的，通过绘制贝塞尔曲线，设置shape(形状)的path(路径)，从而绘制各种各样的图形以及不规则图形。因此，使用CAShapeLayer需要与UIBezierPath一起使用。
        UIBezierPath对象(贝塞尔曲线)，它是CGPathRef数据类型的封装
        CAShapeLayer是一个通过矢量图形而不是bitmap来绘制的图层子类。
       
        相对于Core Graphics绘制图片，使用CAShapeLayer有以下一些优点:
        1、渲染快速。CAShapeLayer使用了硬件加速(使用CPU渲染)，绘制同一图形会比用Core Graphics快很多
        2、高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存
        3、不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。
        */
//    UIBezierPath *linePath = [UIBezierPath bezierPath];
//       // 起点
//       [linePath moveToPoint:CGPointMake(100, 100)];
//       // 其他点
//       [linePath addLineToPoint:CGPointMake(160, 160)];
//       [linePath addLineToPoint:CGPointMake(180, 120)];
       
     //绘制矩形
//     UIBezierPath *linePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    
    //绘制圆形路径
//    UIBezierPath *linePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    //指定矩形某一个角加圆角（代码示例为左上角）
//    UIBezierPath *linePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(30, 50)];
    UIBezierPath* linePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:25 startAngle:(CGFloat) (M_PI*3/2) endAngle:(CGFloat) (M_PI/2+M_PI*5) clockwise:YES];
       CAShapeLayer *lineLayer = [CAShapeLayer layer];
       lineLayer.lineWidth = 3;
    lineLayer.contentsScale = [[UIScreen mainScreen] scale];
    lineLayer.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
       lineLayer.strokeColor = HEXCOLOR(0x68ccf6).CGColor;
    lineLayer.lineCap = kCALineCapRound;//// 线端点的样式
    lineLayer.lineJoin = kCALineJoinBevel;//// 线拐点的样式
       lineLayer.path = linePath.CGPath;
       lineLayer.fillColor = nil; // 默认为blackColor
       
       [self.layer addSublayer:lineLayer];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.contents = (__bridge id)[[UIImage imageNamed:@"MBProgressHUD.bundle/angle-mask"] CGImage];
    maskLayer.frame = lineLayer.bounds;
//    lineLayer.mask = maskLayer;
    
   
    NSTimeInterval animationDuration = 1;
    CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = (id) 0;
    animation.toValue = @(M_PI*2);
    animation.duration = animationDuration;
    animation.timingFunction = linearCurve;
    animation.removedOnCompletion = NO;
    animation.repeatCount = INFINITY;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
//    [lineLayer.mask addAnimation:animation forKey:@"rotate"];

    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = animationDuration;
    animationGroup.repeatCount = INFINITY;
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = linearCurve;

    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @0.015;
    strokeStartAnimation.toValue = @0.515;

    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @0.485;
    strokeEndAnimation.toValue = @0.985;

    animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
    [lineLayer addAnimation:animationGroup forKey:@"progress"];
     
}
/**coreAnimation*/
- (void)cancelIndefiniteAnimatedViewAnimation {
    // Stop animation
//    if([self.indefiniteAnimatedView respondsToSelector:@selector(stopAnimating)]) {
//        [(id)self.indefiniteAnimatedView stopAnimating];
//    }
//    // Remove from view
//    [self.indefiniteAnimatedView removeFromSuperview];
}

-(CGSize)intrinsicContentSize{//translatesAutoresizingMaskIntoConstraints
//    [super intrinsicContentSize];
    CGFloat contentViewH = 165;
    CGFloat contentViewW = 165;
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
}
@end
