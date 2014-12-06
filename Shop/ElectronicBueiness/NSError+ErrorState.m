//
//  NSError+ErrorState.m
//  ElectronicBueiness
//
//  Created by yao on 14-9-2.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "NSError+ErrorState.h"
#import <objc/runtime.h>
static char errorkey;
static char netCurState;
@implementation NSError (ErrorState)

- (NSString *)errorMsg
{
    return objc_getAssociatedObject(self, &errorkey);
}
- (void)setErrorMsg:(NSString *)errorMsg
{
    objc_setAssociatedObject(self, &errorkey,errorMsg, OBJC_ASSOCIATION_RETAIN);
}

- (int)NetState
{
    return [objc_getAssociatedObject(self, &netCurState) intValue];
}
- (void)setNetState:(int)NetState
{
    NSString *netStateStr = [NSString stringWithFormat:@"%d",NetState];
     objc_setAssociatedObject(self, &netCurState,netStateStr, OBJC_ASSOCIATION_ASSIGN);
}
@end
