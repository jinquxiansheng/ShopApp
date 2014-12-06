//
//  InteralCache.h
//  ElectronicBueiness
//
//  Created by yao on 14-8-27.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define INTERNALCACHE_KEY_SYSTEM                                            @"system"
#define INTERNALCACHE_SUBKEY_SYSTEM_FIRSTSTART                              @"first start"
#define INTERNALCACHE_SUBKEY_SYSTEM_LASTSTART                               @"last start"
@interface InteralCache : NSObject
+ (InteralCache *)shareInteralCache;
- (BOOL)firstStart;
- (void)systemStart;

- (void)saveTestData:(id)object;
- (NSString *)selectQuery:(NSDate **)date;
@end
