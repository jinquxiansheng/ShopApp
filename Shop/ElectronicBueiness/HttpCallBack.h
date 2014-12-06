//
//  HttpCallBack.h
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^HttpDoneBlock)(id result, NSUInteger tag);
typedef void (^HttpFailedBlock)(NSError *error);
typedef void (^HttpNoNetBlock)(void);
@interface HttpCallBack : NSObject
@property (nonatomic, copy) HttpDoneBlock doneBlock;
@property (nonatomic, copy) HttpFailedBlock failedBlock;
@property (nonatomic, copy) HttpNoNetBlock  noNetBlock;

@end
