//
//  UIImage+YYimage.m
//  CJImageView
//
//  Created by shengkai li on 2021/2/5.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "UIImage+YYimage.h"

@implementation UIImage (YYimage)
+ (UIImage *)YYImageNamed:(NSString *)name{
    if (!name) return nil;
    UIImage *image = [[self imageCache] objectForKey:name];
    if (image) return image;
    NSString *ext = name.pathExtension;
    if (ext.length == 0) ext = @"png";
    NSString *path = [[NSBundle mainBundle] pathForScaledResource:name ofType:ext];
    if (!path) return nil;
    image = [UIImage imageWithContentsOfFile:path];
    image = [image yy_imageByDecoded];
    if (!image) return nil;
    [[self imageCache] setObject:image forKey:name];
    return image;
}

+ (YYMemoryCache *)imageCache {
    static YYMemoryCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [YYMemoryCache new];
        cache.shouldRemoveAllObjectsOnMemoryWarning = NO;
        cache.shouldRemoveAllObjectsWhenEnteringBackground = NO;
        cache.name = @"WeiboImageCache";
    });
    return cache;
}


@end
