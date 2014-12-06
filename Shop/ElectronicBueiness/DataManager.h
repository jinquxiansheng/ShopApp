//
//  DataManager.h
//  AuthDemo
//
//  Created by yao on 14-8-3.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataManager : NSObject
+(DataManager *)shareManager;
- (void)createDatabase;
//-(void)creatTable;
//- (BOOL)insertSleepWithDate:(NSString *)date
//                  sleepData:(NSString *)sleepData;
//- (NSMutableArray *)selectSleepDataArray;
//- (NSString *)curDateString;
//- (BOOL)visibleSleepDataWithCur:(NSString *)curStr;

- (BOOL)saveTestData:(id)object;
- (NSString *)selectQuery:(NSDate **)date;
@end

