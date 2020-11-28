//
//  LogInApi.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "LogInApi.h"

@implementation LogInApi
{
    NSString *_username;
    NSString *_password;
}
//
- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"storeapi/wx/home/global-index-";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}
- (Class)parseJSONClass{
    return [LoginModel class];
}
//设置一个3分钟的缓存，3分钟内调用调Api的start方法，实际上并不会发送真正的请求。
- (NSInteger)cacheTimeInSeconds {
 // cache 3 minutes, which is 60 * 3 = 180 seconds
 return 60 * 3;
 }
//- (long long)cacheVersion{
//    return GlobalInstance.appVersion;
//}
- (BOOL)writeCacheAsynchronously{
    return true;
}
///// 是否当前的数据从缓存获得
//- (BOOL)isDataFromCache{
//    return false;
//}
- (id)requestArgument {
    return [super requestArgument];
    return @{
//             @"user_name": _username,
//             @"user_password": _password
             };
}

@end
