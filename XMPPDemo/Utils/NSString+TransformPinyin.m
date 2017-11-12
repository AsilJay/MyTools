//
//  NSString+TransformPinyin.m
//  ZPM
//
//  Created by 陈宇 on 15/3/21.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import "NSString+TransformPinyin.h"

@implementation NSString (TransformPinyin)

- (NSString *)transformToPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    return mutableString;
}

@end
