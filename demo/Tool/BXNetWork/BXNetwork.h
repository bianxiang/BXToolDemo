//
//  BXNetwork.h
//  网络请求封装工具类
//
//  Created by bianxiang on 15/12/25.
//  Copyright © 2015年 bianxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(NSError *error);
typedef void(^StatusBlock)(AFNetworkReachabilityStatus status);
@interface BXNetwork : NSObject

/**检测网路状态**/
+ (void)checknetWorkStatus:(StatusBlock)statusBlock;

/**
 *  一般GET请求
 *   url          :服务器地址
 *   parameters   :提交的参数内容
 *   successBlock :请求成功的block
 *   failureBlock :请求失败的block
 */
+ (void)getWithUrl:(NSString *)url parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

/**
 *  JSON方式post提交数据
 *   url          :服务器地址
 *   parameters   :提交的参数内容
 *   successBlock :请求成功的block
 *   failureBlock :请求失败的block
 */
+ (void)postJSONWithUrl:(NSString *)url parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

@end
