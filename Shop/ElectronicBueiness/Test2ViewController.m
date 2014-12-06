//
//  Test2ViewController.m
//  ElectronicBueiness
//
//  Created by yao on 14-8-26.
//  Copyright (c) 2014年 yao. All rights reserved.
//


#import "Test2ViewController.h"
#import "BrandModel.h"
#import "TestView2.h"
#import "MJRefresh.h"
#import "MainViewController.h"
@interface Test2ViewController ()
{
    HttpCallBack *selfCallBack ;
    TestView2  *v2;
}
@property (nonatomic,strong) NSMutableArray     *brandArray;

@end

@implementation Test2ViewController

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
    [self customNavigationHeadTitle:@"测试软件2"];
    [self customNavigationBack:@"返回" normalImage:@"" highlightImage:@""];
    [self initView];
   // [self refreshView];
  //  [self setupRefresh];
   
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:NO];
   
}
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [v2.baseTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
#warning 自动刷新(一进入程序就下拉刷新)
    [v2.baseTableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [v2.baseTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    v2.baseTableView.headerPullToRefreshText = @"下拉可以刷新了";
    v2.baseTableView.headerReleaseToRefreshText = @"松开马上刷新了";
    v2.baseTableView.headerRefreshingText = @"正在加载";
    
    v2.baseTableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
    v2.baseTableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
    v2.baseTableView.footerRefreshingText = @"正在加载";
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [self refreshView];
}

- (void)footerRereshing
{
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        //  [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [v2.baseTableView footerEndRefreshing];
    });
}

- (void)initView
{
    if (!v2)
    {
      v2 = [[TestView2 alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT + 48)];
     [self.view addSubview:v2];
    }
}
 -(void)refreshView
{
     __weak  Test2ViewController *bself = self;
    __weak  TestView2  *weakSelf  = v2;
     selfCallBack = [[HttpCallBack alloc] init];
    
    selfCallBack.doneBlock = ^(NSMutableArray *result,NSUInteger tag)
    {
        NoNetView *noView =(NoNetView *) [bself.view viewWithTag:kViewTag];
        [noView hide];
        bself.brandArray = result;
        [bself reloadView];
        [weakSelf.baseTableView headerEndRefreshing];
    };
    selfCallBack.failedBlock = ^(NSError *error)
    {
        if (error.NetState == ErrorNoNet)
        {
            NoNetView *noView = [[NoNetView alloc] initWithSelect:@selector(refreshView) withTarget:bself targetView:bself.view];
            noView.tag = kViewTag;
            [noView showInView:bself.view];
        }
    };
    [MANAGER accessTokenWithCode:@"" callBack:selfCallBack];
}
- (void)navigationBack:(id)sender
{
    [[UserManager shareManager] accessCancel:@"TestManager"];
     [super navigationBack:nil];
}

- (void)reloadView
{
     v2.brandArray = self.brandArray;
    [v2.baseTableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
