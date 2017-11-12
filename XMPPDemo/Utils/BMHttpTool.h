//
//  BMHttpTool.h
//  ZPM
//
//  Created by 陈宇 on 15/3/20.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface BMHttpTool : NSObject

kSingletonH

typedef void(^successBlock)(id response);
typedef void(^failureBlock)(NSError *error);

- (void)postWithPath:(NSString *)path params:(NSDictionary *)params flages:(BOOL)flage success:(successBlock)success failure:(failureBlock)failure;


/**
 *  发送HTTP GET请求
 *
 *  @param path    请求url地址
 *  @param params  请求参数
 *  @param success 服务器响应成功回调block
 *  @param failure 服务器响应失败回调block
 */
- (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

/**
 *  发送HTTP POST请求
 *
 *  @param path    请求url地址
 *  @param params  请求参数
 *  @param success 服务器响应成功回调block
 *  @param failure 服务器响应失败回调block
 */
- (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

/**
 *  通过HTTP POST MultipartFormData上传文件
 *
 *  @param path    请求地址
 *  @param params  请求参数
 *  @param files   需要上传的文件
 *  @param success 服务器响应成功回调block
 *  @param failure 服务器响应失败回调block
 */
- (void)uploadWithPath:(NSString *)path params:(NSDictionary *)params files:(NSDictionary *)files success:(successBlock)success failure:(failureBlock)failure;

@end
