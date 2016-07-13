//
//  TabBarViewController.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-1.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "TabBarViewController.h"
#import "LimitViewController.h"
#import "SalesViewController.h"
#import "FreeViewController.h"
#import "HotViewController.h"
#import "SpecialViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController
{
    UIButton *_button;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //限免
    LimitViewController *lvc = [[LimitViewController alloc] init];
    lvc.title = @"限免";
    UINavigationController *lNvc = [[UINavigationController alloc] initWithRootViewController:lvc];
    lNvc.tabBarItem.image = [UIImage imageNamed:@"tabbar_limitfree.png"];
    
    //降价
    SalesViewController *svc = [[SalesViewController alloc] init];
    svc.title = @"降价";
    UINavigationController *sNvc = [[UINavigationController alloc] initWithRootViewController:svc];
    sNvc.tabBarItem.image = [UIImage imageNamed:@"tabbar_reduceprice.png"];
    
    //免费
    FreeViewController *fvc = [[FreeViewController alloc] init];
    fvc.title = @"免费";
    UINavigationController *fNvc = [[UINavigationController alloc] initWithRootViewController:fvc];
    fNvc.tabBarItem.image = [UIImage imageNamed:@"tabbar_appfree.png"];
    
    //专题
    SpecialViewController *spvc = [[SpecialViewController alloc] init];
    spvc.title = @"专题";
    UINavigationController *tNvc = [[UINavigationController alloc] initWithRootViewController:spvc];
    tNvc.tabBarItem.image = [UIImage imageNamed:@"tabbar_subject.png"];
    
    //热榜
    HotViewController *hvc = [[HotViewController alloc] init];
    hvc.title = @"热榜";
    UINavigationController *hNvc = [[UINavigationController alloc] initWithRootViewController:hvc];
    hNvc.tabBarItem.image = [UIImage imageNamed:@"tabbar_rank.png"];
    
    self.viewControllers = @[lNvc,sNvc,fNvc,tNvc,hNvc];
    
    
    [lvc release];
    [lNvc release];
    [svc release];
    [sNvc release];
    [fvc release];
    [fNvc release];
    [hvc release];
    [hNvc release];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
