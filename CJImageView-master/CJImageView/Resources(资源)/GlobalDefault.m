//
//  GlobalDefault.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "GlobalDefault.h"
#import <YYCache/YYCache.h>
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
        _Cache = [[YYCache alloc]initWithName:KUserCacheName];
        UserInfo * user =(UserInfo *)[_Cache objectForKey:userInfoKey];
        if (!kObjectIsEmpty(user)) {
            self.isLogin = YES;
            self.userInfo = user;
        }
    }
    return self;
}
-(void)setUserInfo:(UserInfo *)userInfo{
    [[GCDQueue globalQueue]execute:^{
        _userInfo = userInfo;//(id<NSCoding>)object写入对象 需遵循NSCoding协议
        [_Cache setObject:userInfo forKey:userInfoKey];
    }];
    
}
-(long long)appVersion{
    if (!_appVersion) {
       _appVersion = (long long)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    }
    return _appVersion;
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
@end




@implementation UserInfo

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:_userId forKey:@"userId"];
    [coder encodeObject:_token forKey:@"token"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if (self = [super init]) {
           _userId = [coder decodeObjectForKey:@"userId"];
        _token = [coder decodeObjectForKey:@"token"];
       }
       return self;
}

@end

