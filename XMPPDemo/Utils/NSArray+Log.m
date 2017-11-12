//
//  NSArray+Log.m
//  ZPM
//
//  Created by 陈宇 on 15/3/24.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *result = [NSMutableString stringWithFormat:@"length:%@\n(\n", @(self.count)];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result appendFormat:@"\t%@,\n", [obj description]];
    }];
    [result deleteCharactersInRange:NSMakeRange(result.length - 2, 1)];
    [result appendString:@")"];
    return result;
}
@end
