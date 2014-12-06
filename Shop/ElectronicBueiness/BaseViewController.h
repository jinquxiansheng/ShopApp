//
//  BaseViewController.h
//  ElectronicBueiness
//
//  Created by yao on 14-8-26.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUI.h"
#import "UserManager.h"
#import "JSONKit.h"
#import "NoNetView.h"
#import "NSError+ErrorState.h"
#import "UIImage+Additions.h"
#import "CommonUI.h"
#define TAG_NAVIGATIONBACKGROUND                                1306
#define         MANAGER                                     [UserManager shareManager]

@interface BaseViewController : UIViewController

//@property (nonatomic,strong) IBOutlet UITableView               *tableView;
@property (nonatomic,strong) IBOutlet UIView                    *headView;
@property (nonatomic,strong) IBOutlet UILabel                   *headTitle;
@property (nonatomic,strong) IBOutlet UIView                    *naviView;
@property (nonatomic,strong) IBOutlet UIButton                  *btnBack;
@property (nonatomic,strong) IBOutlet UIButton                  *btnRight;


- (void)navigationBack:(id)sender;                              // 导航栏左按钮行为（返回）
- (void)navigationDone:(id)sender;                              // 导航栏右按钮行为（完成）
- (void)customNavigationBackground;                             // 更改导航栏背景
- (void)customNavigationHeadTitle:(NSString *)title;            // 更改导航栏标题

- (void)customNavigationBack:(NSString *)title
                 normalImage:(NSString *)normal
              highlightImage:(NSString *)highlight;             // 更改导航栏左按钮（返回）

- (void)customNavigationDone:(NSString *)title
                 normalImage:(NSString *)normal
              highlightImage:(NSString *)highlight;             // 更改导航栏右按钮（完成）

@end
