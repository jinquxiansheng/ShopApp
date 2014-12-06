//
//  InteralCache.m
//  ElectronicBueiness
//
//  Created by yao on 14-8-27.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "InteralCache.h"
#import "DataManager.h"
static      InteralCache    *interalManager = nil;
@implementation InteralCache
+ (InteralCache *)shareInteralCache
{

    static dispatch_once_t token;
    dispatch_once(&token,^{ interalManager = [[InteralCache alloc] init];} );
    return interalManager;

}

#pragma mark - 公有信息保存文件
- (NSString *)publicFile
{
    NSString *strRet = nil;
    NSString *strPath = NSHomeDirectory();
    strRet = [strPath stringByAppendingPathComponent:@"Library/internalCache.common.plist"];
    return strRet;
}


- (BOOL)firstStart
{
    BOOL bRet = TRUE;
    NSString *strPath = [self publicFile];
    if( !strPath )
    {
        return FALSE;
    }
    NSDictionary *rootDict = [[NSDictionary alloc]initWithContentsOfFile:strPath];
    if( !rootDict )
    {
        return FALSE;
    }
    do
    {
        NSDictionary *systemDict = [rootDict objectForKey:INTERNALCACHE_KEY_SYSTEM];
        if( !systemDict )
        {
            break;
        }
        NSString *strDate1 = [systemDict objectForKey:INTERNALCACHE_SUBKEY_SYSTEM_FIRSTSTART];
        if( !strDate1 )
        {
            break;
        }
        NSString *strDate2 = [systemDict objectForKey:INTERNALCACHE_SUBKEY_SYSTEM_LASTSTART];
        if( !strDate2 )
        {
            break;
        }
        if( ![strDate1 isEqualToString:strDate2] )
        {
            bRet = FALSE;
        }
    }while(0);
    return bRet;
}
#pragma mark - 系统启动
- (void)systemStart
{
    NSString *strPath = [self publicFile];
    if( !strPath )
    {
        return;
    }
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc]initWithContentsOfFile:strPath];
    if( !rootDict )
    {
        rootDict = [[NSMutableDictionary alloc]init];
    }
    NSMutableDictionary *systemDict = [rootDict objectForKey:INTERNALCACHE_KEY_SYSTEM];
    NSString *strDate = [[NSDate date] description];
    if( !systemDict )
    {
        systemDict = [[NSMutableDictionary alloc]init];
        [systemDict setObject:strDate forKey:INTERNALCACHE_SUBKEY_SYSTEM_FIRSTSTART];
        [rootDict setObject:systemDict forKey:INTERNALCACHE_KEY_SYSTEM];
    }
    [systemDict setObject:strDate forKey:INTERNALCACHE_SUBKEY_SYSTEM_LASTSTART];
    [rootDict writeToFile:strPath atomically:YES];
}


- (void)saveTestData:(id)object
{
    [[DataManager shareManager] saveTestData:object];
}
- (NSString *)selectQuery:(NSDate **)date
{
   return  [[DataManager shareManager] selectQuery:date];
}
@end
