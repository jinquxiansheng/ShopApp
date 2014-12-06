//
//  BaseRequest.m
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "BaseRequest.h"
#import "NSError+ErrorState.h"
@interface BaseRequest()
{
    NSMutableDictionary *_dataModePost;
    NSMutableDictionary *_dataModeGet;
    
}
@end

@implementation BaseRequest

- (void)dealloc
{
    self.url = nil;
    self.errorCode = nil;
    self.cookie = nil;
    [self baseClear];
    [super dealloc];
}
- (void)saveCache:(id)object
{
    
}
- (BOOL)cacheQuery
{
    return false;
}
- (void)sendToServer:(HttpCallBack *)callback;
{
    __block BaseRequest   *bself = self;
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];//设置相应内容类型
    if (self.cookie.length > 0 && self.cookie) {
        [self.manager.requestSerializer setValue:self.cookie forHTTPHeaderField:@"Cookie"];
        
    }
    self.manager.requestSerializer.timeoutInterval = REQUESTTIMEINTERVALOUT;
    if ([self cacheQuery]) {
        //读缓存
        self.needSaveCache = FALSE;
        callback.doneBlock(self.resultDic ,1);
        [self baseClear];
        return;
    }
    else
    {
        if (self.requestType == Get )
        {
            [self.manager GET:self.url parameters:_dataModeGet success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [bself handleSuccesWithObject:responseObject callBack:callback];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [bself handleFaildWithError:error callBack:callback];
        }];
        }
        else
        {
            [self.manager POST:self.url parameters:_dataModePost success:^(AFHTTPRequestOperation *operation, id responseObject)
            {
               [bself handleSuccesWithObject:responseObject callBack:callback];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error)
            {
                 [bself handleFaildWithError:error callBack:callback];
            }];
        }
    }
}
- (void)cancelRequest
{
    [self baseClear];
    
}
- (void)setHttpManager
{
     self.manager = [AFHTTPRequestOperationManager manager];
    
}
#pragma mark - 方法
#pragma mark -添加GET参数
- (BOOL)addGetParameter:(NSString *)strSection value:(NSString *)strValue
{
    if( !_dataModeGet )
    {
        _dataModeGet = [[NSMutableDictionary alloc]init];
    }
    if( !strSection || 0 == strSection.length )
    {
        return FALSE;
    }
    if( !strValue )
    {
       // strValue = @"";
        return FALSE;
    }
    [_dataModeGet setObject:strValue forKey:strSection];
    return TRUE;
    
}
#pragma mark -添加POST参数
- (BOOL)addPostParameter:(NSString *)strName value:(NSString *)strValue
{
    if( !strName || 0 == strName.length )
    {
        return FALSE;
    }
    if( !strValue )
    {
        //strValue = @"";
        return FALSE;
    }
    
    if( !_dataModePost )
    {
        _dataModePost = [[NSMutableDictionary alloc]init];
    }
    [_dataModePost setObject:strValue forKey:strName];
    return TRUE;
}
- (void)baseClear
{
    if( _url )
    {
        [_url release];
        _url = nil;
    }
    if( _dataModeGet )
    {
        [_dataModeGet removeAllObjects];
        [_dataModeGet release];
        _dataModeGet = nil;
    }
    if( _dataModePost )
    {
        [_dataModePost removeAllObjects];
        [_dataModePost release];
        _dataModePost = nil;
    }
    if (self.manager) {
        self.manager = nil;
    }
    if (self.resultDic) {
        self.resultDic = nil;
    }
}
- (BOOL)dataOverDue:(NSTimeInterval)interval date:(NSDate *)date
{
    if( nil == date )
    {
        return TRUE;
    }
    NSDate *dateNow = [NSDate date];
    NSTimeInterval timePass = [dateNow timeIntervalSinceDate:date];
    if( timePass >= interval )
    {
        return TRUE;
    }
    return FALSE;

}
- (void)handleSuccesWithObject:(id)responseObject callBack:(HttpCallBack *)callback
{
    [self baseClear];
    NSDictionary *info = [responseObject objectForKey:@"RESULT"];
    self.resultDic = info;
    callback.doneBlock (self.resultDic,1);
}
- (void)handleFaildWithError:(NSError *)error callBack:(HttpCallBack *)callback
{
 
    NSString *errorMsg = nil;
    switch (error.code) {
        case ERRORCODEWITHOFFLINE:
        {
            errorMsg = ERRORMSGOFFLINE;
            error.NetState = ErrorNoNet;
            break;
        }
        case ERRORCODEWITHTIMEOUT:
        {
            errorMsg = ERRORMSGTIMEOUT;
            error.NetState = ErrorOverTime;
            break;
        }
        case ERRORCODEWITHCANCEL:
            errorMsg = ERRORMSGCANCEL;
            break;
        default:
            break;
    }
    error.errorMsg = errorMsg;
    callback.failedBlock (error);
    [self baseClear];
}
@end
