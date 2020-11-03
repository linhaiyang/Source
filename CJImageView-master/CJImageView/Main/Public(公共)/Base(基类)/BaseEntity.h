//
//  BaseEntity.h
//  CJImageView
//
//  Created by shengkai li on 2020/6/29.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
static NSInteger age;
@interface BaseEntity : NSObject
@property (nonatomic, assign) NSInteger code;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger timestamp;

@property (nonatomic, copy) NSString *debug;

@property (nonatomic, strong) id data;
@end

NS_ASSUME_NONNULL_END
