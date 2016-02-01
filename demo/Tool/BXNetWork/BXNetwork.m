//
//  BXNetwork.m
//  网络请求封装工具类
//
//  Created by bianxiang on 15/12/25.
//  Copyright © 2015年 bianxiang. All rights reserved.
//

/**
 要使用常规的AFN网络访问
 
 1. AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 
 所有的网络请求,均有manager发起
 
 2. 需要注意的是,默认提交请求的数据是二进制的,返回格式是JSON
 
 1> 如果提交数据是JSON的,需要将请求格式设置为AFJSONRequestSerializer
 2> 如果返回格式不是JSON的,
 
 3. 请求格式
 
 AFHTTPRequestSerializer            二进制格式
 AFJSONRequestSerializer            JSON
 AFPropertyListRequestSerializer    PList(是一种特殊的XML,解析起来相对容易)
 
 4. 返回格式
 
 AFHTTPResponseSerializer           二进制格式
 AFJSONResponseSerializer           JSON
 AFXMLParserResponseSerializer      XML,只能返回XMLParser,还需要自己通过代理方法解析
 AFXMLDocumentResponseSerializer (Mac OS X)
 AFPropertyListResponseSerializer   PList
 AFImageResponseSerializer          Image
 AFCompoundResponseSerializer       组合
 */

#import "BXNetwork.h"

#define kUploadAPI @"http://192.168.11.42:81/upload.ashx"

@implementation BXNetwork

#pragma mark - 检测网路状态
+ (void)checknetWorkStatus:(StatusBlock)statusBlock
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%ld", status);
        statusBlock(status);
    }];
    
}

#pragma mark - 一般的GET请求
+ (void)getWithUrl:(NSString *)url parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    // 网络请求类
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    // 解析格式 : 不设置具体的解析格式,只需要拿到数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    /** 参数
     1，请求路径
     2，请求参数
     3，成功的block
     4，失败的block
     */
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
    
}

#pragma mark - JSON方式post提交数据
+ (void)postJSONWithUrl:(NSString *)url parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    // 网络请求类
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    
    // 设置请求格式为JSON
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 解析格式 : 不设置具体的解析格式,只需要拿到数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    /** 参数
     1，请求路径
     2，请求参数
     3，成功的block
     4，失败的block
     */
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
    /** Post请求和Get请求的区别
     1. Get请求的参数会明显的显示在地址栏上,Post请求的参数不会显示.在这一点上,Post请求的安全性比Get请求的安全性要高.
     
     2. Post请求多用于向服务器发送数据包,比如上传文件.而Get请求多用于简单地从服务器获取数据.在这个一点上,Post请求的安全性大大降低了。
     */
    
}

#pragma mark - JSON方式post上传图片
+ (void)postJSONFileWithUrl:(NSString *)url fileURL:(NSURL *)fileURL parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    // 设置请求格式为JSON
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 解析格式 : 不设置具体的解析格式,只需要拿到数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        
        /**
         *  按照原来比例上传
         */
//        NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"1"]);
        
//        NSData *data = UIImageJPEGRepresentation([UIImage imageNamed:@"1"], 0.5);

//        NSString *path = [[NSBundle mainBundle]pathForResource:@"1.png" ofType:nil];
//        NSURL *fileUrl = [NSURL fileURLWithPath:path];
        
        /*!
         FileURL：文件url
         name：服务端参数名称，一般都是file
         fileName：客户端给文件起的名称
         mimeType：文件类型
         */
        [formData appendPartWithFileURL:fileURL name:@"file" fileName:@"haha.png" mimeType:@"image/png" error:nil];
        
        //image/jpg
        //image/png
        //image/gif
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

@end
