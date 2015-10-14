//
//  YJZMainViewController.m
//  BabyComing
//
//  Created by lanou3g on 15/10/14.
//  Copyright (c) 2015年 YJZ. All rights reserved.
//

#import "YJZMainViewController.h"
#import "YJZVideoCollectionViewController.h"
#import "YJZPhotoCollectionViewController.h"
@interface YJZMainViewController ()

@property (nonatomic , strong) YJZVideoCollectionViewController *videoVC;
@property (nonatomic , strong) YJZPhotoCollectionViewController *photoVC;
@property (nonatomic , assign) BOOL flags;

@end

@implementation YJZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.flags = YES;
    self.navigationItem.title = @"BabyShow";
    [self p_setup];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"come" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];

    
}
-(void)p_setup{
    UICollectionViewFlowLayout *layout1= [[UICollectionViewFlowLayout alloc]init];
    self.photoVC = [[YJZPhotoCollectionViewController alloc]initWithCollectionViewLayout:layout1];
    self.photoVC.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    UICollectionViewFlowLayout *layout2= [[UICollectionViewFlowLayout alloc]init];
    self.videoVC = [[YJZVideoCollectionViewController alloc]initWithCollectionViewLayout:layout2];
    self.videoVC.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame));
    [self addChildViewController:_photoVC];
    [self addChildViewController:_videoVC];
    [self.view addSubview:_videoVC.view];
    [self.view addSubview:_photoVC.view];
}
- (void)rightBarButtonItemAction:(UIBarButtonItem *)sender{
    if (self.flags == YES) {
        [self transitionFromViewController:self.photoVC toViewController:self.videoVC duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL finished) {}];
        self.flags = NO;
    }else{
        [self transitionFromViewController:self.videoVC toViewController:self.photoVC duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{} completion:^(BOOL finished) {}];
        self.flags = YES;
    }
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
