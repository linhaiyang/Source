//
//  ViewController.m
//  CJImageView
//
//  Created by C.K.Lian on 15/12/30.
//  Copyright © 2015年 C.K.Lian. All rights reserved.
//

#import "ViewController.h"
#import "DashLineView.h"
#import "MBProgressHUD+JJ.h"
#import "WJYAlertView.h"
#import "PropertyController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "BaseEntity.h"
#import "SYSafeCategory.h"
#import "MJRefreshLoadingHeader.h"
#import "BaseTableViewCell.h"
#import "TestViewController.h"
#import "RACObserveController.h"
#import "UITableView+RadiusStyle.h"
#import "IJKPlayerController.h"
#import "DismissVCAnimation.h"
#import "YMCardToViewController.h"
#import "CustomAlertView.h"
#import "NSString+Encrypt.h"
#import "NSData+Base64.h"
#import "MainTabBarController.h"

#define loadUrl @"http://mrobot.pcauto.com.cn/v2/cms/channels/1?pageNo=1&pageSize=400&v=4.0.0"
#define DECODE YES
NSString * const mainNotification = @"mainNotification";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate>

@property(nonatomic, strong) DashLineView * dashLine;
@property (nonatomic, strong) NSMutableString * objStr;
@property (nonatomic, copy) NSString * str;
@end
NSString*sttr1=@"S1ViewController";
@implementation ViewController
//@dynamic str;


//-(void)setStr:(NSString *)str{
////    _str = str;
//    Dlog(@"1111");
////    self.str = str;
//}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:KColorNavDefault];
    self.navigationController.navigationBar.translucent = false;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:KColorNavDefault] forBarMetrics:UIBarMetricsDefault];;
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.view setBackgroundColor:[UIColor orangeColor]];
}
/// <#Description#>
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
//    self.view.backgroundColor = [UIColor orangeColor];
//    [JDStatusBarNotification showWithStatus:@"驯鹿司机端正在获取您的配送轨迹" dismissAfter:3.0 styleName:JDStatusBarStyleWarning];
    self.str = @"123";
#ifdef Release
    
#endif
    if (ddLogLevel) {
        
    }
//    self.fd_prefersBarTintColor = [UIColor orangeColor];
//    age = 20;
//
//    NSLog(@"age = %ld", (long)age);
//    [UIApplication sharedApplication].keyWindow
//    [MBProgressHUD show:self.view];

//    imageView.clipsToBounds = YES;//切除溢出Imv的frame的部分
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [img drawInRect:self.view.bounds];
//    UIImage *bgImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
//    self.backgroundColor = [UIColor colorWithPatternImage:bgImage];
//    imageView.image = [img imageAddCornerWithRadius:30 andSize:imageView.frame.size];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    
    /**  CoreGraphics */
    
    //test code

//    UIButton * testObj = [[UIButton alloc] init];
//    [testObj performSelector:@selector(someMethod:)];
   
#if DEBUGMARK
    Dlog(@"测试环境");
#endif
//    self.fd_prefersNavigationBarHidden = true;
    Dlog(@"[UIScreen mainScreen]-%f",[UIScreen mainScreen].scale);
    self.tableV =[self.view addTableViewDelegate:self];

    self.tableV.rowHeight = 30.f;
    [self.tableV makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.top.equalTo(0);
    }];
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableV.separatorInset = UIEdgeInsetsZero;
    @weakify(self);
    self.tableV.mj_header = [MJRefreshLoadingHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @strongify(self);
//            [self showNewStatusesCount:5];
            [[GCDQueue mainQueue]execute:^{
                [self.tableV.mj_header endRefreshing];
            } afterDelaySecs:1.5];
            
        });
    }];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectOffset(CGRectMake(0, 0, KScreen_Width, KScreen_Height), 0, -KScreen_Height)];
            bgView.backgroundColor = [UIColor orangeColor];
            [self.tableV insertSubview:bgView atIndex:0];
    
    if ([DeviceTool isIPhoneX]) {
        
    }
//    self.fd_prefersBarTintColor = [UIColor clearColor];
//    self.fd_prefersNavigationBarHidden = true;
    
//    [self.tableV.mj_header beginRefreshing];

//    UserInfo * user = [UserInfo new];
//    user.userId = @"1";
//    GlobalUserInfo = user;
    if (GlobalisLogin) {
        Dlog(@"已经登陆%@",GlobalUserInfo.userId);
    }else{
        Dlog(@"未登录");
    }
    
    YYTextView * text = [[YYTextView alloc]init];
    text.placeholderText = @"";
    
    
    self.title = @"首页";
    
    NSDictionary * param  = @{@"1":@"keyValue",@"key":@"value"};
//    NSString * str = [param JSONString];
    
    NSString * str = @"123456789utf";
    NSData * data = [NSData dataWithBase64EncodedString:str];
    [data base64EncodedString];
////    NSString * entcry0 = [str encryptedWith3DESUsingKey:@"SVXZPTKB"];
    NSString * entcry = [str encryptUseDESkey:@"Xo823-dl230df23r.&"];
    NSString * entcry0 = [entcry
                          decryptedWith3DESUsingKey:@"Xo823-dl230df23r.&"];
//
//    Dlog(@"%@111--------------111%@+++++++%@",str,entcry,entcry0);
    
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(KScreen_Width/2, 100, 200, 200)];
//    [self.view addSubview:imageView];
    UIImage * img =[UIImage imageNamed:@"background"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = img;
    
//    self.tableV.transform  = CGAffineTransformMakeScale(-1, 1);
//    self.tableV.transform = CGAffineTransformMakeRotation(M_PI);
    
    
    [self mutableStringTest];
}
- (CAGradientLayer *)shadowAsInverse;
{
CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
//    newShadow.startPoint = CGPointMake(0, 0 );
//    newShadow.endPoint =  CGPointMake(100,100);
    CGRect newShadowFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    newShadow.frame = newShadowFrame;
 //添加渐变的颜色组合
newShadow.colors = [NSArray arrayWithObjects:(id)HEXCOLOR(0x333333).CGColor,
(id)HEXCOLOR(0x8100E8).CGColor,nil];
return newShadow;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /**
     A UITableViewCell object with the associated identifier or nil if no such object exists in the reusable-cell queue.
     */
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//    /**
//     Returns
//
//     A UITableViewCell object with the associated reuse identifier. This method always returns a valid cell.
//     注意：使用此方法从cell重用队列取cell的时候，必须在调用此方法之前注册class或者nib。
//     */
////   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
//    if (!cell) {
//        static int y;
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
//
//        cell.textLabel.text = @"147";
//    }
//    if (cell.imageView) {
//
//    }
    BaseTableViewCell * cell = [BaseTableViewCell registerCell:tableView];
    
//    Dlog(@"cellForRowAtIndexPath ------%ld",indexPath.row);
//    Dlog(@"%@-----%ld",cell.textLabel.text,indexPath.row);
    cell.textLabel.text = [NSString stringWithFormat:@"%ld----%@",indexPath.row,tableView.accessibilityIdentifier];
//    if (cell.imageView.sd_imageURL isEqual:<#(id)#>) {
//        <#statements#>
//    }
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView applyRadiusSettingsStyleGrouping:cell forRowAtIndexPath:indexPath];
//     Dlog(@"willDisplayCell ------%ld",indexPath.row);
//       if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }

}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    Dlog(@"scrollViewDidZoom");
}

-(void)mutableStringTest{
//        NSMutableString * str = [[NSMutableString alloc]init];
//        [str appendString:@"1"];
//    self.objStr = str;
//        [str appendString:@"2"];
//    Dlog(@"+++++%p  %@", self.objStr,_objStr);
//        Dlog(@"-----%p  %@  引用计数%@", str,str,[str valueForKey:@"retainCount"]);
    
//    NSMutableString * string = [NSMutableString stringWithString:@"string"];
//    self.str = string;
//    [string appendString:@"2"];
////    string = @"string2";
//    Dlog(@"+++++%p  %@", _str,_str);
//    Dlog(@"-----%p  %@  引用计数%@", string,string,[string valueForKey:@"retainCount"]);
      NSMutableString * str = [[NSMutableString alloc]init];
        [str appendString:@"1"];
        self.objStr = str;//用copy修饰的时候其实拷贝出来的一块内存区域是不可变,
        [self.objStr appendString:@"2"];
        str = [NSMutableString stringWithString:@"3"];
    
//        NSMutableString * str2 = _objStr;
//        [str2 appendString:@"3"];
    //
//        NSLog(@"%p", str2);
        NSLog(@"%p  %@", _objStr,_objStr);
        NSLog(@"%p  %@", str,str);
//        [self copyAssignTest];
    
//    GlobalInstance.systemVersion = @"123456";
////    @weakify(self);
//    [GCDQueue.globalQueue execute:^{
//        GlobalInstance.systemVersion = @"00123456";
//        Dlog(@"%@++++++++",GlobalInstance.systemVersion);
//    }];
//    [GCDQueue.mainQueue execute:^{
//        Dlog(@"%@-----",GlobalInstance.systemVersion);
//
//    } afterDelay:1];
    
}

/**
 */
-(void)copyAssignTest{
    NSMutableString*tempMStr = [[NSMutableString alloc]initWithString:@"strValue"];
    NSLog(@"tempMStr值地址:%p，tempMStr值%@,tempMStr值引用计数%@\\n", tempMStr,tempMStr,[tempMStr valueForKey:@"retainCount"]);

//    NSInteger tag = 10;
//    int b = 11;
//    NSString * c = @"0";
//    Dlog(@"%p   %p  %p",tag,b,c);
    
//
//
//    if (nullStr == nil) {
//
//    NSLog(@"nullStr打印输出结果是 <null>");
//
//     }
    
    NSString *nullStr;
    
    NSInteger dic;
    
    if (dic == NULL) {
        Dlog(@"--------%ld--------%@",dic,nullStr);
    }
    
    //输出tempMStr值C地址:0x7a05f650，tempMStr值strValue,tempMStr值引用计数1(而引用计数这个概念是针对C的，)
}
-(void)showAlertView{
    //    [WJYAlertView showTwoButtonsWithTitle:WJYAlertViewWillShowNotification Message:@"这里为提示的信息内容，里面会根据内容的高度进行计算，当大于弹出窗默认的高度时会自行适应高度(并自动转成UITextView来加载内容)" ButtonType:WJYAlertViewButtonTypeNone ButtonTitle:@"取消" Click:^{
    //                   NSLog(@"您点取消事件");
    //               } ButtonType:WJYAlertViewButtonTypeNone ButtonTitle:@"确定" Click:^{
    //                   NSLog(@"你点确定事件");
    //               }];
        
    //    [WJYAlertView showOneButtonWithTitle:@"信息提示" Message:@"你可以单独设置底部每个Button的样式，只要相应枚举进行调整，若不满足可以对针WJYAlertView源代码进行修改，增加相应的枚举类型及其代码" ButtonType:WJYAlertViewButtonTypeNone ButtonTitle:@"知道了" Click:^{
    //        NSLog(@"响应事件");
    //    }];
    
//    [WJYAlertView showOneButtonWithTitle:nil Message:@"你可以把Title设置为nil" ButtonType:WJYAlertViewButtonTypeNone ButtonTitle:@"知道了" Click:^{
//                   NSLog(@"响应事件");
//               }];
    
    
//    [WJYAlertView showTwoButtonsWithTitle:@"提示信息" Message:@"你可以设置ButtonType的样式来调整效果，而且还可以分开设置，更加灵活，不效果项目要求可以修改源代码" ButtonType:WJYAlertViewButtonTypeCancel ButtonTitle:@"取消" Click:^{
//        NSLog(@"您点取消事件");
//    } ButtonType:WJYAlertViewButtonTypeDefault ButtonTitle:@"确定" Click:^{
//        NSLog(@"你点确定事件");
//    }];
    
//    if ([self respondsToSelector:@selector(viewDidLoad)]) {
////        self forwardInvocation:<#(NSInvocation *)#>
//    }
    
//    [WJYAlertView showMultipleButtonsWithTitle:@"信息内容" Message:@"可以设置多个的Button,同样也是可以有不同的样式效果" Click:^(NSInteger index) {
//        NSLog(@"你点击第几个%zi", index);
//    } Buttons:@{@(WJYAlertViewButtonTypeDefault):@"确定"},@{@(WJYAlertViewButtonTypeCancel):@"取消"},@{@(WJYAlertViewButtonTypeWarn):@"知道了"}, nil];
    
//
//    //自定义视图
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 200)];
//    customView.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:customView];
//    [customView addCornerRedius:15];
//
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
//    [btn setTitle:@"点我关闭" forState:UIControlStateNormal];
//    btn.center = CGPointMake(120, 100);
//    [customView addSubview:btn];
//    [btn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 140, 140)];
    [self.view addSubview:imageView];
    UIImage * image = [UIImage imageNamed:@"angle-mask"];
//    UIImage * image03 = [image imageAddCornerWithRadius:30 andSize:CGSizeMake(140, 140)];
//    imageView.image = image03;
    
//
//    // dismissWhenTouchedBackground:NO表示背景蒙层没有关闭弹出窗效果
//    WJYAlertView*alertView = [[WJYAlertView alloc] initWithCustomView:customView dismissWhenTouchedBackground:NO];
//    [alertView show];
    
    CATextLayer * layer = [CATextLayer layer];
    layer.string = @"123456789";
    layer.fontSize = 15;
    layer.foregroundColor = [UIColor orangeColor].CGColor;
    layer.frame = CGRectMake(100, 300, 50, 30);
    layer.position = self.view.center;
//    layer.foregroundColor
    [self.view.layer addSublayer:layer];
}


//- (void)setObjStr: (NSMutableString*)objStr{
//      [_objStr release];   //把_ objStr以前的对象release一次
//      _objStr = [objStr copy]; // 把objStr 的对象拷贝一份给_ objStr
//    _objStr = objStr;
//}
//-(void)setStr:(NSString *)str{
//    _str = str;
//}

/**
 *  提示用户最新的微博数量
 *
 *  @param count 最新的微博数量
 */
/*
- (void)showNewStatusesCount:(int)count
{
    // 1.创建一个UILabel
    UILabel *label = [[UILabel alloc] init];

    // 2.显示文字
    if (count) {
        label.text = [NSString stringWithFormat:@"共有%d条新的微博数据", count];
    } else {
        label.text = @"没有最新的微博数据";
    }

    // 3.设置背景
    label.backgroundColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];

    // 4.设置frame
    CGFloat labelHeight = 35.0f;
    label.frame = CGRectMake(0, KNavHeight-labelHeight, KScreen_Width, labelHeight);
    // 5.添加到导航控制器的view
//    [self.navigationController.view addSubview:label];
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];

    // 6.动画
    CGFloat duration = 0.75;
//    label.alpha = 0.0;
    [UIView animateWithDuration:duration animations:^{
        // 往下移动一个label的高度
        label.transform = CGAffineTransformMakeTranslation(0, labelHeight);
//        label.alpha = 1.0;
    } completion:^(BOOL finished) { // 向下移动完毕

        // 延迟delay秒后，再执行动画
        CGFloat delay = 1.0;

        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{

            // 恢复到原来的位置
            label.transform = CGAffineTransformIdentity;
//            label.alpha = 0.0;

        } completion:^(BOOL finished) {

            // 删除控件
            [label removeFromSuperview];
        }];
    }];
    }
 */


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Dlog(@"initialize之前");
    if (indexPath.row == 0) {
//        CustomAlertView * custom = [CustomAlertView new];
////        __block CustomAlertView * blockAlert = custom;
//        [self presentViewController:custom animated:false completion:^{
//            [custom show];
//        }];
        TestViewController * controller = [TestViewController new];
//        [controller setNavigationBarBackgroundHidden:true animated:false];
        [self.navigationController pushViewController:controller animated:YES];
        return;
        
    }else if (indexPath.row == 1) {
            RACObserveController * controller = [RACObserveController new];
            [self.navigationController pushViewController:controller animated:YES];
        return;
    }else if (indexPath.row == 2) {
        IJKPlayerController * controller = [IJKPlayerController new];
        [self.navigationController pushViewController:controller animated:YES];
        return;
    }else if (indexPath.row == 3) {
        PropertyController * controller = [PropertyController new];
        [self.navigationController pushViewController:controller withTransition:UIViewAnimationTransitionCurlUp];
        return;
    }else if (indexPath.row == 4){
        PropertyController * controller = [PropertyController new];
        BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:controller];
        nav.LL_automaticallySetModalPresentationStyle = false;
        [self presentViewController:nav animated:true completion:nil];
    }else if (indexPath.row == 5){
        YMCardToViewController *vc = [YMCardToViewController new];
        YMCardPresentationController *presentationController = [[YMCardPresentationController alloc] initWithPresentedViewController:vc presentingViewController:self];
        vc.transitioningDelegate = presentationController;
        vc.LL_automaticallySetModalPresentationStyle = false;
        [self presentViewController:vc animated:YES completion:nil];
    }else if(indexPath.row == 6){
        MainTabBarController*mainTabBar = [MainTabBarController new];
        //UIViewAnimationTransition
        CATransition *anima = [CATransition animation];//CATransaction事务 Transition过渡
        /**The name of the transition. Current legal transition types include
         * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. */
        anima.type =@"cube";// @"cube" 设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 0.3f;
        anima.removedOnCompletion = true;
        [[UIApplication sharedApplication] delegate].window.rootViewController = mainTabBar;
        [[[UIApplication sharedApplication] delegate].window.layer addAnimation:anima forKey:@"revealAnimation"];

    }
    
//    Dlog(@"initialize之后");
//    controller.fd_prefersNavigationBarHidden = true;navigationBarBackgroundHidden
//    [self.navigationController pushViewController:controller animated:YES];
//    self.str = @"123";
    

  
    
//    [self.navigationController pushViewController:controller withTransition:UIViewAnimationTransitionFlipFromRight];
    
//    [self showViewController:controller sender:nil];
//    [self.navigationController pushViewController:controller withTransition:UIViewAnimationTransitionNone];
}
/// 设置Dismiss返回的动画设置
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[DismissVCAnimation alloc] init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+(void)runTest{
    Dlog(@"112111");
}
@end
