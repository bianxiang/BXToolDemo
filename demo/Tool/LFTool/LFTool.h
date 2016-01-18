//
//  LFTool.h
//  zs
//
//  Created by administrator on 11/2/15.
//  Copyright © 2015 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(NSError *error);

@interface LFTool : NSObject

+ (void)setObject:(id)obj forKey:(NSString *)key;
+ (void)setBool:(BOOL)b forKey:(NSString *)key;

+ (id)objectForKey:(NSString *)key;
+ (BOOL)boolForKey:(NSString *)key;

+ (void)sendNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

// 获取SDWebImage的图片缓存
+ (NSString *)getImageCache;

// 计算文本高度
+ (CGFloat)getTextHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

@end
