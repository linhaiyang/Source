//
//  ClassifyApi.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "ClassifyApi.h"

@implementation ClassifyApi
- (NSString *)requestUrl {
    return @"storeapi/wx/home/nav.html";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
- (Class)parseJSONClass{
    return [ClassifyModel class];
}
- (id)requestArgument {
    return [super requestArgument];
}
@end
