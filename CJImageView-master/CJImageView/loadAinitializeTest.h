//
//  loadAinitializeTest.h
//  CJImageView
//
//  Created by shengkai li on 2020/11/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface loadAinitializeTest : UIView
+(void)initializeTestBegin ;//__attribute__((unavailable("已取消")))
+ (instancetype)dataWithBytesNoCopy:(void *)bytes;
@property(nonatomic,copy)NSString * (^didSelecBlock)(NSString*blockT);
- (void)initCSocket;

@end

NS_ASSUME_NONNULL_END
