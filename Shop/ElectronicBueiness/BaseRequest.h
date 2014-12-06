//
//  BaseRequest.h
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"AFNetworking.h"
#import "InteralCache.h"
#import "JSONKit.h"
typedef NS_ENUM(NSInteger, RequestType)
{
    Get,
    Post
};

@interface BaseRequest :    NSObject
@property (nonatomic,copy)  NSString *url;
@property (nonatomic,assign)RequestType  requestType;
@property (nonatomic,copy)  NSString *errorCode;
@property (nonatomic,copy)  NSString *cookie;
@property (nonatomic,retain)AFHTTPRequestOperationManager *manager;
@property (nonatomic,assign)BOOL  needSaveCache;
@property (nonatomic,retain)NSDictionary  *resultDic;

- (void)sendToServer:(HttpCallBack *)callback;
- (BOOL)addPostParameter:(NSString *)strName value:(NSString *)strValue;
- (BOOL)addGetParameter:(NSString *)strSection value:(NSString *)strValue;
- (void)cancelRequest;
- (void)setHttpManager;
- (void)saveCache:(id)object;
- (BOOL)cacheQuery;                 //读取缓存
- (BOOL)dataOverDue:(NSTimeInterval)interval date:(NSDate *)date;   //缓存过期时间

@end
