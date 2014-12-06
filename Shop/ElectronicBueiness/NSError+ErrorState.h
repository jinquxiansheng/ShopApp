//
//  NSError+ErrorState.h
//  ElectronicBueiness
//
//  Created by yao on 14-9-2.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ErrorStateCode)
{
    ErrorNoNet = 1,
    ErrorOverTime
};

@interface NSError (ErrorState)
@property (nonatomic,copy)NSString  *errorMsg;
@property (nonatomic,assign) int   NetState;
@end
