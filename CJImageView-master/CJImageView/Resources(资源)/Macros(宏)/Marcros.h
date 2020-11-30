//
//  Marcros.h
//  CJImageView
//
//  Created by shengkai li on 2020/6/19.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#ifndef Marcros_h
#define Marcros_h

#ifdef DEBUG

//#define Dlog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define Dlog(format, ...)  printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] );
#else

#define Dlog(...)

#endif

//默认间距
#define KNormalSpace 12.0f


//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
/**
 const
这个单词翻译成中文是“常量”的意思
 int  const  *p   //  *p只读 ;p变量

 int  * const  p  // *p变量 ; p只读

 const  int   * const p //p和*p都只读

 int  const  * const  p   //p和*p都只读

 */

/**
 static  静态
 （1）修饰局部变量 保证局部变量永远只初始化一次，在程序的运行过程中永远只有一份内存 生命周期类似全局变量
 （2）修饰全局变量 使全局变量的作用域仅限于当前文件内部，即当前文件内部才能访问该全局变量。GCD一次函数创建的单例
 */


#endif /* Marcros_h */
