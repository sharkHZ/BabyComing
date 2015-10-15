//
//  YJZVideoModel.h
//  BabyComing
//
//  Created by 袁新峰 on 15/10/15.
//  Copyright © 2015年 YJZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJZVideoModel : NSObject


/**
 "shid": "2326",
 "img": "http://mb-production.oss-cn-hangzhou.aliyuncs.com/show/mengshow2326142199778254c1f6d69dddc.jpg",
 "count": "0",
 "viewcount": "浏览:22694",
 "content": "10个月",
 "type": "2",
 "intro": "2014没白过",
 "media": "http://mb-production.oss-cn-hangzhou.aliyuncs.com/show/mengshow2326142199778254c1f6d6b4cb2.mp4"
 */

@property (nonatomic, assign) NSInteger shid;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *viewcount;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *media;

+ (instancetype)videoModelWithDict:(NSDictionary *)dict;

@end
