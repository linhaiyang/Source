

//
//  CrashPreventTest.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "CrashPreventTest.h"
#import <objc/runtime.h>

@implementation CrashPreventTest

+(void)load{
    Method origMethod = class_getInstanceMethod(self, @selector(allocWithZone));
    Method swMethod = class_getInstanceMethod(self, @selector(swMethodallocWithZone));
    
    
    method_exchangeImplementations(class_getInstanceMethod(self, origMethod), class_getInstanceMethod(self, swMethod));

}



@end
