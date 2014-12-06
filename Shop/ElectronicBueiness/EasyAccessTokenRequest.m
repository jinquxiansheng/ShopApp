//
//  AccessTokenRequest.m
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "EasyAccessTokenRequest.h"
#import <objc/runtime.h>
#import "BrandModel.h"
static     EasyAccessTokenRequest   *manager = nil;
@interface EasyAccessTokenRequest ()

@end
@implementation EasyAccessTokenRequest
+ (EasyAccessTokenRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[EasyAccessTokenRequest alloc] init];} );
    return manager;
}

- (void)accessTokenWithCode:(NSString *)code  callBack:(HttpCallBack *)callback
{
    [self setHttpManager];
    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
     __weak EasyAccessTokenRequest *bself = self;
    //[self.tokenInfo saveTokenInfo:nil];
    selfCallBack.doneBlock = ^(id result,NSUInteger tag)
    {
        NSArray *resultArray = [result objectForKey:@"items"];
        NSMutableArray *resultReturn = [[NSMutableArray alloc] init];
        NSLog(@"%@",resultArray);
        for (NSDictionary *dict in resultArray) {
            BrandModel *model = [[BrandModel alloc] init];
            [model attachToDictionary:dict];
            [resultReturn addObject:model];
        }

        if (bself.needSaveCache)
        {
            [bself saveCache:result];
        }
        
        callback.doneBlock (resultReturn,1);
    };
    selfCallBack.failedBlock = ^(NSError *error)
    {
        callback.failedBlock (error);
        
    };
    self.needSaveCache = TRUE;
    self.url = @"http://buy.auto.sohu.com/pay/app/choose/quoteList.json?pageOffset=0&cityCode=110000&pageSize=10&ddpIdFlag=1";
     self.requestType = Get;
    [self sendToServer:selfCallBack];
    
}
#pragma mark - 保存数据到缓存
- (void)saveCache:(id)object
{
    [[InteralCache shareInteralCache] saveTestData:object];
}
#pragma mark -读取缓存
- (BOOL)cacheQuery
{
    NSDate *date = nil;
    NSString *jsonStr = [[InteralCache shareInteralCache] selectQuery:&date];
    self.resultDic = [jsonStr objectFromJSONString];
    if ([self dataOverDue:CACHEOVERTIME date:date])
        return FALSE;
    return TRUE;
}

- (void)cancel
{
    [self.manager.operationQueue cancelAllOperations];
    [super cancelRequest];
  
}

@end
