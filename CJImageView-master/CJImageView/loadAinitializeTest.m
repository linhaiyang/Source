//
//  loadAinitializeTest.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "loadAinitializeTest.h"

@implementation loadAinitializeTest

/**
 
 当类对象被引入项目时, runtime 会向每一个类对象发送 load 消息. load 方法还是非常的神奇的, 因为它会在每一个类甚至分类被引入时仅调用一次, 调用的顺序是父类优先于子类, 子类优先于分类. 而且 load 方法不会被类自动继承, 每一个类中的 load 方法都不需要像 viewDidLoad 方法一样调用父类的方法. 由于 load 方法会在类被 import 时调用一次, 而这时往往是改变类的行为的最佳时机. 我在 DKNightVersion 中使用 method swizlling 来修改原有的方法时, 就是在分类 load 中实现的.
 */

+(void)load{
    Dlog(@"loadAinitializeTest-----load");
}


/**
 该类的第一个方法执行之前调用
 
 */
+(void)initialize{
    Dlog(@"loadAinitializeTest-----initialize");
}

+(void)initializeTestBegin{
    Dlog(@"loadAinitializeTest-----initializeBegin");
}
@end
