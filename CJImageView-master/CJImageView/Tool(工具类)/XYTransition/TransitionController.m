//
//  TransitionController.m
//  CJImageView
//
//  Created by shengkai li on 2020/12/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "TransitionController.h"
#import "XYTransitionProtocol.h"
@interface TransitionController ()<XYTransitionProtocol>
@property(nonatomic,strong)UIImageView * baseImage;
@end

@implementation TransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"test_image_2"]];
    self.baseImage.frame = CGRectMake(10, 100, 100, 100);
    [self.view addSubview:_baseImage];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    
    
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,70,30)];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(layerAnimation)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}
-(void)layerAnimation{
    CATransition *anima = [CATransition animation];
    anima.timingFunction = UIViewAnimationCurveEaseInOut;//过程
    anima.type =  @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 0.3f;
    
//    self.window.rootViewController = self.mainTabBar;
    
    [self.view.layer addAnimation:anima forKey:@"revealAnimation"];
    
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
