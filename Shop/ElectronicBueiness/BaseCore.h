//
//  BaseCore.h
//  ElectronicBueiness
//
//  Created by yao on 14-8-27.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCore : NSObject
+ (BaseCore *)shareBaseCore;
- (void)configBaseCoreInfo;
@end
