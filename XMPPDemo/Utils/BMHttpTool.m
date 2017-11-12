//
//  BMHttpTool.m
//  ZPM
//
//  Created by 陈宇 on 15/3/20.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import "BMHttpTool.h"
#import "BMMainTool.h"
#import "AFNetworking.h"
#import "JJTools.h"
// 10.58.174.158:8080  lxh

//http://10.58.174.240:8888/yhyj/   dyl
//#define SERVER_PATH @"http://10.58.174.240:8888/yhyj/"


//#define SERVER_PATH   @"http://43.254.54.251:8084/yhyj/"
@interface BMHttpTool ()

//@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation BMHttpTool

kSingletonM

- (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    [BMMainTool showMessage:@"网络加载中，请耐心等候..."];
    [self.manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [BMMainTool hideMessage];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [BMMainTool hideMessage];
        if (failure) {
            failure(error);
        }
    }];
}

- (void)postWithPath:(NSString *)path params:(NSDictionary *)params flages:(BOOL)flage success:(successBlock)success failure:(failureBlock)failure;
{
    [BMMainTool showMessage:@"网络加载中，请耐心等候..."];
    [self.manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [BMMainTool hideMessage];
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [BMMainTool showToast:error.userInfo[@"NSLocalizedDescription"] delay:2];
        if (failure) {
            failure(error);
        }
    }];
}

- (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    [BMMainTool showMessage:@"网络加载中，请耐心等候..."];
    
    [self.manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [BMMainTool hideMessage];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [BMMainTool hideMessage];
        if (failure) {
            failure(error);
        }
    }];
}

- (void)uploadWithPath:(NSString *)path params:(NSDictionary *)params files:(NSDictionary *)files success:(successBlock)success failure:(failureBlock)failure
{
    [BMMainTool showMessage:@"网络加载中，请耐心等候..."];
    [self.manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (files) {
            [files enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                [formData appendPartWithFileData:obj name:key fileName:@"121.jpeg" mimeType:@"image/jpeg"];
            }];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kServerPath]];
        _manager.requestSerializer.timeoutInterval = 10.f;
    }
    return _manager;
}


@end
