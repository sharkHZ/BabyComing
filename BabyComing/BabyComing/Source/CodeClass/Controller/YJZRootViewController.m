//
//  YJZRootViewController.m
//  BabyComing
//
//  Created by lanou3g on 15/10/14.
//  Copyright (c) 2015年 YJZ. All rights reserved.
//

#import "YJZRootViewController.h"

@interface YJZRootViewController ()

@end

@implementation YJZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setControllers];
   
    
}
- (void)p_setControllers{
    // mainView
    YJZMainViewController * mainVC = [[YJZMainViewController alloc]init];
    UINavigationController * mainNC = [[UINavigationController alloc]initWithRootViewController:mainVC];
    mainNC.title = @"main";
    // healthView
    YJZHealthTableViewController * healthVC = [[YJZHealthTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    UINavigationController * healthNC = [[UINavigationController alloc]initWithRootViewController:healthVC];
    healthNC.title = @"health";
    // setView
    YJZSetTableViewController * setVC = [[YJZSetTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController * setNC = [[UINavigationController alloc]initWithRootViewController:setVC];
    setNC.title = @"set";
    
    
    self.viewControllers = @[mainNC,healthNC,setNC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - **** 为了实现隐藏导航时的一些bug 只能这么写 ****
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}


@end
