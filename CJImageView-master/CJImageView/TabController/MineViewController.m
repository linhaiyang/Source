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

@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSArray             *dataArray;
@property (nonatomic,strong) UITableView         *myTableView;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"功能导航";
    
    if (!self.dataArray) {
        self.dataArray=@[@"JSPatch热更新[已被禁止]",@"LKDB数据库运用",@"百度地图",@"二维码",@"照片上传",@"照片上传附带进度",@"字体适配机型",@"日志记录",@"列表倒计时",@"H5交互WebViewJavascriptBridge",@"继承BaseViewController运用",@"列表空白页展现",@"省市区三级联动",@"自定义弹出窗",@"YYText富文本实例",@"列表行展开跟回收隐藏",@"常见表单行类型" ,@"人脸识别注册及验证",@"JavaScriptCore运用",@"Masonry布局实例",@"键盘处理操作",@"自定义导航栏动态显现效果",@"列表只加载显示时Cell的SDWebImage图",@"长按列表行拖动效果",@"关于FDFullscreenPopGesture的运用",@"可复用的滚动子视图",@"音视频功能集合",@"自定义日期选择控件",@"滚动视图"];
    }
    //初始化表格
    if (!_myTableView) {
        _myTableView                                = [[UITableView alloc] initWithFrame:CGRectMake(0,0.5, KScreen_Width, KScreen_Height) style:UITableViewStylePlain];
        _myTableView.showsVerticalScrollIndicator   = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.dataSource                     = self;
        _myTableView.delegate                       = self;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [self.view addSubview:_myTableView];
        [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    
    if (!_fpsLabel) {
        _fpsLabel = [YYFPSLabel new];
        _fpsLabel.frame=CGRectMake(20, 80, 30, 30);
        [_fpsLabel sizeToFit];
        _fpsLabel.alpha = 0.6;
        [self.view addSubview:_fpsLabel];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text   = self.dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RootWebViewController * controller = [[RootWebViewController alloc]initWithUrl:@"https://storetest.quyibao.com/store/activity/cut/index.html?id=51"];
    [self.navigationController pushViewController:controller animated:YES];
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