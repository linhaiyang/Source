

//
//  BaseService.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseRequestService.h"
#import <sys/utsname.h>
#import "BaseEntity.h"
#import "MPRequstFailedHelper.h"
#import "NSString+hash.h"

int const Default_pageSize = 20;
@interface BaseRequestService()
@end


@implementation BaseRequestService
//公共头部设置
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSString * version = GlobalInstance.appVersion;
    NSString * systemVersion = GlobalInstance.systemVersion;
    NSString * deviveName = GlobalInstance.device_name;
    NSString * token = GlobalUserInfo.token?GlobalUserInfo.token:@"";
    NSDictionary *headerDictionary=@{@"platform":@"ios",@"version":[NSString stringWithFormat:@"%@",version],@"device":[NSString stringWithFormat:@"%@-%@", deviveName, systemVersion],@"token":token};
    NSString * headStr = [headerDictionary JSONString];
    return headerDictionary;
}
- (Class)parseJSONClass{
    return [BaseEntity class];
}
-(void)startRequestWithCompletionBlockWithSuccess:(void (^)(BaseRequestService *batchRequest))success
failure:(void (^)(YTKBaseRequest *batchRequest))failure{
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        BaseEntity * entity = [BaseEntity yy_modelWithJSON:request.responseObject];
        Dlog(@"请求成功结果:%@------",[request.responseJSONObject JSONString]);
        if (entity.code == 200) {
            id data = entity.data;
            BaseRequestService * baseSerVice = (BaseRequestService *)request;
            Class paraClass = [self parseJSONClass];
            if ([data isKindOfClass:[NSArray class]]) {
                NSArray *baseEntity = [NSArray yy_modelArrayWithClass:paraClass json:entity.data];
                baseSerVice.paraData = baseEntity;
                success?success(baseSerVice):nil;
            }else{
                BaseEntity * baseEntity = [paraClass yy_modelWithJSON:data];
                baseSerVice.paraData = baseEntity;
                success?success(baseSerVice):nil;
            }
        }else{
            [MBProgressHUD showError:entity.msg];
            failure?failure(request):nil ;
        }
        } failure:^(YTKBaseRequest *request) {
            [MPRequstFailedHelper requstFailed:request];
            failure?failure(request):nil ;
//            Dlog(@"responseString---%@-----%ld--",request.responseString,request.responseStatusCode);
//            NSLog(@"Error");
        }];
}
- (id)requestArgument{
     NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //    NSString *token = [GlobalUserDefault token] ? [GlobalUserDefault token] :
    //    [dic setObject: @"api-vt2s57b6fvli0i08o3bc5bet4j" forKey:@"token"];
        // 设备来源
        [dic setObject:@"iOS" forKey:@"device"];
        // 随机值
        int a = arc4random() % 100000;
        NSString *nonce = [NSString stringWithFormat:@"%06d", a];
    Dlog(@"%@-----nonce-----",nonce);
        [dic setObject:nonce forKey:@"nonce"];
        // 时间戳
        NSDate *date = [NSDate date];//现在时间,你可以输出来看下是什么格式
        NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
        [dic setObject:timestamp forKey:@"timestamp"];
    //    NSLog(@"时间戳 ==== %@", timestamp);
        // sign
        NSString *key = @"Asus!@#$%^&*()Store";
        NSString *signature = [NSString stringWithFormat:@"%@%@%@", nonce, timestamp, key].md5String;
        [dic setObject:signature forKey:@"signature"];
    if (self.page > 0) {
        [dic setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"page"];
        if (self.page_size == 0) {
            self.page_size = Default_pageSize;
        }
        [dic setObject:[NSString stringWithFormat:@"%d",self.page_size] forKey:@"page_size"];
    }
        return dic;
}

//验证返回数据
- (id)jsonValidator {
   return @{
//       @"code": [NSString class],
//       @"level": [NSNumber class]
   };
}
@end
