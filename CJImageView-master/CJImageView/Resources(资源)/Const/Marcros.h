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

//中文字体
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
#define kScreenWidthRatio  (KScreen_Width / 375.0)
#define kScreenHeightRatio (KScreen_Height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))

#define UNICODETOUTF16(x) (((((x - 0x10000) >>10) | 0xD800) << 16)  | (((x-0x10000)&3FF) | 0xDC00))
#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

//获取View的属性
#define GetViewWidth(view)  view.frame.size.width
#define GetViewHeight(view) view.frame.size.height
#define GetViewX(view)      view.frame.origin.x
#define GetViewY(view)      view.frame.origin.y

// MainScreen Height&Width
#define KScreen_Height      [[UIScreen mainScreen] bounds].size.height
#define KScreen_Width       [[UIScreen mainScreen] bounds].size.width

// MainScreen bounds
#define Main_Screen_Bounds [[UIScreen mainScreen] bounds]


// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]



//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]

#define MASKCOLOR [[UIColor blackColor] colorWithAlphaComponent:0.5] //蒙版颜色

#define KBlackColor [UIColor blackColor]




//弱引用/强引用  可配对引用在外面用MPWeakSelf(self)，block用MPStrongSelf(self)  也可以单独引用在外面用MPWeakSelf(self) block里面用weakself
#define KWeakSelf(type)  __weak typeof(type) weak##type = type;
#define KStrongSelf(type)  __strong typeof(type) type = weak##type;

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

#if PRODUCT  //产品环境

static NSString* const MBTargetConfig_NetWork_s=@"";

//DDLog等级
static const int ddLogLevel = LOG_LEVEL_ERROR;

#else   //其它环境

//DDLog等级
static const int ddLogLevel = 1;


#endif
#endif /* Marcros_h */
