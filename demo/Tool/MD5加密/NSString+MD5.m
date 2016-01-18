//
//  NSString+MD5.m
//  StupidFM
//
//  Created by 寒竹子 on 15/6/19.
//  Copyright (c) 2015年 寒竹子. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h> // MD5 header

@implementation NSString (MD5)

// MD5加密
- (NSString *)MD5
{
    const char * cstr = [self UTF8String];
    unsigned char result[16];
    
    CC_MD5(cstr, strlen(cstr), result);  // MD5
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1],  result[2],  result[3],
            result[4], result[5],  result[6],  result[7],
            result[8], result[9],  result[10], result[11],
            result[12],result[13], result[14], result[15]];
}

@end
