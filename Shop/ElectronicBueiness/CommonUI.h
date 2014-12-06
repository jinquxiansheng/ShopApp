//
//  CommonUI.h
//  ElectronicBueiness
//
//  Created by yao on 14-8-26.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define   theUICore     [CommonUI shareManager]

@interface CommonUI : NSObject
@property (nonatomic,weak) id                   mainViewController;
@property (nonatomic,weak) UIViewController     *viewController;
- (void)showBottomTab:(BOOL)visible;

+(CommonUI *)shareManager;

@end
