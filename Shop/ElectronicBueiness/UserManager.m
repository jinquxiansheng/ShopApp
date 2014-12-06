//
//  UserManager.m
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "UserManager.h"
#import "TestManager.h"

static  UserManager     *manager = nil;
@implementation UserManager
+(UserManager *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[UserManager alloc] init];} );
    return manager;
}

- (void)accessCancel:(NSString *)requestName
{
    if (NSClassFromString(requestName)) {
        [[NSClassFromString(requestName) shareManager] accessCancel:requestName];
    }
}


//以下修改
- (void)accessTokenWithCode:(NSString *)code  callBack:(HttpCallBack *)callback;
{
    
    [[TestManager shareManager] accessTokenWithCode:code callBack:callback];
}
@end
