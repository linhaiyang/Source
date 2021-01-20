/**
 * Copyright (c) 2016-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 */
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)

#import "RetainCycleLoggerPlugin.h"

@implementation RetainCycleLoggerPlugin

- (void)memoryProfilerDidFindRetainCycles:(NSSet *)retainCycles
{
    if (retainCycles.count > 0)
    {
        Dlog(@"\nretainCycles = \n%@", retainCycles);
    }
}

@end
#endif
