//
//  TestViewModel.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "TestViewModel.h"
#import "LogInApi.h"
#import "LoginModel.h"

@implementation TestViewModel
-(RACSignal *)getTestInfo{
//    测试登录及网络请求
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            LogInApi *reg = [[LogInApi alloc] initWithUsername:@"username" password:@"password"];
                [reg startRequestWithCompletionBlockWithSuccess:^(BaseRequestService *request) {
                    NSLog(@"状态码%ld",request.responseStatusCode);
                    LoginModel * model = [LoginModel yy_modelWithJSON:request.responseJSONObject];//json------模型
                    NSDictionary * dicModel = [model yy_modelToJSONObject];//模型-------json
                    NSString * dicStr = [dicModel JSONString];
            //        LoginModel *model=[[LoginModel alloc]initWithString:request.responseString error:nil];
            //        NSLog(@"响应内容:%@",model.access_token);
                    //成功登录 跳转到首页
            //        [((AppDelegate*)AppDelegateInstance) setupHomeViewController];
            //将接口返回的接口object传递给subscribeNext
                    [subscriber sendNext:request.responseString];
            //信号完成之后，最好调用sendCompleted
                    [subscriber sendCompleted];
                    
                } failure:^(YTKBaseRequest *request) {
                    NSLog(@"Error");
        //            [subscriber sendError:request.error];
                }];
        return nil;
    }];
    return signal;
}
-(RACSignal *)getTestInfoMore{
//    NSString * str =
//    测试登录及网络请求
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            LogInApi *reg = [[LogInApi alloc] initWithUsername:@"username" password:@"password"];
                [reg startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
                    NSLog(@"状态码%ld",request.responseStatusCode);
            //        LoginModel *model=[[LoginModel alloc]initWithString:request.responseString error:nil];
            //        NSLog(@"响应内容:%@",model.access_token);
                    //成功登录 跳转到首页
            //        [((AppDelegate*)AppDelegateInstance) setupHomeViewController];
            //将接口返回的接口object传递给subscribeNext
                    [subscriber sendNext:request.responseString];
            //信号完成之后，最好调用sendCompleted
                    [subscriber sendCompleted];
                    
                } failure:^(YTKBaseRequest *request) {
                    NSLog(@"Error");
        //            [subscriber sendError:request.error];
                }];
        return nil;
    }];
    return signal;
}

/// 多个接口的同时调用 (以下的接口信号创建过程，不再描述)
-(void)testMoreSubscribe{
    RACSignal *systolicSignal = [self getTestInfo];
    RACSignal *diastolicSignal = [self getTestInfoMore];
    @weakify(self)
    //因为两个接口是需要同时获取到数据的，所以可以使用combineLatest组合信号
    [[RACSignal combineLatest:@[systolicSignal, diastolicSignal]] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self)
        //因为是请求了多个接口，所以会有多个数据返回，此处的x是一个元祖，所以使用RACTupleUnpack解包元祖
        //返回结果值(DataItemRecordModel)的顺序对应combineLatest中数组的信号顺序
        RACTupleUnpack(NSString *systolicModel, NSString *diastolicModel) = x;
        //这里可以直接使用返回值  systolicModel  和  diastolicModel
                
    } error:^(NSError * _Nullable error) {
        @strongify(self)
        //没有数据
//        [self handleTheErrorMessage:error];
    }];
}
@end
