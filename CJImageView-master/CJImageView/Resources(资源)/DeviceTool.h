//
//  DeviceTool.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/30.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define KNavHeight [DeviceTool NavBarHeight]
#define isIphoneX  [DeviceTool isIPhoneX]
#define KStatusBarHeight [DeviceTool statusBarHeight]
#define KSafeBottomHeight [DeviceTool safeBottomHeight]
@interface DeviceTool : NSObject
+(BOOL)isIPhoneX;
+(CGFloat )statusBarHeight;
+(CGFloat )NavBarHeight;
+(CGFloat )safeBottomHeight;
@end

NS_ASSUME_NONNULL_END
