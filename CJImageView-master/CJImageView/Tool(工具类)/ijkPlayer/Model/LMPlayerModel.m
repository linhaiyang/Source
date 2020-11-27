//
//  LMPlayerModel.m
//  lamiantv
//
//  Created by 李小南 on 2016/12/2.
//  Copyright © 2016年 AiPai. All rights reserved.
//

#import "LMPlayerModel.h"

@implementation LMPlayerModel

- (UIImage *)placeholderImage
{
    if (!_placeholderImage) {
        _placeholderImage = [UIImage imageWithColor:[UIColor blackColor]];
    }
    return _placeholderImage;
}

@end
