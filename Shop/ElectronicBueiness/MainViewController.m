//
//  MainViewController.m
//  ElectronicBueiness
//
//  Created by yao on 14-9-10.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "MainViewController.h"
#import "ShopViewController.h"
#import "SortViewController.h"
#import "LikeViewController.h"
#import "NavBaseViewController.h"
#import "UITabBarController+HideTabBar.h"
#import "CommonUI.h"
static  const  CGFloat   tabHeight = 48;
static  const  int       viewControllerCount = 5;
@interface MainViewController ()
{
    
    ShopViewController                      *shopCtrl;
    SortViewController                      *sortCtrl;
    LikeViewController                      *likeCtrl;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT-tabHeight,SCREENWIDTH,tabHeight)];
    self.tabbarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tabbarView];
    [self initViewController];
}
- (void)initViewController
{
    //self.view.backgroundColor = [UIColor redColor];
    //self.tabView.backgroundColor = [UIColor clearColor];
    shopCtrl = [[ShopViewController alloc] initWithNibName:@"ShopViewController" bundle:nil];
    sortCtrl = [[SortViewController alloc] initWithNibName:@"SortViewController" bundle:nil];
    likeCtrl  = [[LikeViewController alloc] initWithNibName:@"LikeViewController" bundle:nil];
    NSArray *views = @[shopCtrl,sortCtrl,likeCtrl];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:3];
    for (UIViewController  *viewController in views) {
        NavBaseViewController   *nav = [[NavBaseViewController alloc] initWithRootViewController:viewController];
        [viewControllers addObject:nav];
    }
    self.viewControllers = viewControllers;
    
    self.tabBarHidden = YES;
    NSArray *buttonTextArray = @[@"开始购物",@"分类",@"大家喜欢",@"限时特惠",@"更多"];
    NSArray *buttonXPosArray = @[@0,@59,@120,@196,@257];
    for (int i = 0; i < viewControllerCount; i++) {
        CGFloat x = [[buttonXPosArray objectAtIndex:i] floatValue];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, 0, 63, 48);
        button.tag = i;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:[buttonTextArray objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.textColor = [UIColor blackColor];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabbarView addSubview:button];
    }
    theUICore.mainViewController = self;
}
- (void)selectedTab: (UIButton *)button
{
    self.selectedIndex = button.tag;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
