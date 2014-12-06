//
//  TestManager.m
//  ElectronicBueiness
//
//  Created by yao on 14-8-29.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "TestManager.h"
#import "EasyAccessTokenRequest.h"
static  TestManager    *manager = nil;

@implementation TestManager
+(TestManager *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[TestManager alloc] init];} );
    return manager;
}


- (void)accessTokenWithCode:(NSString *)code  callBack:(HttpCallBack *)callback;
{
    
    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
    selfCallBack.doneBlock = ^(id result,NSUInteger tag)
    {
        callback.doneBlock (result,tag);
    };
    selfCallBack.failedBlock = ^(NSError *error)
    {
         callback.failedBlock (error);
               
    };
    [[EasyAccessTokenRequest shareManager] accessTokenWithCode:code
                                                      callBack:selfCallBack];
}
- (void)accessCancel:(NSString *)requestName
{
    [[EasyAccessTokenRequest shareManager]cancel];
}
@end
