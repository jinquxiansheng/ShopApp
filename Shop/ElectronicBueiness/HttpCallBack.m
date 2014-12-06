//
//  HttpCallBack.m
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "HttpCallBack.h"

@implementation HttpCallBack
- (void)dealloc
{
    self.doneBlock = nil;
    self.failedBlock = nil;
    self.noNetBlock = nil;
    [super dealloc];
}

@end
