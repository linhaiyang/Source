//
//  IJKPlayerController.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/17.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "IJKPlayerController.h"
#import "LMVideoPlayer.h"
#import "LMBrightnessView.h"
#define playUrl @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
@interface IJKPlayerController ()<LMVideoPlayerDelegate>
/** 状态栏的背景 */
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) LMVideoPlayer *player;
@property (nonatomic, strong) UIView *playerFatherView;
@property (nonatomic, strong) LMPlayerModel *playerModel;

/** 离开页面时候是否在播放 */
@property (nonatomic, assign) BOOL isPlaying;
/** 离开页面时候是否开始过播放 */
@property (nonatomic, assign) BOOL isStartPlay;


/** 新视频按钮 */
@property (nonatomic, strong) UIButton *nextVideoBtn;
/** 下一页 */
@property (nonatomic, strong) UIButton *nextPageBtn;

@property (nonatomic, assign) CGFloat statusBarHeight;
@end

@implementation IJKPlayerController
- (void)dealloc {
    NSLog(@"---------------dealloc------------------");
    [self.player destroyVideo];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = true;
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.hidden = YES;
    self.isStartPlay = NO;
    
    [self.view addSubview:self.nextVideoBtn];
    [self.view addSubview:self.nextPageBtn];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.playerFatherView];
//    self.playerFatherView.backgroundColor = [UIColor orangeColor];
    [self makePlayViewConstraints];
    
    LMPlayerModel *model = [[LMPlayerModel alloc] init];
    model.videoURL = [NSURL URLWithString:playUrl];
    model.seekTime = 20;
    model.viewTime = 200;
    
    LMVideoPlayer *player = [LMVideoPlayer videoPlayerWithView:self.playerFatherView delegate:self playerModel:model];
    self.player = player;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    // pop回来时候是否自动播放
    if (self.player && self.isPlaying) {
        self.isPlaying = NO;
        [self.player playVideo];
    }
    LMBrightnessViewShared.isStartPlay = self.isStartPlay;
}
- (void)nextVideoBtnClick {
    if (self.isStartPlay) {
        LMPlayerModel *model = [[LMPlayerModel alloc] init];
        model.videoURL = [NSURL URLWithString:playUrl];
        [self.player resetToPlayNewVideo:model];
    }
}
- (void)nextPageBtnClick {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 添加子控件的约束
- (void)makePlayViewConstraints {
//    self.playerFatherView.frame = CGRectMake(0, KStatusBarHeight, KScreen_Width, KScreen_Width*9.0f/16.0f);
    self.statusBarHeight = KStatusBarHeight;
    [self.playerFatherView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusBarHeight);
        make.left.right.equalTo(0);
        // 这里宽高比16：9,可自定义宽高比
        make.height.equalTo(KScreen_Width*9.f/16.f);
//        make.height.equalTo(self.playerFatherView.mas_width).multipliedBy(9.0f/16.0f);
    }];
    
    [self.topView updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_offset(KStatusBarHeight);
    }];
    
    [self.nextVideoBtn updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-130);
        make.height.mas_offset(30);
        make.width.mas_offset(150);
    }];
    
    [self.nextPageBtn updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-80);
        make.height.mas_offset(30);
        make.width.mas_offset(150);
    }];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark - 屏幕旋转
#pragma mark - 屏幕旋转
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
//        Dlog(@"%f----------",KStatusBarHeight);
//        Dlog(@"%F--------%F",KScreen_Width,KScreen_Height);//896.000000--------414.000000
        [self.playerFatherView updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.statusBarHeight);
//            make.height.equalTo(KScreen_Width).multipliedBy(9.0f/16.0f);
            make.height.equalTo(KScreen_Height*9.0f/16.f);
        }];
        [self.playerFatherView layoutSubviews];
//        self.playerFatherView.frame = CGRectMake(0, KStatusBarHeight, KScreen_Width, KScreen_Width*9.0f/16.0f);
    }else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
//        Dlog(@"%F--------%F",KScreen_Width,KScreen_Height);//414.000000--------896.000000
        [self.playerFatherView updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.height.equalTo(KScreen_Width);
//            make.bottom.equalTo(0);
        }];
//        self.playerFatherView.frame = CGRectMake(0, KStatusBarHeight, KScreen_Width, KScreen_Height);
    }
}

#pragma mark - LMVideoPlayerDelegate
/** 返回按钮被点击 */
- (void)playerBackButtonClick {
    [self.player destroyVideo];
    [self.navigationController popViewControllerAnimated:YES];
}
/** 控制层封面点击事件的回调 */
- (void)controlViewTapAction {
    if (_player) {
        [self.player autoPlayTheVideo];
        self.isStartPlay = YES;
    }
}



#pragma mark - getter
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor blackColor];
    }
    return _topView;
}

- (UIView *)playerFatherView {
    if (!_playerFatherView) {
        _playerFatherView = [[UIView alloc] init];
    }
    return _playerFatherView;
}

- (LMPlayerModel *)playerModel {
    if (!_playerModel) {
        _playerModel = [[LMPlayerModel alloc] init];
    }
    return _playerModel;
}

- (UIButton *)nextVideoBtn {
    if (!_nextVideoBtn) {
        _nextVideoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextVideoBtn setTitle:@"当前页播放新视频" forState:UIControlStateNormal];
        _nextVideoBtn.backgroundColor = [UIColor redColor];
        [_nextVideoBtn addTarget:self action:@selector(nextVideoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextVideoBtn;
}

- (UIButton *)nextPageBtn {
    if (!_nextPageBtn) {
        _nextPageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextPageBtn setTitle:@"下一页" forState:UIControlStateNormal];
        _nextPageBtn.backgroundColor = [UIColor redColor];
        [_nextPageBtn addTarget:self action:@selector(nextPageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextPageBtn;
}
@end
