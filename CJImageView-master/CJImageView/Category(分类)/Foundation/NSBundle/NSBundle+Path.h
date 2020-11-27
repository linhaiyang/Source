//
//  NSBundle+Path.h
//  CJImageView
//
//  Created by shengkai li on 2020/11/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Path)

/// 获取bundle实例
/// @param className 这个bundle同目录下的class名称
/// @param resource bunle名称 @"MJRefresh"
/// @param type bundle 类型 @"bundle"
+(instancetype)bundleForClass:(NSString*)className pathForResource:(NSString*)resource ofType:(NSString*)type;


/// xx.bundle下的图片
/// @param imageName 图片名称 @"arrow@2x"
/// @param imageType 图片类型 png/jpg
-(UIImage *)bundleImage:(NSString*)imageName ofType:(NSString*)imageType;
@end

NS_ASSUME_NONNULL_END
