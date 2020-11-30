//
//  TargetConfigContants.h
//  CJImageView
//
//  Created by shengkai li on 2020/11/30.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#ifndef TargetConfigContants_h
#define TargetConfigContants_h


#ifdef PRODUCT  //产品环境
static NSString* const DOMAIN_URl=@"https://asus.com";//域名
#else   //其它环境
static NSString* const DOMAIN_URl=@"https://testasus.com";//域名
#endif

#endif /* TargetConfigContants_h */
