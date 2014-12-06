//
//  BaseModel.h
//  ElectronicBueiness
//
//  Created by yao on 14-8-25.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
- (void)attachToDictionary:(NSDictionary *)dict;
#pragma mark - 通用函数
//----------------------------------------------------------------------------------------------------------------------
//  通用函数
//----------------------------------------------------------------------------------------------------------------------
#define _CODE_GETCHINESESTRING_(dict,key,x,default) do{if( !dict || !key ){ x = default; break; }\
NSString *strTemp = [dict objectForKey:key];\
if( !strTemp || [strTemp isKindOfClass:[NSNull class]] ){ x = default; NSLog(@"[GET STRING ERR]no value for key '%@'", key); break; }\
x = strTemp;\
x = [x stringByReplacingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];\
}while(0);

#define _CODE_GETSTRING_(dict, key, x, default) do{if( !dict || !key ){ x = default; break; }\
NSString *strTemp = [dict objectForKey:key];\
if( !strTemp || [strTemp isKindOfClass:[NSNull class]] ){ x = default;  break; }\
x = strTemp;\
}while(0);
#define _CODE_GETINTVALUE_(dict, key, x, default) do{if( !dict || !key ){ x = default; break; }\
NSString *strTemp = [dict objectForKey:key];\
if( !strTemp || [strTemp isKindOfClass:[NSNull class]] ){ x = default;  break; }\
x = [strTemp integerValue];\
}while(0);
#define _CODE_GETFLOATVALUE_(dict, key, x, default) do{if( !dict || !key ){ x = default; break; }\
NSString *strTemp = [dict objectForKey:key];\
if( !strTemp || [strTemp isKindOfClass:[NSNull class]] ){ x = default; NSLog(@"[GET STRING ERR]no value for key '%@'", key); break; }\
x = [strTemp floatValue];\
}while(0);
#define _CODE_GETINTSTRING(dict, key, x, default) do{if( !dict || !key ){ x = default; break; }\
NSNumber *number = [dict objectForKey:key];\
if( !number || [number isKindOfClass:[NSNull class]]){ x = default;  break; }\
x = [NSString stringWithFormat:@"%d", [number integerValue]];\
}while(0);

#define _CODE_GETLONGSTRING(dict, key, x, default) do{if( !dict || !key ){ x = default; break; }\
NSNumber *number = [dict objectForKey:key];\
if( !number || [number isKindOfClass:[NSNull class]]){ x = default; NSLog(@"[GET STRING ERR]no value for key '%@'", key); break; }\
x = [NSString stringWithFormat:@"%ld", [number longValue]];\
}while(0);

#define _CODE_GETFLOATSTRING(dict, key, x, default) do{if( !dict || !key ){ x = default; break; }\
NSNumber *number = [dict objectForKey:key];\
if( !number || [number isKindOfClass:[NSNull class]]){ x = default; NSLog(@"[GET STRING ERR]no value for key '%@'", key); break; }\
x = [NSString stringWithFormat:@"%.2f", [number floatValue]];\
}while(0);
#define _CODE_GETBOOLVALUE(dict, key, x, default) do{if( !dict || !key ){ x = default; break; }\
NSNumber *number = [dict objectForKey:key];\
if( !number || [number isKindOfClass:[NSNull class]]){ x = default; NSLog(@"[GET STRING ERR]no value for key '%@'", key); break; }\
x = [number integerValue] == 0 ? NO : YES;\
}while(0);

@end
