//
//  PropertyController.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "PropertyController.h"
#import "ViewController.h"
#import "LogInApi.h"
#import "RACObserveController.h"
#import "ClassifyApi.h"
#import "DismissVCAnimation.h"

#define  MRScreenWidth [UIScreen mainScreen].bounds.size.width
#define  MRScreenHeight [UIScreen mainScreen].bounds.size.height
@interface PropertyController ()<UIScrollViewDelegate>
{
    @public
    int _no;
    int _age;
}
@property(copy,nonatomic)NSMutableString*aCopyMStr;
@property(strong,nonatomic)NSMutableString*strongMStr;
@property(weak,nonatomic)NSMutableString*weakMStr;
@property(assign,nonatomic)NSMutableString*assignMStr;
@property(nonatomic,assign)void * myTable;
@property(nonatomic,copy)NSArray * muAry;
@property(nonatomic,strong)UIScrollView * srcollView;
@property(nonatomic,strong)UIImageView * imageView;
@end

@implementation PropertyController

+(void)initialize{
    Dlog(@"initialize调用");
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    [self.navigationController.navigationBar setBarTintColor:KColorNavDefault];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:KColorNavDefault] forBarMetrics:UIBarMetricsDefault];
    
//    self.navigationController.navigationBar.translucent = false;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    Dlog(@"ViewController viewWillAppear");
    self.navigationController.navigationBar.translucent = true;
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    Dlog(@"ViewController viewDidDisappear");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    Dlog(@"%@+++++++++",mainNotification);
    self.view.backgroundColor =[UIColor whiteColor];
//    self.navigationItem.title = @"修饰词";
//    self.fd_prefersNavigationBarHidden = true;
//    [self.navigationController.navigationBar lt_setTranslationY:-20];
    self->_no = 4;
    self->_age = 5;
    
    @weakify(self);
    [self configRightBaritemWithImage:[UIImage imageNamed:@"button_navibars_2w"] buttonItemClick:^(UIBarButtonItem *barButton) {
        @strongify(self);
//        Dlog(@"barButtonClick");
//        [self pointerTest];
        [self dismissViewControllerAnimated:false completion:nil];
    }];
    
    
    
    
//    [self.navigationController.navigationItem standardAppearance] 
//    LogInApi*request = [[LogInApi alloc] init];
//    NSError *loadCacheError = nil;
//    if ([request loadCacheWithError:&loadCacheError]) {
//        id obj = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:nil];
//    //    NSDictionary *json = [request responseJSONObject];
//        Dlog(@"json loadCacheWithError = %@", obj);
//        // show cached data
//        }
//    [request startRequestWithCompletionBlockWithSuccess:^(BaseRequestService * _Nonnull batchRequest) {
//        LoginModel * model = batchRequest.paraData;
////        [batchRequest saveResponseDataToCacheFile:batchRequest.responseData];
//    } failure:^(YTKBaseRequest * _Nonnull batchRequest) {
//
//    }];
//    [self alertWithCallBackBlock:^(NSInteger buttonIndex) {
//
//    } title:@"" message:@"退出当前账号，将不能发表更贴、参与主题讨论、同步关注内容了" cancelButtonName:@"取消" defaultButtonTitle:@"确认退出"];
    
//    [self ActionSheetWithCallBackBlock:^(NSInteger buttonIndex) {
//
//    } title:@"退出选项" cancelButtonName:@"取消" otherButtonTitles:[NSArray arrayWithObjects:@"确认退出",@"确认退出2", nil]];
    
    
//    ClassifyApi * api = [ClassifyApi new];
//    [api startRequestWithCompletionBlockWithSuccess:^(BaseRequestService * _Nonnull batchRequest) {
//        NSArray * dataArray = batchRequest.paraData;
//        for(ClassifyModel * model in dataArray){
//            Dlog(@"%@------dataArray",model.title);
//
//        }
//    } failure:^(YTKBaseRequest * _Nonnull batchRequest) {
//
//    }];

    
//    [self.request startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//        Dlog(@"responseString---%@-----%ld--",request.responseString,request.responseStatusCode);
////        LoginModel *model=[[LoginModel alloc]initWithString:request.responseString error:nil];
////        NSLog(@"响应内容:%@",model.access_token);
////        //成功登录 跳转到首页
////        [((AppDelegate*)AppDelegateInstance) setupHomeViewController];
//
//    } failure:^(YTKBaseRequest *request) {
//
//        Dlog(@"responseString---%@-----%ld--",request.responseString,request.responseStatusCode);
//        NSLog(@"Error");
//    }];

       UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, KNavHeight, KScreen_Width, 200)];
        [self.view addSubview:imageView];
        UIImage * img =[UIImage imageNamed:@"background"];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = img;
    imageView.transform = CGAffineTransformScale(imageView.transform, 0.5, 0.5);
    [UIView animateWithDuration:0.3 animations:^{
        imageView.transform = CGAffineTransformIdentity;
    }];
    
    self.view.right = 0.f;
    
    
    NSMutableString*mstrOrigin = [[NSMutableString alloc]initWithString:@"mstrOriginValue"];

//    self.aCopyMStr= mstrOrigin;
    self.aCopyMStr = [NSMutableString new];
    self.strongMStr= mstrOrigin;
    self.assignMStr= mstrOrigin;
//    self.weakMStr= mstrOrigin;
    NSMutableString*mstrOrigin2 = [[NSMutableString alloc]init];
    mstrOrigin2 = self.strongMStr;
//    [_aCopyMStr appendString:@"1"];
//    mstrOrigin = [[NSMutableString alloc]initWithString:@"mstrOriginChange2"];
//    [mstrOrigin appendString:@"123"];
//    self.strongMStr=nil;
    mstrOrigin = [[NSMutableString alloc]initWithString:@"mstrOriginValue2"];
//    self.assignMStr  = [NSMutableString new];
//    self.weakMStr = [[NSMutableString alloc]init];
//    [self.weakMStr appendString:@"123"];
//    NSLog(@"mstrOrigin输出:%p,%@\\n", mstrOrigin,mstrOrigin);
//    NSLog(@"mstrOrigin输出2:%p,%@\\n", mstrOrigin2,mstrOrigin2);
//    NSLog(@"aCopyMStr输出:%p,%@\\n",self.aCopyMStr,_aCopyMStr);//copy会重新开辟新的内存来保存一份相同的数据。
//    NSLog(@"strongMStr输出:%p,%@\\n",_strongMStr,_strongMStr);
//    NSLog(@"weakMStr输出:%p,%@\\n",_weakMStr,_weakMStr);
//    NSLog(@"assignMStr输出:%p,%@\\n",_assignMStr,_assignMStr);
//    NSLog(@"引用计数%@",[self.weakMStr valueForKey:@"retainCount"]);
    
//     2020-06-23 17:20:23.576880+0800 CJImageView[60044:2679444] mstrOrigin输出:0x600003df7f90,mstrOriginValue\n
//     2020-06-23 17:20:23.576976+0800 CJImageView[60044:2679444] aCopyMStr输出:0x600003df7f60,mstrOriginValue\n
//     2020-06-23 17:20:23.577076+0800 CJImageView[60044:2679444] strongMStr输出:0x600003df7f90,mstrOriginValue\n
//     2020-06-23 17:20:23.577201+0800 CJImageView[60044:2679444] weakMStr输出:0x600003df7f90,mstrOriginValue\n
//     2020-06-23 17:20:23.577360+0800 CJImageView[60044:2679444] 引用计数2
     
//     strongMStr和weakMStr指针指向的内存地址都和mstrOrigin相同,但mstrOrigin内存引用计数为2，不为3，因为weakMStr虽然指向了数据内存地址（之后用C简称，见示意图1），但不会增加C计数。
//     copy修饰的的aCopyMStr，赋值后则是自己单独开辟了一块内存，内存上保存“mstrOrigin”字符串，并指向。

    /**
     assign:一般来说，我们都用assign去修饰OC的基本数据类型，
     因为assign并不会使对象的引用计数加1，也就是说如果用assign去修饰一个对象，这个对象会立即被释放，重要的是assgin在被释放的时候是不会自动置为nil，还是保留对象的指针地址，会形成野指针，这个时候向其发送消息就会崩溃
     断点：_assignMStr =(NSConcreteMutableData*)135byte

     weak:如果你打个断点的话会发现array被自动置为nil，而OC的特性使得像nil发送消息并不会崩溃 这就是weak和assgin最大的区别，此外weak必须用于修饰对象，
     断点：_weakMStr =(NSMutableString*)nil
     
     */
    
    self.muAry = [NSArray arrayWithObject:@"1"];
    NSArray * copyArry = self.muAry ;
    NSMutableArray * mutableCopyArray = [self.muAry mutableCopy];
//    NSLog(@"array:%p----%ld", self.muAry,[copyArry valueForKey:@"retainCount"]);
    NSLog(@"copyArry:%p", copyArry);
    NSLog(@"mutableCopyArray:%p", mutableCopyArray);
    
    
    int y = 10;
    int t = 10;
    CGFloat x = 10;
    short s = 1;
    double d = 4;
    long l = 1;
    char * c = @"1";
    NSInteger z = 10;
    NSLog(@"基本数据类型%p-----%p",y,t);//基本数据类型0xa
    NSLog(@"基本数据类型%p-----",x);
    NSLog(@"基本数据类型%p-----",c);//xffffff88-----
    /**
     2020-10-23 17:12:37.303718+0800 CJImageViewDebug[59795:3502477] array:0x6000001b7430
     2020-10-23 17:12:37.303921+0800 CJImageViewDebug[59795:3502477] copyArry:0x6000001b7430
     2020-10-23 17:12:37.304031+0800 CJImageViewDebug[59795:3502477] mutableCopyArray:0x600000deed60
     Ctrl + P：移动光标到上一行

     Ctrl + N：移动光标到下一行

     Ctrl + A : 移动光标到本行行首   （替换Home键）

     Ctrl + E : 移动光标到本行行尾   （替换end键）
     
     */
}


-(void)scrollViewZoomTest{
    _srcollView = [[UIScrollView alloc]init];

    _srcollView.delegate = self;

    _srcollView.userInteractionEnabled = YES;

    _srcollView.showsHorizontalScrollIndicator = YES;//是否显示侧边的滚动栏

    _srcollView.showsVerticalScrollIndicator = NO;

    _srcollView.scrollsToTop = NO;

    _srcollView.scrollEnabled = YES;

    _srcollView.frame = CGRectMake(0, 0, MRScreenWidth, MRScreenHeight);

    UIImage *img = [UIImage imageNamed:@"image1.png"];

    _imageView = [[UIImageView alloc]initWithImage:img];

    //设置这个_imageView能被缩放的最大尺寸，这句话很重要，一定不能少,如果没有这句话，图片不能缩放

    _imageView.frame = CGRectMake(0, 0, MRScreenWidth * 2.5, MRScreenHeight * 2.5);

    _imageView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_srcollView];

    [_srcollView addSubview:_imageView];

    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self

    action:@selector(handleDoubleTap:)];

    [doubleTapGesture setNumberOfTapsRequired:2];

    [_srcollView addGestureRecognizer:doubleTapGesture];

    
    [_srcollView setMinimumZoomScale:0.25f];

    [_srcollView setMaximumZoomScale:3.0f];

    [_srcollView setZoomScale:0.5f animated:NO];


}
#pragma mark - Zoom methods

- (void)handleDoubleTap:(UIGestureRecognizer *)gesture

{

NSLog(@"handleDoubleTap");

float newScale = _srcollView.zoomScale * 1.5;//zoomScale这个值决定了contents当前扩展的比例

CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gesture locationInView:gesture.view]];

[_srcollView zoomToRect:zoomRect animated:YES];

}
 -(CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center

{

CGRect zoomRect;

zoomRect.size.height = _srcollView.frame.size.height / scale;

NSLog(@"zoomRect.size.height is %f",zoomRect.size.height);

NSLog(@"self.frame.size.height is %f",_srcollView.frame.size.height);

zoomRect.size.width = _srcollView.frame.size.width/ scale;

zoomRect.origin.x = center.x - (zoomRect.size.width/ 2.0);

zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);

return zoomRect;

}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView

{

return _imageView;

}

//当滑动结束时

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale

{

//把当前的缩放比例设进ZoomScale，以便下次缩放时实在现有的比例的基础上

NSLog(@"scale is %f",scale);

[_srcollView setZoomScale:scale animated:NO];

}

-(void)pointerTest{
    
    /*
    NSString *name = @"xxxx";
       NSLog(@"%p",name);//前者是字符串 "xxxx" 内存首地址
       NSLog(@"%p",&name);//后者是指针name 内存首地址
       NSString * d = @"xxxx";
       NSLog(@"%p",d);
     */
    

}
//-(void)setWeakMStr:(NSMutableString *)weakMStr{
//    Dlog(@"WeakMStr set方法");
//    _weakMStr = weakMStr;
//}
//-(void)setStrongMStr:(NSMutableString *)strongMStr{
//    _strongMStr = strongMStr;
//}
//-(void)setACopyMStr:(NSMutableString *)aCopyMStr{
//    _aCopyMStr = aCopyMStr;
//}
//
//-(void)setAssignMStr:(NSMutableString *)assignMStr{
//    _assignMStr = assignMStr;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
