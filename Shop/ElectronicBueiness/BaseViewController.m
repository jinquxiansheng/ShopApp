//
//  BaseViewController.m
//  ElectronicBueiness
//
//  Created by yao on 14-8-26.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

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
    // Do any additional setup after loading the view from its nib.
//    self.tableView.backgroundColor = [UIColor clearColor];
//    self.tableView.separatorColor  = [UIColor clearColor];
//    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.headView.backgroundColor = [UIColor colorWithRed:0.99 green:0.80 blue:0.00 alpha:1.0];
    self.headTitle.frame = CGRectMake(55, 0, 160, 44);
    self.headTitle.textColor = [UIColor blackColor];
    self.headTitle.font = [UIFont boldSystemFontOfSize:18];
    
    self.headTitle.center = CGPointMake(self.view.bounds.size.width / 2, 44 / 2); //所有title居中
    self.headTitle.textAlignment = NSTextAlignmentCenter;
    
    self.btnBack.frame = CGRectMake(5, 0, 44, 44);
    [self.btnBack setImage:[UIImage imageNamed:@"back_normal.png"] forState:UIControlStateNormal];
    [self.btnBack setImage:[UIImage imageNamed:@"back_pressed.png"] forState:UIControlStateHighlighted];
    
    //self.btnRight.frame = CGRectMake(241, 0, 82, 44);
    self.btnRight.frame = CGRectMake(244, 7, 71, 31);
    [self.btnRight setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    self.btnRight.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.btnRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnRight setTitleColor:[UIColor colorWithRed:0.53 green:0.53 blue:0.53 alpha:1.0] forState:UIControlStateHighlighted];
    [self.btnRight setBackgroundImage:[UIImage imageNamed:@"relationModel_normal.png"] forState:UIControlStateNormal];
    [self.btnRight setBackgroundImage:[UIImage imageNamed:@"relationModel_pressed.png"] forState:UIControlStateHighlighted];
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
   
}

#pragma mark -导航栏右边
- (void)navigationDone:(id)sender
{
    
}
#pragma mark - 更改导航栏外观
//----------------------------------------------------------------------------------------------------------------------
//  更改导航栏背景
//----------------------------------------------------------------------------------------------------------------------
- (void)customNavigationBackground
{
    // 如果下面的代码不能正确显示或者是显示效果不理想，就动态生成一个 UIImageView 加到 navigationBar 里。
    // 注意不要重复增加！添加前判断是否已经添加过了！
    // 系统会自动增加一个高光的效果，就是上半部分颜色浅，下半部分颜色深。
    UIImageView *image = (UIImageView *)[self.navigationController.navigationBar viewWithTag:TAG_NAVIGATIONBACKGROUND];
    if( !image )
    {
        image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_Background.png"]];
        image.tag = TAG_NAVIGATIONBACKGROUND;
        image.frame = CGRectMake(0, 0, SCREENWIDTH, tabBarHeight);
        [self.navigationController.navigationBar addSubview:image];
    }
}

//----------------------------------------------------------------------------------------------------------------------
//  更改导航栏标题
//----------------------------------------------------------------------------------------------------------------------
- (void)customNavigationHeadTitle:(NSString *)title
{
    /*UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"newcar.png"]];
     self.navigationItem.titleView = image;
     [image release];*/
    
    UILabel *titleLabel = nil;
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 30)];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment   = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
  
}

//----------------------------------------------------------------------------------------------------------------------
//  更改导航栏左按钮（返回）
//----------------------------------------------------------------------------------------------------------------------
- (void)customNavigationBack:(NSString *)title normalImage:(NSString *)normal highlightImage:(NSString *)highlight
{
    UIView          *custom     = nil;
    UIButton        *button     = nil;
    UIBarButtonItem *barButton  = nil;
    UILabel         *titleLabel = nil;
    
    // UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:normal]];
    // CGRect frame = image.frame;
    custom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    // 按钮
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 0, 35, 30);
    [button addTarget:self action:@selector(navigationBack:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlight] forState:UIControlStateHighlighted];
    [custom addSubview:button];
    // button.frame = CGRectMake(10, 0, frame.size.width, frame.size.height);
    // 标签
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 30)];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textColor = [UIColor colorWithRed:.00 green:.00 blue:.00 alpha:1.0];
    titleLabel.backgroundColor = [UIColor clearColor];
    [custom addSubview:titleLabel];
    // 按钮
    barButton = [[UIBarButtonItem alloc] initWithCustomView:custom];
    self.navigationItem.leftBarButtonItem = barButton;
}

//----------------------------------------------------------------------------------------------------------------------
//  更改导航栏右按钮（完成）
//----------------------------------------------------------------------------------------------------------------------
- (void)customNavigationDone:(NSString *)title normalImage:(NSString *)normal highlightImage:(NSString *)highlight
{
    UIView          *custom     = nil;
    UIButton        *button     = nil;
    UIBarButtonItem *barButton  = nil;
    UILabel         *titleLabel = nil;
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:normal]];
    CGRect frame = image.frame;
    CGFloat width = frame.size.width > 0 ? frame.size.width : 50;
    CGFloat height = frame.size.height > 0?frame.size.height : 30;;
    custom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    // 按钮
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 25, 25);
    [button addTarget:self action:@selector(navigationDone:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    
    int posX = 30;
    if (frame.size.width < 40)
    {
        posX = 30;
    }
    else
    {
        posX = 0;
        frame.size.width = 70;
    }
    button.frame = CGRectMake(posX, 0, width, height);
    
    [button setBackgroundImage:[UIImage imageNamed:highlight] forState:UIControlStateHighlighted];
    [custom addSubview:button];
    // 标签
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(posX, 0, width, height)];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textColor = [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:1.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    [custom addSubview:titleLabel];
    // 按钮
    barButton = [[UIBarButtonItem alloc] initWithCustomView:custom];
    self.navigationItem.rightBarButtonItem = barButton;
}


@end
