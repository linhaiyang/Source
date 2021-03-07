//
//  CustomerController.m
//  CJImageView
//
//  Created by shengkai li on 2021/3/4.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "CustomerController.h"
#import "MainTabBarController.h"
#import "YYControl.h"

@protocol WBStatusCellDelegate <NSObject>
@optional
- (void)cellDidClickCard;
@end

@interface customerControllerView : UIView

@end



@implementation customerControllerView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    _trackingTouch = NO;
//    UITouch *t = touches.anyObject;
//    CGPoint p = [t locationInView:_bView];
//    if (CGRectContainsPoint(_bView.bounds, p)) {
//        _trackingTouch = YES;
//        _bView.backgroundColor = HEXCOLOR(f0f0f0);//
//
//    }
    Dlog(@"touchesBegan");
    self.backgroundColor = HEXCOLOR(f0f0f0);//
//    if (!_trackingTouch) {
//        [super touchesBegan:touches withEvent:event];
//    }
//    self.backgroundColor = kWBCellInnerViewHighlightColor;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = HEXCOLOR(f7f7f7);
//    [self.viewController performSelector:@selector(fadeRootController)];
//    if (_trackingTouch) {
//        [self fadeRootController];
//    }
//    else{
//        [super touchesEnded:touches withEvent:event];
//    }
//    if ([_cell.delegate respondsToSelector:@selector(cellDidClickCard:)]) {
//        [_cell.delegate cellDidClickCard:_cell];
//    }
    Dlog(@"touchesEnded");

}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

//    if (!_trackingTouch) {
//        [super touchesCancelled:touches withEvent:event];
//    }
//    self.backgroundColor = HEXCOLOR(f7f7f7);
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(setBackgroundColor:) object:HEXCOLOR(f7f7f7)];
//    self.backgroundColor = HEXCOLOR(f7f7f7);
    Dlog(@"touchesCancelled");


//    self.backgroundColor = _isRetweet ? [UIColor whiteColor] : kWBCellInnerViewColor;
}

@end

@interface CustomerController ()
{
    customerControllerView   * _bView;
    BOOL _trackingTouch;
}
@end

@implementation CustomerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
    customerControllerView * bgView = [[customerControllerView alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, 50)];
    bgView.backgroundColor = HEXCOLOR(f7f7f7);
    bgView.exclusiveTouch = YES;
    [self.view addSubview:bgView];
//    _bView = bgView;
    bgView.userInteractionEnabled = true;
//    __block  UIView * blockView = bgView;
//    YYGestureRecognizer *gesture = [YYGestureRecognizer new];
//    [bgView addGestureRecognizer:gesture];
//    gesture.action = ^(YYGestureRecognizer *gesture, YYGestureRecognizerState state) {
//        if (state == YYGestureRecognizerStateCancelled) {
//            Dlog(@"YYGestureRecognizerStateCancelled");
//
//        }else if (state == YYGestureRecognizerStateEnded){
//            Dlog(@"YYGestureRecognizerStateEnded");
//
//        }else if (state == YYGestureRecognizerStateBegan){
//            Dlog(@"YYGestureRecognizerStateBegan");
//        }else if (state == YYGestureRecognizerStateMoved){
//            Dlog(@"YYGestureRecognizerStateMoved");
//        }
//    };
    
//    [bgView addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
////        blockView.backgroundColor = HEXCOLOR(f0f0f0);
//        if (recognizer.state == UIGestureRecognizerStateBegan) {
//            Dlog(@"YYGestureRecognizerStateBegan");
//        }else if (recognizer.state == UIGestureRecognizerStateCancelled){
////            [NSObject cancelPreviousPerformRequestsWithTarget:blockView selector:@selector(setBackgroundColor:) object:HEXCOLOR(f0f0f0)];
////            blockView.backgroundColor = HEXCOLOR(f7f7f7);
//            Dlog(@"YYGestureRecognizerStateCancelled");
//        }else if (recognizer.state == UIGestureRecognizerStateEnded){
////            [NSObject cancelPreviousPerformRequestsWithTarget:blockView selector:@selector(setBackgroundColor:) object:HEXCOLOR(f0f0f0)];
////            blockView.backgroundColor = HEXCOLOR(f7f7f7);
////            [self fadeRootController];
//            Dlog(@"UIGestureRecognizerStateEnded");
//        }
//        Dlog(@"UIGestureRecognizerStateEnded-------");
//    }];
    
    UITapGestureRecognizer *tg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    tg.numberOfTapsRequired = 1;
    tg.numberOfTouchesRequired = 1;
    [bgView addGestureRecognizer:tg];
    
    //（是否取消向事件响应链传递）：默认 YES，自定义的手势响应后，系统手势不再响应
//    ，但自定义手势识别前，会先执行系统手势。设置为 NO 后，自定义手势和系统手势会同时识别响应。
    tg.cancelsTouchesInView = true;

    //（延迟响应链的识别）：
//    默认 NO，先执行响应链中的方法（系统方法），识别到自定义手势后，不再执行系统方法。
//    设置为 YES 后，优先识别自定义手势，当自定义手势识别失败后才会响应系统方法
    tg.delaysTouchesBegan = false;


    
    
    //    UITapGestureRecognizer *tg2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandlerTwo:)];
//    tg2.numberOfTapsRequired = 2;
//    tg2.numberOfTouchesRequired = 1;
//    [bgView addGestureRecognizer:tg2];
//
//    UITapGestureRecognizer *tg3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandlerthree:)];
//    tg3.numberOfTapsRequired = 3;
//    tg3.numberOfTouchesRequired = 1;
//    [bgView addGestureRecognizer:tg3];
//
//    [tg2 requireGestureRecognizerToFail:tg3];
//    [tg requireGestureRecognizerToFail:tg2];
    
    //    bgView.touchBlock = ^(YYControl *view, YYGestureRecognizerState state, NSSet *touches, UIEvent *event) {
    //        if (state == YYGestureRecognizerStateCancelled) {
    //                    Dlog(@"YYGestureRecognizerStateCancelled");
    //
    //                }else if (state == YYGestureRecognizerStateEnded){
    //                    Dlog(@"YYGestureRecognizerStateEnded");
    ////                    [self fadeRootController];
    //                }else if (state == YYGestureRecognizerStateBegan){
    //                    Dlog(@"YYGestureRecognizerStateBegan");
    //                }else if (state == YYGestureRecognizerStateMoved){
    //                    Dlog(@"YYGestureRecognizerStateMoved");
    //                }
    //    };
}
-(void)tapHandler:(UITapGestureRecognizer *)tap{
    Dlog(@"tap1");
}
-(void)tapHandlerTwo:(UITapGestureRecognizer *)tap{
    Dlog(@"tap2");
}
-(void)tapHandlerthree:(UITapGestureRecognizer *)taptapHandlerthree{
    Dlog(@"tap3");
}
-(void)fadeRootController{
    MainTabBarController*mainTabBar = [MainTabBarController new];
    //UIViewAnimationTransition
//    CATransition *anima = [CATransition animation];//CATransaction事务 Transition过渡
//    /**The name of the transition. Current legal transition types include
//     * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. */
//    anima.type =kCATransitionFade;// @"cube" 设置动画的类型
////    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 0.3f;
//    anima.removedOnCompletion = true;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = kCATransitionPush;
//    [layer addAnimation:transition forKey:@"contents"];
//    5.动画切换方向
    transition.subtype = kCATransitionFromTop;//顶部
    self.view.window.rootViewController = mainTabBar;
    [self.view.window.layer addAnimation:transition forKey:@"revealAnimation"];
    [self.view.window.layer addFadeAnimationWithDuration:0.5 curve:UIViewAnimationCurveEaseOut];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
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
