//
//  UITableViewCell+custom.m
//  XSGJ
//
//  Created by Colin on 14-5-30.
//  Copyright (c) 2014年 flagsky. All rights reserved.
//

#import "UITableViewCell+custom.h"

@implementation UITableViewCell (custom)

- (void)checkBgView:(NSString *)bgImgName selectedView:(NSString *)selectedImgName
{
    self.backgroundColor = [UIColor clearColor];
    UIImage *bgImg = [UIImage imageNamed:bgImgName];
    self.backgroundView = [[UIImageView alloc] initWithImage:[bgImg stretchableImageWithLeftCapWidth:bgImg.size.width/2 topCapHeight:bgImg.size.height/2]];
    if (selectedImgName&&![selectedImgName isEqualToString:@""])
    {
        UIImage *selectedImg = [UIImage imageNamed:selectedImgName];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[selectedImg stretchableImageWithLeftCapWidth:selectedImg.size.width/2 topCapHeight:selectedImg.size.height/2]];
    }
}

@end
