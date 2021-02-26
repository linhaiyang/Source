//
//  DeviceTool.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/30.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define LOCK(lock) dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
#define UNLOCK(lock) dispatch_semaphore_signal(lock);//YYImageManager.failedURLsLock


/// Get main screen's scale.
CGFloat YYScreenScale();
/// Convert pixel to point.
static inline CGFloat CGFloatFromPixel(CGFloat value) {
    return value / YYScreenScale();
}
/// round point value for pixel-aligned
static inline CGFloat CGFloatPixelRound(CGFloat value) {
    CGFloat scale = YYScreenScale();
    return round(value * scale) / scale;
}
/// round point value for pixel-aligned
static inline CGSize CGSizePixelRound(CGSize size) {
    CGFloat scale = YYScreenScale();
    return CGSizeMake(round(size.width * scale) / scale,
                      round(size.height * scale) / scale);
}
/// Convert point to pixel.
static inline CGFloat CGFloatToPixel(CGFloat value) {
    return value * YYScreenScale();
}
CGFloat statusBarHeight();
static inline  BOOL isIPhoneX(){
    return statusBarHeight()>20;
}
static inline  CGFloat NavBarHeight(){
    return statusBarHeight()+44;
}
CGFloat safeBottomHeight();
CGFloat KScreen_Width();
CGFloat KScreen_Height();
static inline CGFloat AdaptedWidth(CGFloat value){
    return ceilf((value) * KScreen_Width() / 375.0);
}
static inline CGFloat AdaptedHeight(CGFloat value){
    return ceilf((value) * KScreen_Height() / 667.0);
}

@interface YYImageManager : NSObject
@property (strong, nonatomic, nonnull) dispatch_semaphore_t failedURLsLock;
/**
 @synchronized (self.runningOperations) { //简单的线程安全写法@synchronized
     [self.runningOperations addObject:operation];
 }
 */
@end

NS_ASSUME_NONNULL_END
