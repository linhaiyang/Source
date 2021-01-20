//
//  main.m
//  CJImageView
//
//  Created by C.K.Lian on 15/12/30.
//  Copyright © 2015年 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
#import <FBAllocationTracker/FBAllocationTrackerManager.h>
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>

#endif
int main(int argc, char * argv[]) {
    @autoreleasepool {
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
      [FBAssociationManager hook];
      [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
      [[FBAllocationTrackerManager sharedManager] enableGenerations];
      #endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
