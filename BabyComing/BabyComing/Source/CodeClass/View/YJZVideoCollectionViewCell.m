//
//  YJZVideoCollectionViewCell.m
//  BabyComing
//
//  Created by lanou3g on 15/10/14.
//  Copyright (c) 2015年 YJZ. All rights reserved.
//

#import "YJZVideoCollectionViewCell.h"

@implementation YJZVideoCollectionViewCell

- (UIImageView *)headImage
{
    if (_headImage == nil) {
        
        self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetWidth(self.headImage.frame))];
        
        [self.contentView addSubview:_headImage];
    }
    
    return _headImage;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headImage.frame), CGRectGetWidth(self.contentView.frame), 20)];
        
        self.titleLabel.font = [UIFont systemFontOfSize:18.0];
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UILabel *)replyLabel
{
    if (_replyLabel == nil) {
        
        self.replyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(self.titleLabel.frame), 20)];
        self.replyLabel.font = [UIFont systemFontOfSize:18.0];
        
        [self.contentView addSubview:_replyLabel];
    }
    
    return _replyLabel;
}

@end
