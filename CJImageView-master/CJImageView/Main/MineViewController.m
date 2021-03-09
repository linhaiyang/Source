//
//  MineViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "MineViewController.h"
#import "PropertyController.h"
#import "UITableViewCell+Tool.h"
#import "RACObserveController.h"
#import "UploadImagesViewController.h"
//#import "IJKPlayerController.h"
#import "TransitionController.h"
#import "KeyBoardManagerController.h"
#import "UIViewController+MJPopupViewController.h"
#import "AAPLCustomPresentationController.h"
//导入音视频框架
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray             *dataArray;
@property (nonatomic,strong) UITableView         *myTableView;
@property (nonatomic, strong) NSNumber * y;
@end

@implementation MineViewController
/**
 @throw [NSException exceptionWithName:@"YYDiskCache init error" reason:@"YYDiskCache must be initialized with a path. Use 'initWithPath:' or 'initWithPath:inlineThreshold:' instead." userInfo:nil];
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber *number1 = @1;
    NSLog(@"bigNumber pointer is %p", number1);
    
    NSString * x = @"可复用的滚动子视图可复用的滚动子视图可复用的滚动子视图可复用的滚动子视图可复用的滚动子视图";
    NSLog(@"bigNumber pointer is-x %p", x);
//    self.fd_prefersNavigationBarHidden = false;
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"功能导航";
    if (!self.dataArray) {
        self.dataArray=[NSMutableArray arrayWithArray:@[@"WebViewController]",@"AfnRequest--SDwebImage",@"UploadImagesViewController",@"RACObserveController",@"KeyBoardManagerController",@"TransitionController",@"openURL",@"IJKPlayerController",@"AVPlayerViewController",@"二维码",@"照片上传",@"照片上传附带进度",@"字体适配机型",@"日志记录",@"列表倒计时",@"H5交互WebViewJavascriptBridge",@"继承BaseViewController运用",@"列表空白页展现",@"省市区三级联动",@"自定义弹出窗",@"YYText富文本实例",@"列表行展开跟回收隐藏",@"常见表单行类型" ,@"人脸识别注册及验证",@"JavaScriptCore运用",@"Masonry布局实例",@"键盘处理操作",@"自定义导航栏动态显现效果",@"列表只加载显示时Cell的SDWebImage图",@"长按列表行拖动效果",@"关于FDFullscreenPopGesture的运用",@"可复用的滚动子视图",@"音视频功能集合",@"自定义日期选择控件",@"滚动视图"]];
    }
    self.tableV = [self.view addTableViewDelegate:self];
    [self.tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
//    self.fd_prefersNavigationBarHidden = true;
//    if (@available(iOS 11.0, *)) {
//        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        // Fallback on earlier versions table
//    }
//    [self.view configBlankPage:EaseBlankPageTypeView hasData:false hasError:false reloadButtonBlock:^(id sender) {
//
//    }];
//    self.tableV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//
//    }];
//    [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//
//    }];
    [self.tableV headerWithRefreshingBlock:^{
            
    } footerWithRefreshingBlock:nil refreshApi:[BaseRequestService new]];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell registerCell:tableView];
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text   = self.dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * title = [self.dataArray objectAtIndex:indexPath.row];
    if ([title containsString:@"WebViewController"]) {
        RootWebViewController * controller = [[RootWebViewController alloc]initWithUrl:@"https://itunes.apple.com/cn/app/id414478124?mt=8"];
        [self.navigationController pushViewController:controller animated:YES];
    }else if ([title containsString:@"AfnRequest--SDwebImage"]){
        PropertyController * controller = [PropertyController new];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if ([title containsString:@"UploadImagesViewController"]){
        UploadImagesViewController * controller = [UploadImagesViewController new];
        [self.navigationController pushViewController:controller animated:YES];
    }else if ([title containsString:@"RACObserveController"]){
        RACObserveController * controller = [RACObserveController new];
        [self.navigationController pushViewController:controller animated:YES];
    }else if ([title containsString:@"openURL"]){
        NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/id414478124?mt=8"];
        [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@1} completionHandler:^(BOOL success) {
            if (!success) {
                RootWebViewController * controller = [[RootWebViewController alloc]initWithUrl:@"http://store.asus.com.cn/wap/index"];
                [self.navigationController pushViewController:controller animated:YES];
            }
        }];
        CALayer * layer;
        /**
         控制台输入错误信息：-canOpenURL: failed for URL: “XXX://” - error: “This app is not allowed to query for scheme XXX”
         此处XXX为泛指，当应用集成了分享到多个平台的功能时，XXX部分就有可能会出现多条记录。虽然有很多，但是也不用方。

         解决方案：
         在Info.plist文件里建立LSApplicationQueriesSchemes，类型为Array，再将XXX部分提示的词汇一个一个添加进去，直到控制台不再输出相关信息为止。
         
         */
        
    }else if ([title containsString:@"KeyBoardManagerController"]){
        KeyBoardManagerController * controller = [KeyBoardManagerController new];
        [self.navigationController pushViewController:controller animated:YES];
    }else if ([title containsString:@"TransitionController"]){
        TransitionController * controller = [TransitionController new];
        [self presentPopupViewController:controller animationType:MJPopupViewAnimationSlideRightRight backgroundTouch:YES dismissed:^{

        }];
        AAPLCustomPresentationSecondViewController * secondViewController = [AAPLCustomPresentationSecondViewController new];
        AAPLCustomPresentationController*presentationController = [[AAPLCustomPresentationController alloc] initWithPresentedViewController:secondViewController presentingViewController:self];
        
        secondViewController.transitioningDelegate = presentationController;
        
        [self presentViewController:secondViewController animated:YES completion:NULL];
        
//        [self.navigationController pushViewController:controller animated:YES];
    }else if([title containsString:@"IJKPlayerController"]){
        Class class = NSClassFromString(@"IJKPlayerController");
        UIViewController * controller = [class new];
        [self.navigationController pushViewController:controller animated:YES];
        
    }else if([title containsString:@"AVPlayerViewController"]){
        //    网址字符串
            NSString *playerStr = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
        //    网址
            NSURL *playerURL = [NSURL URLWithString:playerStr];
        //    初始化音视频控制器
        AVPlayerViewController*playerVC = [[AVPlayerViewController alloc] init];
        //    视频链接
            AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:playerURL];
        //    初始化音视频
        AVPlayer*player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
        //    初始化音视频的播放层layer
            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        //    layer的frame
            playerLayer.frame = CGRectMake(0, 100, self.view.frame.size.width, 300);
        //    设置提示(可设置layer的背景等)
        //    设置视频填充模式(AVLayerVideoGravityResize,等比例全部填充播放)
            playerLayer.videoGravity = AVLayerVideoGravityResize;
        //    音视频的layer层添加到视图上
            [self.view.layer addSublayer:playerLayer];
        //    设置音视频为音视频控制器的内部音视频
            playerVC.player = player;
        //    关闭音视频控制器的内部约束,设置为自动布局
            /**
             默认情况下,autoresizing面具一个视图产生约束完全确定视图的位置。这允许自动布局系统跟踪的框架意见布局是手动控制(例如,通过-setFrame:)。当你选择使用自动布局位置视图通过添加自己的约束,你必须设置该属性。IB会为你这样做。
             */
            playerVC.view.translatesAutoresizingMaskIntoConstraints = YES;
        
//        显示音视频控制器
          [self showViewController:playerVC sender:nil];
    }else{
        if ([self.tableV.mj_header isRefreshing]) {
            [self.tableV.mj_header endRefreshing];
        }else{
            [self.tableV.mj_header beginRefreshing];
        }
        
}
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CFRunLoopRef ref;
//    Dlog(@"%@-----current",[NSRunLoop currentRunLoop].currentMode);
}
@end
