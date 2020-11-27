//
//  NSString+Encrypt.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define DesPublicKey @"Xo823-dl230df23r.&"
@interface NSString (Encrypt)
- (NSString*)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSString*)encryptedWith3DESUsingKey:(NSString*)key;
- (NSString*)decryptedWith3DESUsingKey:(NSString*)key;

//Des加密
-(NSString *)encryptUseDESkey:(NSString *)key;

/**RSA公钥加密*/
-(NSString *)encryptedWithRSAPublicKeyEncodingString;
@end
