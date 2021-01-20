//
//  HomeViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "HomeViewController.h"
#import "loadAinitializeTest.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UIColor+Gradient.h"
#import "NSString+Encrypt.h"
#import "NSString+hash.h"
#import "NSString+Base64.h"

typedef NSString * NSStringResourceKey NS_STRING_ENUM;

@interface HomeViewController ()
@property(nonatomic,copy)NSString * muStr;
@end

@implementation HomeViewController
@synthesize muStr=_muStr2;
-(void)setMuStr:(NSString *)muStr{
//    _muStr = muStr;
    Dlog(@"111111");
}

static NSString *base64_encode_data(NSData *data){
    
    return nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    CGFloat statuheight = KStatusBarHeight;

    //拉取数据

//    const char c [4] = "ccc";
    
    
    CFArrayRef cfArray=CFRunLoopCopyAllModes(CFRunLoopGetMain());
    
    [loadAinitializeTest initializeTestBegin];
    
    [loadAinitializeTest dataWithBytesNoCopy:(__bridge void * _Nonnull)(self)];
    
    
    NSDictionary *userInfo1 = [NSDictionary dictionaryWithObjectsAndKeys:@"由于文件不存在，无法打开", NSLocalizedDescriptionKey, @"失败原因：文件不存在", NSLocalizedFailureReasonErrorKey, @"恢复建议：请创建该文件",NSLocalizedRecoverySuggestionErrorKey,nil];
        
        NSError *error = [[NSError alloc] initWithDomain:NSURLErrorDomain code:4 userInfo:userInfo1];//此处code是4，对照下面对照表4代表文件不存在。userinfo传userinfo1 查看自定义打印。userinfo传nil，查看本地化描述。
    NSLog(@"========%@",[error localizedDescription]);
      NSLog(@"========%@",[error localizedFailureReason]);
      NSLog(@"========%@",[error localizedRecoverySuggestion]);
    /**
     <__NSArrayM 0x60000015e400>(
     UITrackingRunLoopMode,
     GSEventReceiveRunLoopMode,
     kCFRunLoopDefaultMode,
     kCFRunLoopCommonModes
     )
     */
    
    
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, KScreen_Height)];
//    bgView.backgroundColor = [UIColor orangeColor];
//    bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;//横屏后 屏幕宽度 变化，子视图跟着变化
////  [self.tableV insertSubview:bgView atIndex:0];
//    [self.view addSubview:bgView];
//    Dlog(@"%f-------%f",KScreen_Width,bgView);
//
//    IQTextView * textView = [[IQTextView alloc]init];
    
//    YYLabel * label = [[YYLabel alloc]initWithFrame:CGRectMake(10, 100, 100, 20)];
//    label.backgroundColor = UIColor.cyanColor;
//    label.text = @"YYLabel";
//    [self.view addSubview:label];
    
    CATextLayer * textLayer = [CATextLayer layer];
    textLayer.string = @"123456";
//    textLayer.font = ;
    textLayer.bounds = CGRectMake(0, 0, 100, 30);
    textLayer.position = CGPointMake(0, 500);
    [self.view.layer addSublayer:textLayer];
    
    
    loadAinitializeTest * test = [[loadAinitializeTest alloc]init];
    test.backgroundColor = [UIColor orangeColor];
//    test.frame = CGRectMake(0, 100, 100, 50);
//    [self.view addSubview:test];
    @weakify(self);

//    loadAinitializeTest * test2 = [test copy];
//    [self.view addSubview:test2];
    UIColor * color = [UIColor gradientFromColor:UIColor.blackColor toColor:UIColor.redColor withHeight:1];
    test.backgroundColor = color;
    CGSize  testsize = test.intrinsicContentSize;
//
//    [test makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(testsize.height);
//        make.width.equalTo(50);
//        make.left.equalTo(0);
//        make.top.equalTo(100);
//    }];
    __block loadAinitializeTest * blockTest = test;
    
    Dlog(@"%p  -------- %p",&test,&blockTest);
    [test invalidateIntrinsicContentSize];
    [test addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
        @strongify(self);
        [blockTest sizeToFit];
//        blockTest.ui_width = 200.f;
//        [blockTest updateConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(50);
//        }];
//        [blockTest setNeedsLayout];//不一定会调用layoutSubviews方法。
//        [blockTest layoutIfNeeded];//一定会调用layoutSubviews方法
    }];
    
    
    UIImage * crImage = [UIImage imageNamed:@"test_image_2"];
    
    UIImageView * img2 = [UIImageView new];
    img2.frame = CGRectMake(150, 400, 200, 200);
    img2.contentMode = UIViewContentModeScaleToFill;//UIViewContentModeScaleToFill属性会导致形变
    img2.image = crImage;
    [self.view addSubview:img2];
    CGSize size = crImage.size;
    Dlog(@"%.f---%.f--crImage_size",size.width,size.height);
    UIImageView * img = [UIImageView new];
    __block UIImageView * imageView = img;
//    img.image = crImage;
    img.contentMode = UIViewContentModeScaleAspectFill;//UIViewContentModeScaleAspectFill导致内容不能完全展示
    [GCDQueue.globalQueue execute:^{
        UIImage * cropImage = [crImage imageScaledToSize:CGSizeMake( 200, 200)];//CGSizeMake(200, 200)
        [GCDQueue.mainQueue execute:^{
            imageView.image = cropImage;
        }];
    }];

//    Dlog(@"%.f---%.f--crImage_size",cropImage.size.width,cropImage.size.height);
    img.frame = CGRectMake(0, 200, 200, 200);
    
    [self.view addSubview:img];
    
    
//    IQTextView * textView = [[IQTextView alloc]initWithFrame:CGRectMake(0, 500, 100, 50)];
//    textView.placeholder = @"placehoder";
//    [self.view addSubview:textView];
    
    YYLabel * yyLabel = [[YYLabel alloc]initWithFrame:CGRectMake(30, 200+200, 150, 80)];
    [self.view addSubview:yyLabel];
    yyLabel.text = @"H";
    
//    NSString * encryStr=yyLabel.text.encryptedWithRSAPublicKeyEncodingString;
//    Dlog(@"%@----------encryStr",encryStr);
//
//    NSString * encryStr0=@"blockTest".encryptedWithRSAPublicKeyEncodingString;
//    NSString * md5Str = yyLabel.text.md5String;
//    Dlog(@"%@----------encryStr",encryStr0);
//    Dlog(@"%@----------md5",md5Str);
    
    NSString * baseStr = yyLabel.text.base64EncodedString;
    Dlog(@"%@----------baseStr",baseStr);
    
    NSString * baseStr64 = [yyLabel.text base64EncodedStringWithWrapWidth:64];
    Dlog(@"%@----------baseStr",baseStr64);
    
    
    UIColor * color11 = [UIColor colorWithHexString:@"0x1B283A"];
    CGFloat r = ((CGFloat)((0x1B283A & 0xFF0000) >> 16));
    CGFloat g = ((CGFloat)((0x1B283A & 0xFF00) >> 8));
    CGFloat b = ((CGFloat)(0x1B283A & 0xFF));

    UIColor * color12 =[UIColor colorWithRed:((CGFloat)((0x1B283A & 0xFF0000) >> 16)) / 255.0 green:((CGFloat)((0x1B283A & 0xFF00) >> 8)) / 255.0 blue:((CGFloat)(0x1B283A & 0xFF)) / 255.0 alpha:(1)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
NSStringResourceKey const NSStringResourceKeyNamedPipe;
NSStringResourceKey const NSStringResourceKeyUserPipe;
@end
