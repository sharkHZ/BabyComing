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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
