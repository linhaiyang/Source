//
//  RACObserveController.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/3.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "RACObserveController.h"
//#import <IJKMediaFramework/IJKMediaFramework.h>

#define playUrl @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
@interface RACObserveController ()
@property(nonatomic,copy)NSString * racStr;

//@property (nonatomic, strong) id <IJKMediaPlayback> player;
//@property (nonatomic, strong) IJKFFOptions* options;
@property (nonatomic, strong) UIView *playerView;
@end

@implementation RACObserveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     
    UIButton * button  = [UIButton buttonWithType:UIButtonTypeCustom];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    UITextField * field = [UITextField new];
//    field.placeholder = @"输入筛选数据";
    field.frame = CGRectMake(100, 100, 200, 50);
    [self.view addSubview:field];
    [field addPlaceholder:@"输入筛选数据" withPlaceHolderColor:[UIColor orangeColor] Font:12];
//    [field makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(100);
//        make.width.equalTo(200);
//        make.height.equalTo(50);
//    }];
<<<<<<< HEAD
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [field shake];
    });
    
    [RACSignal defer:^RACSignal * _Nonnull{
        return nil;
=======
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [field shake];
//    });
    //counter是一个NSInteger类型的属性
    [[RACObserve(self, racStr) filter:^BOOL(id  _Nullable value) {
            return [value integerValue] >= 2;
    }] subscribeNext:^(id  _Nullable x) {
            NSLog(@"RACObserve : value = %@", x);
>>>>>>> fb495c922428faa33316c63fb39217f33d22e924
    }];
    
    [[field.rac_textSignal
      filter:^BOOL(NSString * _Nullable value) {
        
        return value.length>10;
    }]subscribeNext:^(NSString * _Nullable x) {
        Dlog(@"%@----",x);
    }];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    //创建对象 采用可变的网络请求对象
       NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@""]];
    
    NSURLSessionDataTask *task  = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
//    [RACObserve(self, racStr) subscribeNext:^(NSString *  _Nullable x) {
//        Dlog(@"str值变化监听---%@",x);
//    }];
//    [RACObserve(field, text) takeUntil:self.rac_deallocDisposable];
//    RAC(self,racStr) = [RACObserve(field, text)subscribeNext:^(id  _Nullable x) {
//
//    }];
    
    //1、创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        //任何时候，都可以发送信号，可以异步
        [subscriber sendNext:@"发送信号"];
        [subscriber sendCompleted];
        return nil;
    }];
    
//    signal subscribe:<#(nonnull id<RACSubscriber>)#>
    //2、订阅信号subscribe
    [signal subscribeNext:^(id  _Nullable x) {
         //收到信号时
         NSLog(@"信号内容：%@", x);
    }];
    
//    [self initIjkPlayer];
    
//    UIColor  clr = [UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]
    
    UIView * graView = [[UIView alloc]init];
    graView.frame = CGRectMake(10, 100, KScreen_Width - 20, 300.f);
    [self.view addSubview:graView];
//    graView.backgroundColor = [UIColor gradientFromColor:[UIColor colorWithHexString:@"#106FD7 "] toColor:[UIColor colorWithHexString:@"#03398A"] withWidth:graView.size.width];
}
/*
-(void)initIjkPlayer{
//    [self.view addSubview:self.playerView];
//       NSURL* url = [NSURL URLWithString:playUrl];
//       self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
//
//       dispatch_async(dispatch_get_main_queue(), ^{
//           UIView *playerView = [_player view];
//           playerView.backgroundColor = [UIColor redColor];
////           [self.playerView insertSubview:playerView atIndex:1];
//           [self.playerView addSubview:playerView];
//           [playerView makeConstraints:^(MASConstraintMaker *make) {
//              make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
//           }];
//           [_player setScalingMode:IJKMPMovieScalingModeAspectFill];
//       });
//
//       [self.player prepareToPlay];
//    [self.player play];
//       [self loadVideoNoti];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.player play];
}

-(void)viewDidLayoutSubviews{
    [_player view].bounds = self.playerView.frame;
}

#pragma mark - 加载完成的方法
-(void)seekCompletedEvent:(NSNotification*)notification{
    NSLog(@"视频加载完成....");
}

#pragma mark - 视频播放器状态改变
- (void)moviePlayBackStateDidChange:(NSNotification*)notification
{
    int playbackState = _player.playbackState;
    
    switch (playbackState) {
        case IJKMPMoviePlaybackStateStopped:
            NSLog(@"播放器的播放状态变了，现在是停止状态:%d",playbackState);
            break;
        case IJKMPMoviePlaybackStatePlaying:
            NSLog(@"播放器的播放状态变了，现在是播放状态:%d",playbackState);
            break;
        case IJKMPMoviePlaybackStatePaused:
            NSLog(@"播放器的播放状态变了，现在是暂停状态:%d",playbackState);
            break;
        case IJKMPMoviePlaybackStateInterrupted:
            NSLog(@"播放器的播放状态变了，现在是中断状态:%d",playbackState);
            break;
        case IJKMPMoviePlaybackStateSeekingForward:
            NSLog(@"播放器的播放状态变了，现在是向前拖动状态:%d",playbackState);
            break;
        case IJKMPMoviePlaybackStateSeekingBackward:
            NSLog(@"播放器的播放状态变了，现在是向后拖动状态：%d",playbackState);
            break;
        default:
            NSLog(@"播放器的播放状态变了，现在是未知状态：%d",playbackState);
            break;
    }
}


#pragma mark - 播放状态改变
- (void)moviePlayBackFinish:(NSNotification*)notification
{
    int reason = [[[notification userInfo]valueForKey:IJKMPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue];
    
    switch (reason) {
        case IJKMPMovieFinishReasonPlaybackEnded:
            NSLog(@"播放状态改变了:播放完毕的状态：%d",reason);
            break;
        case IJKMPMovieFinishReasonUserExited:
            NSLog(@"播放状态改变了:退出状态：%d",reason);
            break;
        case IJKMPMovieFinishReasonPlaybackError:
            NSLog(@"播放状态改变了:播放错误状态：%d",reason);
            break;
        default:
            break;
    }
}


#pragma mark - 更新加载状态
- (void)loadStateDidChange:(NSNotification*)notification
{
    IJKMPMovieLoadState loadState = _player.loadState;
    switch (loadState) {
        case IJKMPMovieLoadStatePlayable:
            NSLog(@"==========加载状态:缓存数据足够开始播放，但是视频并没有缓存完全");
            break;
        case IJKMPMovieLoadStateUnknown:
            NSLog(@"==========加载状态:状态");
            break;
        case IJKMPMovieLoadStatePlaythroughOK:
            NSLog(@"==========加载状态:缓存完成，可播放");
            break;
        case IJKMPMovieLoadStateStalled:
            NSLog(@"==========加载状态:缓存停止，播放停止");
            break;
            
        default:
            break;
    }
}

#pragma mark - IJKFFMoviePlayerController播放器通知
- (void)loadVideoNoti{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStateDidChange:) name:IJKMPMoviePlayerLoadStateDidChangeNotification object:_player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackFinish:) name:IJKMPMoviePlayerPlaybackDidFinishNotification object:_player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackStateDidChange:) name:IJKMPMoviePlayerPlaybackStateDidChangeNotification object:_player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(seekCompletedEvent:) name:IJKMPMoviePlayerDidSeekCompleteNotification object:_player];
}

-(UIView *)playerView{
    if (!_playerView) {
        
        _playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        _playerView.backgroundColor = [UIColor orangeColor];
    }
    return _playerView;
}

-(IJKFFOptions *)options{
    if (!_options) {
        _options = [IJKFFOptions optionsByDefault];
        //ijkplayer 播放rtmp等 实时性要求很高的 流媒体时候，会出现10S左右的延迟，原因是因为加了缓冲区处理，可以把其缓存设置变小
        [_options setOptionIntValue:1 forKey:@"infbuf" ofCategory:kIJKFFOptionCategoryPlayer];
        //最大缓存区大小
        [_options setOptionIntValue:1024 forKey:@"maxx-buffer-size" ofCategory:kIJKFFOptionCategoryPlayer];
        //ijkplayer和ffplay在打开rtmp串流视频时，大多数都会遇到5~10秒的延迟，在ffplay播放时，如果加上-fflags nobuffer可以缩短播放的rtmp视频延迟在1s内，而在IjkMediaPlayer中加入
        [_options setOptionIntValue:100L forKey:@"analyzemaxduration" ofCategory:1];
        [_options setOptionIntValue:10240L forKey:@"probesize" ofCategory:1];
        [_options setOptionIntValue:1L forKey:@"flush_packets" ofCategory:1];
        [_options setOptionIntValue:0L forKey:@"packet-buffering" ofCategory:4];
        [_options setOptionIntValue:1L forKey:@"framedrop" ofCategory:4];
    }
    return _options;
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
