//
//  CommonData.h
//  ElectronicBueiness
//
//  Created by yao on 14-8-29.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#define         SCREENWIDTH                                  [UIScreen mainScreen ].bounds.size.width
#define         SCREENHEIGHT                                 [UIScreen mainScreen ].bounds.size.height

#define         REQUESTTIMEINTERVALOUT                       20         //网络请求超时时间
#define         ERRORCODEWITHOFFLINE                        -1009       //无网络状态
#define         ERRORCODEWITHTIMEOUT                        -1001       //请求超时
#define         ERRORCODEWITHCANCEL                         -999        //取消请求


#define         ERRORMSGOFFLINE                             @"无网络状态"
#define         ERRORMSGTIMEOUT                             @"网络请求超时"
#define         ERRORMSGCANCEL                              @"请求取消"

#define         kViewTag                                     350        //无网情况

#define         TESTDATAID                                  @"idtest"   //缓存

#define         CACHEOVERTIME                               10         //缓存过期时间

#define         WINDOW                                      [UIApplication sharedApplication].keyWindow

static  const  float  tabBarHeight = 44;