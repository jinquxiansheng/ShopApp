//
//  UITabBarController+HideTabBar.h
//  ElectronicBueiness
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (HideTabBar)
@property (nonatomic, getter=isTabBarHidden) BOOL tabBarHidden;
- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated;
@end
