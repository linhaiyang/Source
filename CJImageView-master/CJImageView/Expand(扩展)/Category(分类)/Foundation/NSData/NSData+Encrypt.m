//
//  NSData+Encrypt.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSData+Encrypt.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (Encrypt)

const Byte ivbyte[] = {1,2,3,4,5,6,7,8};
/**
 *  利用AES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData*)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t dataMoved;
    NSMutableData *encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSizeAES128];
    
    CCCryptorStatus status = CCCrypt(kCCEncrypt,                    // kCCEncrypt or kCCDecrypt
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding,         // Padding option for CBC Mode
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     self.bytes,
                                     self.length,
                                     encryptedData.mutableBytes,    // encrypted data out
                                     encryptedData.length,
                                     &dataMoved);                   // total data moved
    
    if (status == kCCSuccess) {
        encryptedData.length = dataMoved;
        return encryptedData;
    }
    
    return nil;
    
}
/**
 *  @brief  利用AES解密据
 *
 *  @param key key
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData*)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t dataMoved;
    NSMutableData *decryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSizeAES128];
    
    CCCryptorStatus result = CCCrypt(kCCDecrypt,                    // kCCEncrypt or kCCDecrypt
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding,         // Padding option for CBC Mode
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     self.bytes,
                                     self.length,
                                     decryptedData.mutableBytes,    // encrypted data out
                                     decryptedData.length,
                                     &dataMoved);                   // total data moved
    
    if (result == kCCSuccess) {
        decryptedData.length = dataMoved;
        return decryptedData;
    }
    
    return nil;
    
}
/**
 *  利用3DES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData*)encryptedWith3DESUsingKey:(NSString*)key{
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t dataMoved;
    NSMutableData *encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];
    
//     CCOperation op,         /* kCCEncrypt, etc. */
//     CCAlgorithm alg,        /* kCCAlgorithmAES128, etc. */
//     CCOptions options,      /* kCCOptionPKCS7Padding, etc. */
//     const void *key,
//     size_t keyLength,
//     const void *iv,         /* optional initialization vector */
//     const void *dataIn,     /* optional per op and alg */
//     size_t dataInLength,
//     void *dataOut,          /* data RETURNED here */
//     size_t dataOutAvailable,
//     size_t *dataOutMoved)
     
    CCCryptorStatus result = CCCrypt(kCCEncrypt,                    // kCCEncrypt or kCCDecrypt
                                     kCCAlgorithm3DES,
                                     kCCOptionPKCS7Padding,         // Padding option for CBC Mode
                                     keyData.bytes,
                                     keyData.length,
                                     ivbyte,
                                     self.bytes,
                                     self.length,
                                     encryptedData.mutableBytes,    // encrypted data out
                                     encryptedData.length,
                                     &dataMoved);                   // total data moved
    
    if (result == kCCSuccess) {
        encryptedData.length = dataMoved;
        return encryptedData;
    }
    
    return nil;
    
}
/**
 NSString *ciphertext = nil;
 NSData *textData = [self dataUsingEncoding:NSUTF8StringEncoding];
 NSUInteger dataLength = [textData length];
 unsigned char buffer[1024];
 memset(buffer, 0, sizeof(char));
 size_t numBytesEncrypted = 0;
 CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                       kCCAlgorithmDES,
                                        kCCOptionPKCS7Padding,
                                        [key UTF8String],
                                       kCCKeySizeDES,
                                        iv,
                                        [textData bytes],
                                       dataLength,
                                       buffer,
                                       1024,
                                       &numBytesEncrypted);
     if (cryptStatus == kCCSuccess) {
             NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
             ciphertext = [data base64EncodedString];
         }
     return ciphertext;
 
 */
/**
 *  @brief   利用3DES解密数据
 *
 *  @param key key
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData*)decryptedWith3DESUsingKey:(NSString*)key{
    NSString *plaintext = nil;
//    NSData *cipherdata = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                                      kCCOptionPKCS7Padding,
                                                      [key UTF8String], kCCKeySizeDES,
                                          ivbyte,
                                                      [self bytes], [self length],
                                                      buffer, 1024,
                                                      &numBytesDecrypted);
    if(cryptStatus == kCCSuccess)
    {
           NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        return plaindata;
//            plaintext = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
    }
return [NSData new];
}
/**
 *  @brief  NSData 转成UTF8 字符串
 *
 *  @return 转成UTF8 字符串
 */
-(NSString *)UTF8String{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
