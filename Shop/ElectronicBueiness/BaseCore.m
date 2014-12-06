//
//  BaseCore.m
//  ElectronicBueiness
//
//  Created by yao on 14-8-27.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "BaseCore.h"
#import "InteralCache.h"
#import "DataManager.h"
#import "AdImageView.h"

static      BaseCore        *baseManager;

@implementation BaseCore
+ (BaseCore *)shareBaseCore
{
    
    static dispatch_once_t token;
    dispatch_once(&token,^{ baseManager = [[BaseCore alloc] init];} );
    return baseManager;
    
}
- (void)configBaseCoreInfo
{
    //启动信息
    [[InteralCache shareInteralCache] systemStart];
    //数据库配置
    [[DataManager shareManager] createDatabase];
    //广告view
    AdImageView *ad = [[AdImageView alloc] init];
    [ad show];

}
@end
