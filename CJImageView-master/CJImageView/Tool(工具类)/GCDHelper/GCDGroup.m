//
//  GCDGroup.m
//  GCD
//
//  http://home.cnblogs.com/u/YouXianMing/
//  https://github.com/YouXianMing
//
//  Created by XianMingYou on 15/3/15.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "GCDGroup.h"

@interface GCDGroup ()

@property (strong, nonatomic, readwrite) dispatch_group_t dispatchGroup;

@end

@implementation GCDGroup

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        /**
         dispatch_group_t
         dispatch_group_create(void)
         {
             return (dispatch_group_t)dispatch_semaphore_create(LONG_MAX);
         }
         
         dispatch_group_create其实就是创建了一个value为LONG_MAX的dispatch_semaphore信号量
         */
        self.dispatchGroup = dispatch_group_create();
    }
    
    return self;
}

- (void)enter {
    
    dispatch_group_enter(self.dispatchGroup);
}

- (void)leave {
    
    dispatch_group_leave(self.dispatchGroup);
}

- (void)wait {
    
    dispatch_group_wait(self.dispatchGroup, DISPATCH_TIME_FOREVER);
}

- (BOOL)wait:(int64_t)delta {
    
    return dispatch_group_wait(self.dispatchGroup, dispatch_time(DISPATCH_TIME_NOW, delta)) == 0;
}


-(void)groupTest{
    __block NSInteger number = 0;
    //A耗时操作
    Dlog(@"group_async1-");
       dispatch_group_async(self.dispatchGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           Dlog(@"group_async1");
           sleep(3);
           number += 2222;
       });
    
    //B网络请求
    
       dispatch_group_enter(self.dispatchGroup);
    Dlog(@"group_async2-");
       [self sendRequestWithCompletion:^(id response) {
           number += [response integerValue];
           Dlog(@"group_async2");
           dispatch_group_leave(self.dispatchGroup);
       }];
       
       //C网络请求
    
       dispatch_group_enter(self.dispatchGroup);
    Dlog(@"group_async3-");
       [self sendRequestWithCompletion:^(id response) {
           number += [response integerValue];
           Dlog(@"group_async3");
           dispatch_group_leave(self.dispatchGroup);
       }];
       
       dispatch_group_notify(self.dispatchGroup, dispatch_get_main_queue(), ^{
           NSLog(@"%zd", number);
       });
    
}


- (void)sendRequestWithCompletion:(void (^)(id response))completion {
    //模拟一个网络请求
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(@1111);
        });
    });
}

@end
