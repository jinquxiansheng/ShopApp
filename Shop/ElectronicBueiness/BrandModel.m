//
//  BrandModel.m
//  ElectronicBueiness
//
//  Created by yao on 14-9-7.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "BrandModel.h"

@implementation BrandModel
- (void)attachToDictionary:(NSDictionary *)dict
{
   
    _CODE_GETCHINESESTRING_(dict, @"abateTime", self.abateTime, @"")
    _CODE_GETCHINESESTRING_(dict, @"brandName", self.brandName, @"")
    _CODE_GETCHINESESTRING_(dict, @"carStyleName", self.carSytleName, @"")
    _CODE_GETSTRING_(dict, @"carPic", self.carPic, @"")
    
}
@end
