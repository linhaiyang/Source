//
//  MineViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "MineViewController.h"
#import "YYFPSLabel.h"
#import "PropertyController.h"
#import "UITableViewCell+Tool.h"
#import "RACObserveController.h"
#import "UploadImagesViewController.h"

//#import "IJKPlayerController.h"
@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray             *dataArray;
@property (nonatomic,strong) UITableView         *myTableView;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

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
//    self.fd_prefersNavigationBarHidden = false;
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"功能导航";
    if (!self.dataArray) {
        self.dataArray=[NSMutableArray arrayWithArray:@[@"WebViewController]",@"AfnRequest--SDwebImage",@"UploadImagesViewController",@"RACObserveController",@"IJKPlayerController",@"JSPatch热更新[已被禁止]",@"LKDB数据库运用",@"百度地图",@"二维码",@"照片上传",@"照片上传附带进度",@"字体适配机型",@"日志记录",@"列表倒计时",@"H5交互WebViewJavascriptBridge",@"继承BaseViewController运用",@"列表空白页展现",@"省市区三级联动",@"自定义弹出窗",@"YYText富文本实例",@"列表行展开跟回收隐藏",@"常见表单行类型" ,@"人脸识别注册及验证",@"JavaScriptCore运用",@"Masonry布局实例",@"键盘处理操作",@"自定义导航栏动态显现效果",@"列表只加载显示时Cell的SDWebImage图",@"长按列表行拖动效果",@"关于FDFullscreenPopGesture的运用",@"可复用的滚动子视图",@"音视频功能集合",@"自定义日期选择控件",@"滚动视图"]];
    }
    self.tableV = [self.view addTableViewDelegate:self];
    [self.tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
//    self.fd_prefersNavigationBarHidden = true;
    if (!_fpsLabel) {
        _fpsLabel = [YYFPSLabel new];
        _fpsLabel.frame=CGRectMake(20, 80, 30, 30);
        [_fpsLabel sizeToFit];
        _fpsLabel.alpha = 0.6;
        [self.view addSubview:_fpsLabel];
    }
    if (@available(iOS 11.0, *)) {
//        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
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
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * title = [self.dataArray objectAtIndex:indexPath.row];
    if ([title containsString:@"WebViewController"]) {
        RootWebViewController * controller = [[RootWebViewController alloc]initWithUrl:@"https://storetest.quyibao.com/store/activity/cut/index.html?id=51"];
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
    }else if ([title containsString:@"IJKPlayerController"]){
//        IJKPlayerController * controller = [IJKPlayerController new];
//        [self.navigationController pushViewController:controller animated:YES];
    }else{
        if ([self.tableV.mj_header isRefreshing]) {
            [self.tableV.mj_header endRefreshing];
        }else{
            [self.tableV.mj_header beginRefreshing];
        }
}
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CFRunLoopRef ref;
//    Dlog(@"%@-----current",[NSRunLoop currentRunLoop].currentMode);
}
@end
