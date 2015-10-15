//
//  YJZphotoModel.h
//  BabyComing
//
//  Created by 袁新峰 on 15/10/15.
//  Copyright © 2015年 YJZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJZphotoModel : NSObject

@property (nonatomic, copy) NSString * count;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *sgid;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger pages;

+ (instancetype)photoModelWithDict:(NSDictionary *)dict;

@end
