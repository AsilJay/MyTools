//
//  UIBarButtonItem+Factory.m
//  ZPM
//
//  Created by 陈宇 on 15/3/24.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import "UIBarButtonItem+Factory.h"

@implementation UIBarButtonItem (Factory)
+(instancetype)barButtonWith:(NSString *)text image:(NSString *)img highlightedImage:(NSString *)highlightedImg target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5.f);
    //btn.size = CGSizeMake(btn.currentImage.size.width + 60.f, 30.f);
    //btn.titleLabel.font = kNavMenuFont;
    if (img) {
        [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    }
    if (highlightedImg) {
        [btn setImage:[UIImage imageNamed:highlightedImg] forState:UIControlStateHighlighted];
    }
    [btn setTitle:text forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
