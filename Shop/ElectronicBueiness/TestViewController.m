//
//  TestViewController.m
//  ElectronicBueiness
//
//  Created by yao on 14-8-26.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "TestViewController.h"
#import "Test2ViewController.h"
@interface TestViewController ()

{
    NavBaseViewController               *_home1Nav;
}
@end

@implementation TestViewController

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
    [self customNavigationHeadTitle:@"测试软件"];
    [self customNavigationBack:@"返回" normalImage:@"" highlightImage:@""];
    [self customNavigationDone:@"完成" normalImage:@"" highlightImage:@""];
    _home1Nav = [[NavBaseViewController alloc]initWithRootViewController:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)navigationDone:(id)sender
{
    [self.navigationController pushViewController:[[Test2ViewController alloc] initWithNibName:@"Test2ViewController" bundle:nil] animated:YES];
    
}
@end
