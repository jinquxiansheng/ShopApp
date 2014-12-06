//
//  DataManager.m
//  AuthDemo
//
//  Created by yao on 14-8-3.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "DataManager.h"
#import "FMDB.h"
#import "JSONKit.h"
static  DataManager     *manager = nil;

@interface DataManager ()
{
    NSMutableArray  *_sleepDataArray;
}
@property (nonatomic,retain)FMDatabase *db;
@end

@implementation DataManager
- (void)dealloc
{
    [self.db close];
    self.db = nil;
}

+(DataManager *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        manager = [[DataManager alloc] init];
    } );
    return manager;
}

- (void)createDatabase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"Shop.db"];
    self.db  = [FMDatabase databaseWithPath:dbPath] ;
    if (![self.db open]) {
        return ;
    }
    [self creatTestTable];
}
-(void)creatTestTable
{
    
    //先判断数据库是否存在，如果不存在，创建数据库
    if(!self.db)
    {
        [self createDatabase];
    }
    //判断数据库是否已经打开，如果没有打开，提示失败
    if(![self.db open])
    {
        NSLog(@"数据库打开失败");
        return;
    }
    //为数据库设置缓存，提高查询效率
    [self.db setShouldCacheStatements:YES];
    
    //判断数据库中是否已经存在这个表，如果不存在则创建该表
    if(![self.db tableExists:@"TestShopTable"])
    {
         NSLog(@"创建完成");

    }
    [self.db executeUpdate:@"CREATE TABLE TestShopTable (key text,info text,curdate)"];
}

- (BOOL)saveTestData:(id)object
{
    if (!self.db) {
        [self createDatabase];
    }
    NSString *dateStr = [[NSDate date] debugDescription];
    NSString *jsonStr = [object JSONString];
    int rowCount = [self.db intForQuery:@"SELECT count(*) FROM TestShopTable where key = ?",@"id"];
    if (rowCount == 0) {
        return [self.db executeUpdate:@"INSERT INTO TestShopTable (key, info,curdate) VALUES (?,?,?)",@"id",jsonStr,dateStr];
    }
   //   [dataDict setObject:[[NSDate date] description] forKey:INTERNALCACHE_KEY_CACHETIME];
   
    BOOL flag = [self.db executeUpdate:@"UPDATE  TestShopTable set info = ? ,curdate = ? where key = ?",jsonStr,dateStr,@"id"];
    return flag;
}

- (NSString *)selectQuery:(NSDate **)date
{
    FMResultSet *rs = [self.db executeQuery:@"SELECT * FROM testshoptable"];
     NSString *result =  nil;
    while ([rs next]) {
       result = [rs stringForColumn:@"info"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZ"];
        if( [rs stringForColumn:@"curdate"] )
        {
            *date = [dateFormatter dateFromString: [rs stringForColumn:@"curdate"] ];
        }

    }
   // NSLog(@"%@",resultDict);
    return result;
}
//- (BOOL)insertSleepWithDate:(NSString *)date
//                  sleepData:(NSString *)sleepData
//{
//    if(!self.db)
//    {
//        [self createDatabase];
//    }
//
//   return  [self.db executeUpdate:@"INSERT INTO SleepListInfo (curdate, sleepData) VALUES (?,?)",date,sleepData];
//}

//- (NSMutableArray *)selectSleepDataArray
//{
//    FMResultSet *rs = [self.db executeQuery:@"SELECT * FROM SleepListInfo"];
//    [_sleepDataArray removeAllObjects];
//    _sleepDataArray = nil;
//    _sleepDataArray = [[NSMutableArray alloc] init];
//    
//    while ([rs next]) {
//        SleepDataInfo *info = [[SleepDataInfo alloc] init];
//        NSString *dates = [rs stringForColumn:@"curdate"];
//        NSString *sleepData = [rs stringForColumn:@"sleepData"];
//        info.curDate = dates;
//        info.sleepQuarity = sleepData;
//        [_sleepDataArray addObject:info];
//        [info release];
//    }
//    [rs close];
//    return _sleepDataArray;
//}
//
//- (NSString *)curDateString
//{
//    NSDate*date = [NSDate date];
//    NSCalendar*calendar = [NSCalendar currentCalendar];
//    NSDateComponents*comps;
//    // 年月日获得
//    comps =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit)
//                       fromDate:date];
//    NSInteger year = [comps year];
//    NSInteger month = [comps month];
//    NSInteger day = [comps day];
//    return [NSString stringWithFormat:@"%d年-%d月-%d日",year,month,day];
//}
//
//- (BOOL)visibleSleepDataWithCur:(NSString *)curStr
//{
//    int rowCount = [self.db intForQuery:@"SELECT count(*) FROM SleepListInfo where curdate = ?",curStr];
//    return rowCount > 0 ?FALSE:TRUE;
//}
@end