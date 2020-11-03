//
//  BaseService.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "YTKRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseRequestService : YTKRequest
@property(nonatomic,strong,readwrite)id paraData;
-(void)startRequestWithCompletionBlockWithSuccess:(void (^)(BaseRequestService *batchRequest))success
                                          failure:(void (^)(YTKBaseRequest *batchRequest))failure;
- (Class)parseJSONClass;
@end

NS_ASSUME_NONNULL_END
