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

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UserInfo * info = [UserInfo new];
    info.token = @"token";
    info.userId = @"111";
    [[GlobalDefault sharedInstance]setUserInfo:info];
    
    // Do any additional setup after loading the view.
    
    Class getclass=objc_getClass("ViewController");// @return The Class object for the named class0x000000010b7e62c0
    Class getclassH = objc_getClass("BaseViewController");
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
    BOOL ismeta=class_isMetaClass(metaClassH);
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
