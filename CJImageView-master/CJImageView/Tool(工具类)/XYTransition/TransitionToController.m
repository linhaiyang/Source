//
//  TransitionToController.m
//  CJImageView
//
//  Created by shengkai li on 2020/12/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "TransitionToController.h"
#import "XYTransitionProtocol.h"

@interface TransitionToController ()<XYTransitionProtocol>
@property(nonatomic,strong)UIImageView * baseImage;

@end

@implementation TransitionToController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage * testImage = [UIImage imageNamed:@"test_image_2"];
    self.baseImage = [[UIImageView alloc]initWithImage:testImage];
    self.baseImage.frame = CGRectMake(0, 0, KScreen_Width(), KScreen_Width()*testImage.size.height/testImage.size.width);
    [self.view addSubview:_baseImage];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
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
