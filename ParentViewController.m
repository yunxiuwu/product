//
//  ParentViewController.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-1.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "ParentViewController.h"

@interface ParentViewController ()

@end

@implementation ParentViewController
{
    UISearchBar *_searchBar;
    UISearchController *_searchC;
}
- (void)dealloc
{
    [_searchBar release];
    [_searchC release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNavigationBarItem];
    [self createSearchBar];
}
-(void)creatNavigationBarItem
{
    //设置导航栏的背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar.png"] forBarMetrics:UIBarMetricsDefault];
    
    //创建左边“设置”按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButton.frame = CGRectMake(0, 0, 45, 30);
    //设置标题
    [leftButton setTitle:@"分类" forState:UIControlStateNormal];
    //设置按钮背景图片
    [leftButton setBackgroundImage:[UIImage imageNamed:@"buttonbar_action.png"] forState:UIControlStateNormal];
    //设置标题字体大小
    leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
    //设置标题字体颜色
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    //创建右边“配置”按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightButton.frame = CGRectMake(0, 0, 45, 30);
    //设置标题
    [rightButton setTitle:@"配置" forState:UIControlStateNormal];
    //设置按钮背景图片
    [rightButton setBackgroundImage:[UIImage imageNamed:@"buttonbar_action.png"] forState:UIControlStateNormal];
    //设置标题字体大小
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    //设置标题字体颜色
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}
-(void)leftButtonClick{
    
}

-(void)rightButtonClick{
    
}
-(void)createSearchBar
{
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 40)];
    
    _searchC = [[UISearchController alloc]initWithSearchResultsController:self];
    [self.navigationController.view addSubview:_searchBar];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
