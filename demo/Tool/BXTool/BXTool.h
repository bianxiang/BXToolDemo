//
//  BXTool.h
//  demo
//
//  Created by lejian on 16/2/1.
//  Copyright © 2016年 lejiantech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXView.h"

typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(NSError *error);

@interface BXTool : NSObject
+ (void)setObject:(id)obj forKey:(NSString *)key;
+ (void)setBool:(BOOL)b forKey:(NSString *)key;

+ (id)objectForKey:(NSString *)key;
+ (BOOL)boolForKey:(NSString *)key;

+ (void)sendNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

// 获取SDWebImage的图片缓存
+ (NSString *)getImageCache;

// 计算文本高度
+ (CGFloat)getTextHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

+ (UIColor *)colorWithHexString:(NSString *)color;

//获取当前时间
+ (NSString*)getCurrentTimeTypeOne;

/**
 *  是否是手机
 */
+ (BOOL)isPhone:(NSString *)phone;

/**
 *  是否是密码
 */
+ (BOOL)isPassword:(NSString *)password;
@end
