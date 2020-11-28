//
//  LogInApi.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseRequestService.h"
#import "LoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LogInApi : BaseRequestService
- (id)initWithUsername:(NSString *)username password:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
