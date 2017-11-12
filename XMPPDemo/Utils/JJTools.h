//
//  JJTools.h
//  XMPPDemo
//
//  Created by 邵佳杰 on 2017/11/10.
//  Copyright © 2017年 邵佳杰. All rights reserved.
//

#ifndef JJTools_h
#define JJTools_h

// define

//#define ServerType  0
#if ServerType == 0
#define kServerPath @"path0"
#else
#define kServerPath @"path1"
#endif

#define BMColor(r,g,b)     [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define kRGB(r,g,b,a)     [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)/1.f]
#define BMRandomColor      BMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define kSystemVersion [[[UIDevice currentDevice] systemVersion] integerValue]
//window
#define kWindow            [UIApplication sharedApplication].keyWindow


#define weakSelf(self)  __weak typeof(self)weakSelf = self

//window
#define kWindow            [UIApplication sharedApplication].keyWindow

//屏幕宽高
#define kScreenHeight MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define kScreenWidth MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define kScreenScale    (kScreenWidth/375.0)


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_4S ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480.f ) < DBL_EPSILON )

#define SCREEN_WIDTH kScreenWidth
#define SCREEN_HEIGHT kScreenHeight


// import
#import "BMHttpTool.h"
#import "Singleton.h"
#import "BMMainTool.h"
#import "NSArray+Log.h"
#import "NSDictionary+Log.h"
#import "NSString+TransformPinyin.h"
#import "UIBarButtonItem+Factory.h"
#import "UILabel+Addition.h"
#import "UITableViewCell+custom.h"
#import "UIView+Extensions.h"
#import "UIColor+HEXColor.h"
#import "NSString+BM.h"
#import "UIViewController+BM.h"


#endif /* JJTools_h */
