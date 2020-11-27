//
//  loadAinitializeTest.h
//  CJImageView
//
//  Created by shengkai li on 2020/11/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface loadAinitializeTest : NSObject
+(void)initializeTestBegin __attribute__((unavailable("已取消")));

@property(nonatomic,copy)NSString * (^didSelecBlock)(NSString*blockT);

@end

NS_ASSUME_NONNULL_END
