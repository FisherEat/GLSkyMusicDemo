//
//  OSession.m
//  CJSX
//
//  Created by 何振东 on 14-5-7.
//  Copyright (c) 2014年 CJTX. All rights reserved.
//

#import "OURLRequest.h"
#import "OLoadingView.h"
#import "GAppDefine.h"

static OURLRequest *SINGLETON = nil;

// 判断是否是通过单例方法获取实例，若不是，则抛出异常。
static BOOL isFirstAccess = YES;

@interface OURLRequest ()
/// 请求管理器
@property (strong, nonatomic, readwrite) AFHTTPSessionManager *sessionManager;
/// 基站点url
@property (strong, nonatomic, readwrite) NSURL *baseURL;

@end

@implementation OURLRequest

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[OURLRequest alloc] init];
    });
    return SINGLETON;
}

- (instancetype)init
{
    if (SINGLETON) {
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (void)cancelRequest
{
    [self.sessionManager invalidateSessionCancelingTasks:YES];
}

- (void)defaultInit
{
    self.baseURL = [NSURL URLWithString:kHostSite];
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:self.baseURL];
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/json", @"application/json", @"application/soap+xml", nil];
//    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.sessionManager.session.configuration.timeoutIntervalForRequest = 20;
    self.sessionManager.responseSerializer = [AFXMLParserResponseSerializer serializer];
}


- (void)postForPath:(NSString *)path withParams:(NSDictionary *)params success:(void (^) (NSDictionary *data))success
{
    [self postForPath:path withParams:params withTag:-1 success:^(NSDictionary *data, NSUInteger tag) {
        success(data);
    }];
}

- (void)postForPath:(NSString *)path withParams:(NSDictionary *)params withTag:(NSUInteger)tag success:(void (^)(NSDictionary *data, NSUInteger tag))success
{
    [[OLoadingView sharedInstance] showLoadingView];
    
    [self.sessionManager POST:path
                   parameters:params
                      success:^(NSURLSessionDataTask *task, id responseObject)
     {
         [[OLoadingView sharedInstance] hideLoadingView];
         
         NSInteger status = [responseObject[@"status"] integerValue];
         if (status == ORequestStatusSuccess) {
             success(responseObject[@"data"], tag);
         }
         else {
             NSString *str = [NSString stringWithFormat:@"请求失败，错误码%ld", (long)status];
             mAlertView(@"提示", str);
         }
     }
                      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         [[OLoadingView sharedInstance] hideLoadingView];
         
         mAlertView(@"提示", error.localizedDescription);
     }];
}

- (void)getForPath:(NSString *)path withParams:(NSDictionary *)params success:(void (^) (NSDictionary *data))success
{
    [self getForPath:path withParams:params withTag:-1 success:^(NSDictionary *data, NSUInteger tag) {
        success(data);
    }];
}

- (void)getForPath:(NSString *)path withParams:(NSDictionary *)params withTag:(NSUInteger)tag success:(void (^)(NSDictionary *, NSUInteger))success
{
    [self.sessionManager GET:path
                  parameters:params
                     success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject, tag);
     }
                     failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
     }];
}

@end
