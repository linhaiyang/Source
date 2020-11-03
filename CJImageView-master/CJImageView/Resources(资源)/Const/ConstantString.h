//
//  ConstantString.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#ifndef ConstantString_h
#define ConstantString_h
//邮件接收人
static NSString* const kMail_cc_ToRecipients_Address=@"https://github.com/bilibili/ijkplayer.git";

//网络状态监控地址
static NSString* const kURL_Reachability__Address=@"www.baidu.com";





static NSString* const MBTargetConfig_NetWork_s=@"";

//DDLog等级
static const int ddLogLevel = LOG_LEVEL_ERROR;

#else   //其它环境

//DDLog等级
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

#endif /* ConstantString_h */
