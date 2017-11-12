//
//  UIBarButtonItem+Factory.h
//  ZPM
//
//  Created by 陈宇 on 15/3/24.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Factory)
+(instancetype)barButtonWith:(NSString *)text image:(NSString *)img highlightedImage:(NSString *)highlightedImg target:(id)target action:(SEL)action;
@end
