//
//  YJZVideoCollectionViewController.m
//  BabyComing
//
//  Created by lanou3g on 15/10/14.
//  Copyright (c) 2015年 YJZ. All rights reserved.
//

#import "YJZVideoCollectionViewController.h"
#import "YJZVideoCollectionViewCell.h"

#import "YJZVideoModel.h"

#import "YJZVideoDetailViewController.h"
@interface YJZVideoCollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *listArray;

@property (nonatomic, strong) YJZVideoModel *videoModel;

@property (nonatomic, assign) BOOL update;

@property (nonatomic, assign) NSInteger page;

@end

@implementation YJZVideoCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 2;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    [self.collectionView registerClass:[YJZVideoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.update = YES;
    //数据请求  刷新
    
    [self.collectionView addHeaderWithTarget:self action:@selector(loadData)];
    
    [self.collectionView addFooterWithTarget:self action:@selector(loadMoreData)];
    
}

#pragma mark - **************** 数据刷新 *******************

- (void)viewWillAppear:(BOOL)animated
{
    if (self.update == YES) {
        [self.collectionView headerBeginRefreshing];
        self.update = NO;
    }
    [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"contentStart" object:nil]];
    
}

//下拉

- (void)loadData
{
    
    NSString *allString = [NSString stringWithFormat:@"http://android.mengbaby.com/mengmedia/list?said=9&sort=3&lng=116.344263&mac=f4%%3A8b%%3A32%%3A0b%%3A8f%%3Aa3&udid=867299021525431&lang=zh&v=3.0.0&urid=3079529&page=1&token=ML3KQe43SxWVbTSrUCmmLUjUu8PcviHYFxoR0dVd3Pw&connectnet=wifi&device=gucci&account=867299021525431&pushid=d//igwEhgBGCI2TG6lWqlDnQtmJT4rXqQP/rKi6+v/5h38BGUgjYLV39nJe0ssFUsv7c6lHO/keDzSk/q9qErDQYlEUah2umQNwP2pRNyjI=&lat=40.0309&dosv=19&ctid=1001&dist=8"];
    
    [self loadDataForType:1 withURL:allString];
    
}

//上拉
- (void)loadMoreData
{
    
    if (_page < 11) {
        NSString *allString = [NSString stringWithFormat:@"http://android.mengbaby.com/mengmedia/list?said=9&sort=3&lng=116.344263&mac=f4%%3A8b%%3A32%%3A0b%%3A8f%%3Aa3&udid=867299021525431&lang=zh&v=3.0.0&urid=3079529&page=%ld&token=ML3KQe43SxWVbTSrUCmmLUjUu8PcviHYFxoR0dVd3Pw&connectnet=wifi&device=gucci&account=867299021525431&pushid=d//igwEhgBGCI2TG6lWqlDnQtmJT4rXqQP/rKi6+v/5h38BGUgjYLV39nJe0ssFUsv7c6lHO/keDzSk/q9qErDQYlEUah2umQNwP2pRNyjI=&lat=40.0309&dosv=19&ctid=1001&dist=8",_page];
        
        
        [self loadDataForType:2 withURL:allString];
        
        
        
    }else
    {
        NSLog(@"没有跟多的数据了!");
        [self.collectionView footerEndRefreshing];
        
    }
    _page ++;
    
}

//公共请求数据

- (void)loadDataForType:(int)type withURL:(NSString *)allUrlstring
{
    [[YJZNetWorkTools sharedNetworkTools] GET:allUrlstring parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSLog(@"%@",allUrlstring);
        
        NSMutableArray *temArray = [NSMutableArray arrayWithArray:responseObject[@"list"]];
        
        NSMutableArray *arrayM = [YJZVideoModel objectArrayWithKeyValuesArray:temArray];
        
        if (type == 1) {
            
            self.listArray = arrayM;
            [self.collectionView headerEndRefreshing];
            
            [self.collectionView reloadData];
            
        }else if(type == 2){
            
            [self.listArray addObjectsFromArray:arrayM];
            [self.collectionView footerEndRefreshing];
            
            [self.collectionView reloadData];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.frame) / 2 - 30, CGRectGetHeight(self.view.frame) / 3 );
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(25, 20, 15, 20);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return self.listArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YJZVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    self.videoModel = self.listArray[indexPath.item];
    NSLog(@"%@",self.videoModel.media);
    [cell.headImage sd_setImageWithURL:[NSURL URLWithString:self.videoModel.img]];
    
    cell.titleLabel.text = self.videoModel.intro;
    
    cell.replyLabel.text = self.videoModel.viewcount;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YJZVideoDetailViewController *videoDetailVC = [[YJZVideoDetailViewController alloc] init];
    
    videoDetailVC.videoModel = self.listArray[indexPath.item];
    
    [self.navigationController pushViewController:videoDetailVC animated:YES];
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
