//
//  APPHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里存放普通的app宏定义和声明等信息.

#ifndef Project_APPHeader_h
#define Project_APPHeader_h

#import "YJZRootViewController.h"


#import "YJZMainViewController.h"
#import "YJZHealthTableViewController.h"
#import "YJZSetTableViewController.h"



///三张图片的 cell 中 大图的的宽度
#define imageWidth (CGRectGetWidth(self.contentView.frame) - 30) / 2

//自定义 详细页面导航RGB

#define  whiteSmokeRGB [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1]
// 自定义导航 按钮 颜色   冷灰  RGB: 128 138 135
#define grayRGB [UIColor colorWithRed:128/255.0 green:138/255.0 blue:135/255.0 alpha:1]

//自定义导航 按钮 颜色   白色  RGB: 255 255 255
#define whiteRGB [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
//主导航的颜色 品蓝 RGB: 65 105 225
#define buleRGB [UIColor colorWithRed:65/255.0 green:105/255.0 blue:225/255.0 alpha:0.8]

#define kBaseTag 1000

// 这个是主体色   #4c7ef7  品蓝












































//TODO 提示
#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用下面的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


#endif
