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
#define KScreen_Height      [DeviceTool screen_Height]
#define KScreen_Width       [DeviceTool screen_Width]
// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
#define kScreenWidthRatio  (KScreen_Width / 375.0)
#define kScreenHeightRatio (KScreen_Height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))

#define UNICODETOUTF16(x) (((((x - 0x10000) >>10) | 0xD800) << 16)  | (((x-0x10000)&3FF) | 0xDC00))
#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000

@interface DeviceTool : NSObject
+(BOOL)isIPhoneX;
+(CGFloat )statusBarHeight;
+(CGFloat )NavBarHeight;
+(CGFloat )safeBottomHeight;
+(CGFloat)screen_Height;
+(CGFloat)screen_Width;
@end

NS_ASSUME_NONNULL_END
