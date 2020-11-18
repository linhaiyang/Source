//
//  HomeViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"

#import <objc/runtime.h>
#import <objc/message.h>
@interface HomeViewController ()
@property(nonatomic,copy)NSString * dymStr;
@end

@implementation HomeViewController
@dynamic dymStr;
-(void)setDymStr:(NSString *)dymStr{
//    self.dymStr = dymStr;
    Dlog(@"----setDymStr---");
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    //一.UDID(Unique Device 苹果从iOS5开始就移除了通过代码访问UDID的权限。 Identifier)许多开发者把UDID跟用户的真实姓名、密码、住址、其它数据关联起来；网络窥探者会从多个应用收集这些数据，然后顺藤摸瓜得到这个人的许多隐私数据。
//    NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
    
//<<<<<<< HEAD
//    UserInfo * info = [UserInfo new];
//    info.token = @"cq2upymiMbnawoy-OaDpAi5MDJ8MTYwNTU4MDQ0MQO0O0OO0O0O";
//    info.userId = @"111";
//    [[GlobalDefault sharedInstance]setUserInfo:info];
//=======
//    二.UUID(Universally Unique Identifier) 通用唯一识别码
    //它是让分布式系统中的所有元素，都能有唯一的辨识资讯，而不需要透过中央控制端来做辨识资讯的指定。这样，每个人都可以建立不与其它人冲突的 UUID。在此情况下，就不需考虑数据库建立时的名称重复问题。苹果公司建议使用UUID为应用生成唯一标识字符串。
    //每次调用CFUUIDCreate，系统都会返回一个新的唯一标示符。如果你希望存储这个标示符，那么需要自己将其存储到NSUserDefaults, Keychain, Pasteboard或其它地方。
//    CFUUIDRef cfuuid = CFUUIDCreate(kCFAllocatorDefault);
//    NSString *cfuuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, cfuuid));
    
//    UserInfo * info = [UserInfo new];
//    info.token = @"token";
//    info.userId = @"111";
//    [[GlobalDefault sharedInstance]setUserInfo:info];
    
    // Do any additional setup after loading the view.
    self.dymStr = @"123456";
    
    const char * testChar = "testChar";
    Dlog(@"%@---testChar",[NSString stringWithUTF8String:testChar]);
    
    Class getclass=objc_getClass("ViewController");// @return The Class object for the named class0x000000010b7e62c0
    Class getclassH = objc_getClass("BaseViewController");
//    Class objectClass = object_getClass(<#id  _Nullable obj#>)
    Class metaClass = objc_getMetaClass(class_getName(getclass));
    Class metaClassH = objc_getMetaClass("BaseViewController");
    Class superClass_metaClass_parent = class_getSuperclass(metaClass);
    
    Class superClass_metaClass_child = class_getSuperclass(metaClassH);
    Class metaClass_NSObject = objc_getMetaClass("NSObject");
    Class superClass_metaClass_NSObject = class_getSuperclass(metaClass_NSObject);
    
    NSString * str_getclass = NSStringFromClass(getclass);
    NSString * str_getclassH = NSStringFromClass(getclassH);
    NSString * str_metaClass = NSStringFromClass(metaClass);
    NSString * str_metaClassH = NSStringFromClass(metaClassH);
    NSString * str_superClass_metaClass_parent = NSStringFromClass(superClass_metaClass_parent);
    NSString * str_superClass_metaClass_child = NSStringFromClass(superClass_metaClass_child);
    NSString * str_metaClass_NSObject = NSStringFromClass(metaClass_NSObject);
    NSString * str_superClass_metaClass_NSObject = NSStringFromClass(superClass_metaClass_NSObject);
    BOOL ismeta=class_isMetaClass(getclassH);
//    objc_msgSend(getclass,"runTest");
    
    Class objectClass =  object_getClass(getclass);//return The class object of which \e object is an instance,0x000000010b7e62e8
    Dlog(@"%@-----objectClass",NSStringFromClass(objectClass));
//    [objectClass performSelector:@selector(runTest)];
    [getclass performSelector:@selector(runTest)];
    //ViewController----(null)-----ViewController------(null)------BaseViewController-------(null)------NSObject-----NSObject
    Dlog(@"%@----%@-----%@------%@------%@-------%@------%@-----%@",str_getclass,str_getclassH,str_metaClass,str_metaClassH,str_superClass_metaClass_parent,str_superClass_metaClass_child,str_metaClass_NSObject,str_superClass_metaClass_NSObject);
    
//    Person *person = [[Person alloc] init];
    /// 向person 对象发送一条post方法 参数为2
    ((void(*)(id,SEL))objc_msgSend)(getclass,@selector(runTest));
//    其中(void(*)(id,SEL,int) 表示
//    返回类型为void 参数为id，方法名，参数类型
    
//    UIView * view1 = [UIView new];
//    UIView * view2 = [UIView new];
////    [view1 addSubview:view2];
//   objc_msgSend(view1, "addSubview:", view2);
    
    /**

         
      // CGSize size = [view1 sizeThatFits:CGSizeZero];
      CGSize size = objc_msgSend(view1, "sizeThatFits:", CGSizeZero);

      //  CGFloat alpha = view1.alpha;
      CGFloat alpha = objc_msgSend(view1, "alpha");
     
     */
    
//    Method origMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
//    IMP impl=method_getImplementation(origMethod);
    
    
    NSString * str = @"123";
    Class strClass = [str class];
    Class cclass = [NSString class];
    
    UIImageView * img = [UIImageView new];
    [img setShowActivityIndicatorView:true];
    [img sd_setImageWithURL:[NSURL URLWithString:@""] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
    }];
//    UserInfo * info = [UserInfo new];
//    info.token = @"token";
//    info.userId = @"userId";
//    [[GlobalDefault sharedInstance]setUserInfo:info];
//    NSArray * chcheArray = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
//    NSArray * chcheArray = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    ///Users/shengkaili/Library/Developer/CoreSimulator/Devices/EC15EA33-E233-426B-A1C0-660C79D8798B/data/Containers/Data/Application/A4602EFA-3D9A-4AC9-89B1-2E18C5841449/Library/Caches
    ////Users/shengkaili/Library/Developer/CoreSimulator/Devices/EC15EA33-E233-426B-A1C0-660C79D8798B/data/Containers/Data/Application/C5839A03-E77E-43A4-8B41-2127794C6B42/Library/Caches
//    Dlog(@"%@-------缓存地址",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]);
//    NSString * url = @"https://storetest.quyibao.com/wap/product-2430.html";
//    NSArray * ary = [url componentsSeparatedByString:@"product-"];
    
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
