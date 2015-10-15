//
//  YJZPhotoDetailModel.h
//  BabyComing
//
//  Created by 袁新峰 on 15/10/15.
//  Copyright © 2015年 YJZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJZPhotoDetailModel : NSObject

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *title;

+ (instancetype)photoDetailModelWithDict:(NSDictionary *)dict;

@end
