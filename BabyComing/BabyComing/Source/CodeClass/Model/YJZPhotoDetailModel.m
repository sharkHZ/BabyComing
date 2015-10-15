//
//  YJZPhotoDetailModel.m
//  BabyComing
//
//  Created by 袁新峰 on 15/10/15.
//  Copyright © 2015年 YJZ. All rights reserved.
//

#import "YJZPhotoDetailModel.h"

@implementation YJZPhotoDetailModel

+ (instancetype)photoDetailModelWithDict:(NSDictionary *)dict
{
    YJZPhotoDetailModel *model = [[self alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
