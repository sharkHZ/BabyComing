//
//  YJZphotoModel.m
//  BabyComing
//
//  Created by 袁新峰 on 15/10/15.
//  Copyright © 2015年 YJZ. All rights reserved.
//

#import "YJZphotoModel.h"

@implementation YJZphotoModel

+ (instancetype)photoModelWithDict:(NSDictionary *)dict
{
    YJZphotoModel *model = [[self alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
