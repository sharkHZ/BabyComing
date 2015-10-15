//
//  YJZPhotoDetailController.m
//  BabyComing
//
//  Created by 袁新峰 on 15/10/15.
//  Copyright © 2015年 YJZ. All rights reserved.
//

#import "YJZPhotoDetailController.h"

#import "YJZphotoModel.h"

#import "YJZPhotoDetailModel.h"
@interface YJZPhotoDetailController () <UIScrollViewDelegate>

@property (nonatomic, strong) YJZPhotoDetailModel *photoDetailModel;

@property (nonatomic, strong) NSMutableArray *listArray;

/**
 页面布局
 */
@property (nonatomic, strong) UIScrollView *imageScrollView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *numLabel;

@property (nonatomic, strong) UITextView *textView;
/**
 分享 自定义导航条
 */
@property (nonatomic, strong) UIView *blackView;
//返回按钮
@property (nonatomic, strong) UIButton *backBtn;
//分享按钮
@property (nonatomic, strong) UIButton *shareBtn;

/**
 手势识别
 */
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;

@end

@implementation YJZPhotoDetailController

@synthesize rightSwipeGestureRecognizer;

#pragma mark - *************** 页面初始化 **************
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //手势识别
    [self addSwipe];
    
    //隐藏 item
    self.navigationItem.hidesBackButton = YES;
    //页面布局
    [self addSubView];
    
    self.imageScrollView.delegate = self;
    NSLog(@"aaaaaaaaaa%@aaaaaaaaaa",self.photoModel.sgid);
    NSString *url = [NSString stringWithFormat:@"http://android.mengbaby.com/sgstar/detail?sgid=%@&lng=116.344263&mac=f4%%3A8b%%3A32%%3A0b%%3A8f%%3Aa3&udid=867299021525431&lang=zh&v=3.0.0&urid=3079529&token=ML3KQe43SxWVbTSrUCmmLUjUu8PcviHYFxoR0dVd3Pw&connectnet=wifi&device=gucci&account=867299021525431&pushid=d//igwEhgBGCI2TG6lWqlDnQtmJT4rXqQP/rKi6+v/5h38BGUgjYLV39nJe0ssFUsv7c6lHO/keDzSk/q9qErDQYlEUah2umQNwP2pRNyjI=&lat=40.0309&dosv=19&ctid=1001&dist=8",self.photoModel.sgid];
    // 发请求
    [self sendRequestWithUrl:url];
}

#pragma mark - ******************** 发请求
- (void)sendRequestWithUrl:(NSString *)url
{
    [[YJZNetWorkTools sharedNetworkTools] GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSMutableArray *temArray = [NSMutableArray arrayWithArray:responseObject[@"show"]];
        
//        NSLog(@"%@",temArray);
        NSMutableArray *arrayM = [YJZPhotoDetailModel objectArrayWithKeyValuesArray:temArray];
        
        self.listArray = arrayM;

        [self setImageViewWithModel:self.listArray];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - ******************** 设置页面的文字和图片
//设置页面imgView
- (void)setImageViewWithModel:(NSMutableArray *)photoSet
{
    NSUInteger count = self.listArray.count;
    
    for (int i = 0; i < count; i++) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(self.view.frame), -64, CGRectGetWidth(self.imageScrollView.frame), CGRectGetHeight(self.imageScrollView.frame))];
        //添加图片

        self.photoDetailModel = self.listArray[i];
        
//        NSLog(@"1111111%@",self.photoDetailModel.img);
        
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.photoDetailModel.img] placeholderImage:[UIImage imageNamed:@"black_photo"]];
        
//        [self setImgWithIndex:i];
        //图片自适应
        self.imageView.contentMode= UIViewContentModeCenter;
        self.imageView.contentMode= UIViewContentModeScaleAspectFit;
        [self.imageScrollView addSubview:_imageView];
        
    }
    
//    [self setImgWithIndex:0];
    
    self.imageScrollView.contentOffset = CGPointZero;
    self.imageScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * count, 0);
    
    self.imageScrollView.pagingEnabled = YES;
}
//
////滚动完毕时调用
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    
//    int index = self.imageScrollView.contentOffset.x / CGRectGetWidth(self.imageScrollView.frame);
//    // 添加文字
//    NSString *countNum = [NSString stringWithFormat:@"%d/%ld",index+1,self.photoSet.photos.count];
//    self.numLabel.text = countNum;
//    // 添加内容
//    [self setContentWithIndex:index];
//}
//

//懒加载添加图片 设置图片
- (void)setImgWithIndex:(int)i
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.photoDetailModel.img] placeholderImage:[UIImage imageNamed:@"black_photo"]];
}

#pragma mark - *************** 页面布局 **************
- (void)addSubView
{
    //导航设置
    //分享与热评View
    self.blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 55)];
    self.blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_blackView];
    
    //分享
    self.shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.shareBtn.frame = CGRectMake(CGRectGetMaxX(self. blackView.frame) - 45, 20, 30, 30);
    [self.shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [self.blackView addSubview:_shareBtn];
    self.shareBtn.tintColor = whiteRGB;
    [self.shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //返回
    self.backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.backBtn.frame = CGRectMake(5, 20, 40, 30);
    [self.backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.blackView addSubview:_backBtn];
    self.backBtn.tintColor = whiteRGB;
    [self.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //滑动背景
    self.imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    self.imageScrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_imageScrollView];
    
    //图片
    self.imageView = [[UIImageView alloc] initWithFrame:self.imageScrollView.bounds];
    self.imageView.backgroundColor = [UIColor blackColor];
    [self.imageScrollView addSubview:_imageView];
    
    //下标 label;
    self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) - 70, CGRectGetMaxY(self.imageScrollView.frame) - 200, 70, 50)];
    self.numLabel.backgroundColor = [UIColor clearColor];
    self.numLabel.textColor = [UIColor whiteColor];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_numLabel];
    
    //text
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageScrollView.frame) - 80, CGRectGetWidth(self.view.frame), -80)];
    [self.textView setEditable:NO];
    self.textView.textColor = [UIColor whiteColor];
    self.textView.font = [UIFont systemFontOfSize:16.0];
    self.textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_textView];
    
    //titleLabel
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textView.frame) + 5, CGRectGetMinY(self.textView.frame) - 30, CGRectGetWidth(self.textView.frame), 30)];
    
    self.titleLabel.font = [UIFont systemFontOfSize:20.0];
    
    self.titleLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:_titleLabel];
    
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

#pragma mark - ************** 手势识别器 **********
//手势识别
- (void)addSwipe
{
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
}
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [self.navigationController setNavigationBarHidden:NO];
        self.tabBarController.tabBar.hidden = NO;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
