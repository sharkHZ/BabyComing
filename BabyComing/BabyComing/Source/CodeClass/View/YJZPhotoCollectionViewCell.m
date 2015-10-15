//
//  YJZPhotoCollectionViewCell.m
//  BabyComing
//
//  Created by lanou3g on 15/10/14.
//  Copyright (c) 2015年 YJZ. All rights reserved.
//

#import "YJZPhotoCollectionViewCell.h"

@implementation YJZPhotoCollectionViewCell

- (UIImageView *)headImage
{
    if (_headImage == nil) {
        
        self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetWidth(self.headImage.frame))];
        
        [self.contentView addSubview:_headImage];
    }
    
    return _headImage;
}

- (UIImageView *)heartImage
{
    if (_heartImage == nil) {
        
        self.heartImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.headImage.frame), 20, 20)];
        
        [self.contentView addSubview:_heartImage];
    }
    
    return _heartImage;
}

- (UILabel *)countLabel
{
    if (_countLabel == nil) {
        
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.heartImage.frame) + 5, CGRectGetMinY(self.heartImage.frame), CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.heartImage.frame) - 30, CGRectGetHeight(self.heartImage.frame))];
        
        [self.contentView addSubview:_countLabel];
    }
    
    return _countLabel;
}

@end
