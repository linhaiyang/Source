/**
 * Copyright (c) 2016-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 */

#import <Foundation/Foundation.h>
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
#import <FBMemoryProfiler/FBMemoryProfiler.h>
#endif

/**
 Example of FBMemoryProfiler plugin that will clear NSURLCache every time
 we hit mark generation.
 */
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
@interface CacheCleanerPlugin : NSObject <FBMemoryProfilerPluggable>

@end
#endif
