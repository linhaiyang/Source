//
//  PropertyController.h
//  CJImageView
//
//  Created by shengkai li on 2020/6/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PropertyController : BaseViewController
@property(nonatomic)void(^selectBlock)(NSString*);
@end

NS_ASSUME_NONNULL_END
