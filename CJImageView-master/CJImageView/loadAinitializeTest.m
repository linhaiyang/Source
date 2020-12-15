//
//  loadAinitializeTest.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "loadAinitializeTest.h"
@implementation loadAinitializeTest
//- (void)initCSocket{
//    self.didSelecBlock = ^NSString * _Nonnull(NSString * _Nonnull blockT) {
//
//        return @"1";
//    };
//}
+ (void)dataWithBytesNoCopy:(void *)bytes{
    
}
- (void)initCSocket{
    UIViewController * controller=self.viewController;
    self.didSelecBlock = ^NSString * _Nonnull(NSString * _Nonnull blockT) {

        return @"1";
    };
}

+(void)initializeTestBegin{
    
    NSString * string = @"loadAinitializeTest";
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    Byte byte[] = {1,2,3,4,5,6,7,8,9,10};
    NSData *byteData = [[NSData alloc] initWithBytes:byte length:10];
    
    //NSData 转换成 Byte
    Byte *testByte = (Byte *)[data bytes];//\x01\x02\x03\x04\x05\x06\a\b\t\n
    
    
    /**
     7b22636f 6465223a 3230302c 22646174 61223a7b 226e6f74 69636522 3a312c22 6269675f 6164223a 7b226964 223a2233 39353922 2c227469 746c6522 3a22222c 2275726c 223a2238 38222c22 696d675f 75726c22 3a22222c 22736f72 74223a22 30222c22 706f7369 74696f6e 5f696422 3a223330 39222c22 69735f70
     
     */
}




@end
