//
//  NSBundle+Path.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "NSBundle+Path.h"

@implementation NSBundle (Path)


/// 获取bundle实例
/// @param className 这个bundle同目录下的class名称
/// @param resource bunle名称 @"MJRefresh"
/// @param type bundle 类型 @"bundle"
+(instancetype)bundleForClass:(NSString*)className pathForResource:(NSString*)resource ofType:(NSString*)type{
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
    return [NSBundle bundleWithPath:[[NSBundle bundleForClass:NSClassFromString(className)] pathForResource:resource ofType:type]];
}

/// xx.bundle下的图片
/// @param imageName 图片名称 @"arrow@2x"
/// @param imageType 图片类型 png/jpg
-(UIImage *)bundleImage:(NSString*)imageName ofType:(NSString*)imageType
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [UIImage imageWithContentsOfFile:[self pathForResource:imageName ofType:imageType]];
    }
    return arrowImage;
}



+(instancetype)mBProgressHudBundle{
    static NSBundle *refreshBundle = nil;
    if (refreshBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        refreshBundle = [self bundleForClass:@"MBProgressHUD+JJ" pathForResource:@"MBProgressHUD" ofType:@"bundle"];
    }
    return refreshBundle;
}

+ (UIImage *)mb_successImage
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [[[self mBProgressHudBundle] bundleImage:@"success@2x" ofType:@"png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return arrowImage;
}


+ (UIImage *)mb_errorImage
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [[[self mBProgressHudBundle] bundleImage:@"error@2x" ofType:@"png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return arrowImage;
}

+ (UIImage *)mb_warnImage
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [[[self mBProgressHudBundle] bundleImage:@"warn@2x" ofType:@"png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return arrowImage;
}

- (NSString *)pathForScaledResource:(NSString *)name ofType:(NSString *)ext {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [self pathForResource:name ofType:ext];
    
    NSString *path = nil;
    NSArray *scales = [NSBundle preferredScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ? [name stringByAppendingNameScale:scale]
        : [name stringByAppendingPathScale:scale];
        path = [self pathForResource:scaledName ofType:ext];
        if (path) break;
    }
    
    return path;
}
@end
