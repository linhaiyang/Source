//
//  EncodeModel.m
//  QuYiBao_iOS
//
//  Created by mac on 2017/12/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "EncodeModel.h"
#import <YYModel.h>

@implementation EncodeModel

// 重写以下几个方法 可以归档
- (void)encodeWithCoder:(NSCoder*)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}

- (id)copyWithZone:(NSZone*)zone {
    return [self yy_modelCopy];
}

- (NSUInteger)hash {
    return [self yy_modelHash];
}

- (BOOL)isEqual:(id)object {
    return [self yy_modelIsEqual:object];
}

@end
