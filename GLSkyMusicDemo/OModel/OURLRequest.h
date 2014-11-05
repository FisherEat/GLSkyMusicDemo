//
//  OSession.h
//  CJSX
//
//  Created by 何振东 on 14-5-7.
//  Copyright (c) 2014年 CJTX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/**
 *  网络交互主类。
 *  简化网络操作工具类。请求操作只返回成功数据代理，失败处理在本类里统一做处理。
 */

@interface OURLRequest : NSObject
/// 网络交互主操作类，所有的操作通过该实例完成。
@property (strong, nonatomic, readonly) AFHTTPSessionManager *sessionManager;

/// 网络交互基站点，可为域名或ip地址，必须在初始化时配置
@property (strong, nonatomic, readonly) NSURL *baseURL;


/**
 *  OURLRequest单例返回方法
 *
 *  @warning 应始终通过单例获取
 *  @return 返回OURLRequest单例
 */
+ (instancetype)sharedInstance;

- (void)cancelRequest;

/**
 *  post方式请求网络，成功后数据通过seccess代码块返回，失败不作处理。
 *
 *  @param path    请求地址的路径，无须路径则为nil。
 *  @param params  请求的参数，无须参数则为nil
 *  @param success 成功后进入的代理，返回成功后的数据
 */
- (void)postForPath:(NSString *)path withParams:(NSDictionary *)params success:(void (^) (NSDictionary *data))success;

/**
 *  post方式请求网络，成功后数据通过seccess代码块返回，失败不作处理。
 *
 *  @param path    请求地址的路径，无须路径则为nil。
 *  @param params  请求的参数，无须参数则为nil
 *  @param tag     标记请求
 *  @param success 成功后进入的代理，返回成功后的数据
 */
- (void)postForPath:(NSString *)path withParams:(NSDictionary *)params withTag:(NSUInteger)tag success:(void (^)(NSDictionary *data, NSUInteger tag))success;

/**
 *  get方式请求网络，成功后数据通过seccess代码块返回，失败不作处理。
 *
 *  @param path    请求地址的路径，无须路径则为nil。
 *  @param params  请求的参数，无须参数则为nil
 *  @param success 成功后进入的代理，返回成功后的数据
 */
- (void)getForPath:(NSString *)path withParams:(NSDictionary *)params success:(void (^) (NSDictionary *data))success;

/**
 *  get方式请求网络，成功后数据通过seccess代码块返回，失败不作处理。
 *
 *  @param path    请求地址的路径，无须路径则为nil。
 *  @param params  请求的参数，无须参数则为nil
 *  @param tag     标记请求
 *  @param success 成功后进入的代理，返回成功后的数据
 */
- (void)getForPath:(NSString *)path withParams:(NSDictionary *)params withTag:(NSUInteger)tag success:(void (^)(NSDictionary *data, NSUInteger tag))success;

@end
