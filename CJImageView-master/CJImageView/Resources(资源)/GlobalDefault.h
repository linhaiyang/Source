//
//  GlobalDefault.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

//用户信息缓存 名称
#define KUserCacheName @"KUserCacheName"
#define GlobalInstance [GlobalDefault sharedInstance]
#define GlobalUserInfo [GlobalDefault sharedInstance].userInfo
#define GlobalisLogin [GlobalDefault sharedInstance].isLogin
NS_ASSUME_NONNULL_BEGIN

@class UserInfo;
@interface GlobalDefault : NSObject
+(GlobalDefault *)sharedInstance;
@property(nonatomic,copy)NSString* appVersion;
@property(nonatomic,copy)NSString * systemVersion;
@property(nonatomic,copy)NSString * device_token;
@property(nonatomic,copy)NSString * device_name;
@property(nonatomic,assign)BOOL isLogin;
@property(nonatomic,strong)UserInfo * userInfo;
@end


@interface UserInfo : NSObject<NSCoding>
@property(nonatomic,copy)NSString * userId;
@property(nonatomic,copy)NSString * token;
@end
NS_ASSUME_NONNULL_END
