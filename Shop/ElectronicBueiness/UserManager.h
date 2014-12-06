//
//  UserManager.h
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TestManager;
@interface UserManager : NSObject
+(UserManager *)shareManager;
//测试接口，请求和取消
- (void)accessTokenWithCode:(NSString *)code  callBack:(HttpCallBack *)callback;
- (void)accessCancel:(NSString *)requestName;
//
@end
