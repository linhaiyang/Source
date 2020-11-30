//
//  GlobalDefault.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "GlobalDefault.h"
#import <YYCache/YYCache.h>

NSString * const UserCacheName = @"userInfoKey";

NSString * const userInfoKey = @"userInfoKey";

@implementation GlobalDefault{
    YYCache * _Cache;
}
static GlobalDefault *instance = nil;
+(GlobalDefault *)sharedInstance
{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
-(instancetype)init{
    if (self = [super init]) {
        _Cache = [[YYCache alloc]initWithName:UserCacheName];
        UserInfo * user =(UserInfo *)[_Cache objectForKey:userInfoKey];
        if (!kObjectIsEmpty(user)) {
            self.isLogin = YES;
            self.userInfo = user;
        }
        // 添加检测app进入后台的观察者
           [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterBackground) name: UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return self;
}
-(void)setUserInfo:(UserInfo *)userInfo{
    [[GCDQueue globalQueue]execute:^{
        _userInfo = userInfo;//(id<NSCoding>)object写入对象 需遵循NSCoding协议
    }];
    
}
-(NSString*)appVersion{
    if (!_appVersion) {
       _appVersion = (NSString*)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    }
    return _appVersion;//-8340879753757468082
}
-(NSString *)systemVersion{
    if (!_systemVersion) {
        _systemVersion = [[UIDevice currentDevice] systemVersion];
    }
    return _systemVersion;
}
-(NSString *)device_name{
    if (!_device_name) {
        _device_name = [[UIDevice currentDevice] name];
    }
    return _device_name;
}
-(void)loginOut{
    self.userInfo = nil;
    self.isLogin = false;
}
#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo{
    return self.isLogin;
}

-(void)applicationEnterBackground{
    [_Cache.diskCache setObject:_userInfo forKey:userInfoKey];
}

@end




@implementation UserInfo
@end

