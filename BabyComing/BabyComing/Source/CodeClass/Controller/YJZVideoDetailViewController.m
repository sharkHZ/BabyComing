//
//  YJZVideoDetailViewController.m
//  BabyComing
//
//  Created by 袁新峰 on 15/10/15.
//  Copyright © 2015年 YJZ. All rights reserved.
//

#import "YJZVideoDetailViewController.h"

#import "KrVideoPlayerController.h"

#import "YJZVideoModel.h"

@interface YJZVideoDetailViewController ()

//播放器视图控制器
@property (nonatomic, strong) KrVideoPlayerController *movieViewController;

@end

@implementation YJZVideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    //播放开始
    [self playVideo];
    
    //导航栏
    [self addNavcation];
}
- (void)playVideo{
    NSURL *url = [NSURL URLWithString:self.videoModel.media];
    
    NSLog(@"%@",self.videoModel.media);
    [self addVideoPlayerWithURL:url];
}

- (void)addVideoPlayerWithURL:(NSURL *)url{
    if (!self.movieViewController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        self.movieViewController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, 64, width, height - 115)];
        __weak typeof(self)weakSelf = self;
        [self.movieViewController setDimissCompleteBlock:^{
            weakSelf.movieViewController = nil;
        }];
        [self.movieViewController setWillBackOrientationPortrait:^{
            [weakSelf toolbarHidden:NO];
        }];
        [self.movieViewController setWillChangeToFullscreenMode:^{
            [weakSelf toolbarHidden:YES];
        }];
        [self.view addSubview:self.movieViewController.view];
    }
    self.movieViewController.contentURL = url;
    
}
//隐藏navigation tabbar 电池栏
- (void)toolbarHidden:(BOOL)Bool{
    
    self.navigationController.navigationBar.hidden = Bool;
    self.tabBarController.tabBar.hidden = Bool;
    [[UIApplication sharedApplication] setStatusBarHidden:Bool withAnimation:UIStatusBarAnimationFade];
}

#pragma mark - *********** 导航栏 *************

- (void)addNavcation
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnAction:)];
    
    self.navigationItem.title = @"视频";
    
}

#pragma mark - ************* 导航的点击事件 *************
//back
- (void)backBtnAction:(UIButton *)sender
{
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//shareBtn
- (void)shareBtnAction:(UIButton *)sender
{
    
}


@end
