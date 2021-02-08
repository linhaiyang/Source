//
//  IBWebViewController.m
//  O2
//
//  Created by qilongTan on 15/10/31.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "XLWebViewController.h"
#import "UIWebVIew+SwipeGesture.h"
#import <StoreKit/StoreKit.h>

//#import "XLJSHandler.h"
//#import "HeaderModel.h"
//#import "AESCipher.h"
//#import <YYKit.h>

static NSString * const canGoBackKeyPath = @"canGoBack";
static NSString * const estimatedProgressKeyPath = @"estimatedProgress";
@interface XLWebViewController () <WKNavigationDelegate,SKStoreProductViewControllerDelegate>
//@property (nonatomic,strong) XLJSHandler * jsHandler;
@property (nonatomic,assign) double lastProgress;//上次进度条位置
@end

@implementation XLWebViewController

-(instancetype)initWithUrl:(NSString *)url {
    self = [super init];
    if (self) {
        self.url = url;
        _progressViewColor = [UIColor colorWithHexString:@"0485d1"];
    }
    return self;
}

-(void)setUrl:(NSString *)url
{
    if (_url != url) {
        _url = url;
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url]];
        //加密header部分
//        NSString *headerContentStr = [[HeaderModel new] modelToJSONString];
//        NSString *headerAESStr = aesEncrypt(headerContentStr);
//        [request setValue:headerAESStr forHTTPHeaderField:@"header-encrypt-code"];
        [self.webView loadRequest:request];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWKWebView];
    //适配iOS11
    if (@available(iOS 11.0, *)){
        self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.webView useSwipeGesture];
}

#pragma mark 初始化webview
-(void)initWKWebView
{
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    configuration.preferences.javaScriptEnabled = YES;//打开js交互
    _webConfiguration = configuration;
//    _jsHandler = [[XLJSHandler alloc]initWithViewController:self configuration:configuration];
    
    
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:configuration];
    _webView.navigationDelegate = self;
    _webView.backgroundColor = [UIColor clearColor];
    _webView.allowsBackForwardNavigationGestures =YES;//打开网页间的 滑动返回
    _webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    //监控进度
    [_webView addObserver:self forKeyPath:estimatedProgressKeyPath options:NSKeyValueObservingOptionNew context:nil];
    [_webView addObserver:self forKeyPath:canGoBackKeyPath options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_webView];
    //进度条
    _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progressView.tintColor = _progressViewColor;
    _progressView.trackTintColor = [UIColor clearColor];
    _progressView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 3.0);
    [_webView addSubview:_progressView];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url]];
    //加密header部分
//    NSString *headerContentStr = [[HeaderModel new] modelToJSONString];
//    NSString *headerAESStr = aesEncrypt(headerContentStr);
//    [request setValue:headerAESStr forHTTPHeaderField:@"header-encrypt-code"];
    [_webView loadRequest:request];
}



-(void)backButtonClicked
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    else {
        [self backBtnClicked];
    }
}

#pragma mark --进度条
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    Dlog(@"%@-----",keyPath);
    if (object == self.webView && [keyPath isEqualToString:canGoBackKeyPath]) {
        BOOL cangoBack = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
    }else{
        [self updateProgress:_webView.estimatedProgress];
    }
}

#pragma mark -  更新进度条
-(void)updateProgress:(double)progress{
    self.progressView.alpha = 1;
    if(progress > _lastProgress){
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
    }else{
        [self.progressView setProgress:self.webView.estimatedProgress];
    }
    _lastProgress = progress;
    
    if (progress >= 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.progressView.alpha = 0;
            [self.progressView setProgress:0];
            _lastProgress = 0;
        });
    }
}

#pragma mark --navigation delegate
//加载完毕
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.title = webView.title?:@"";
    [self updateProgress:webView.estimatedProgress];
    
    [self updateNavigationItems];
}

-(void)updateNavigationItems{
    
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if(webView != self.webView) {
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    CALayer * layer;
    NSURL * url = webView.URL;
    UIApplication *app = [UIApplication sharedApplication];////打开wkwebview禁用了电话和跳转appstore 通过这个方法打开
    if ([url.scheme isEqualToString:@"tel"])
    {
        if ([app canOpenURL:url])
                {
                    [app openURL:url options:@{} completionHandler:nil];
                    decisionHandler(WKNavigationActionPolicyCancel);
                    return;
                }
            }
            if ([url.absoluteString containsString:@"itunes.apple.com"]||[url.absoluteString containsString:@"apps.apple.com"])//
            {
                if ([app canOpenURL:url])
                {
                    SKStoreProductViewController *skstore = [[SKStoreProductViewController alloc] init];

                    skstore.delegate=self;

                    [self presentViewController:skstore animated:YES completion:nil];
                    [skstore loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@(414478124)} completionBlock:^(BOOL result, NSError * _Nullable error) {

                    }];
                    decisionHandler(WKNavigationActionPolicyCancel);
                    return;
                }
            }
    decisionHandler(WKNavigationActionPolicyAllow);
}

-(void)backBtnClicked{
    [self.webView stopLoading];
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [self backBtnClicked];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
//    [_jsHandler cancelHandler];
    self.webView.navigationDelegate = nil;
    [_webView removeObserver:self forKeyPath:estimatedProgressKeyPath];
    [_webView removeObserver:self forKeyPath:canGoBackKeyPath];
}
- (void)productViewControllerDidFinish:(SKStoreProductViewController*)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}
@end
