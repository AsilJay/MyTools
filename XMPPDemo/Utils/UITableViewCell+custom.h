//
//  UITableViewCell+custom.h
//  XSGJ
//
//  Created by Colin on 14-5-30.
//  Copyright (c) 2014年 flagsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (custom)

/**
 *  设置背景
 *
 *  @param bgImgName       普通状态下的背景
 *  @param selectedImgName 选择状态下的背景
 */
- (void)checkBgView:(NSString *)bgImgName selectedView:(NSString *)selectedImgName;

@end
