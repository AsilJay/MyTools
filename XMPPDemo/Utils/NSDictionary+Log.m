//
//  NSDictionary+Log.m
//  ZPM
//
//  Created by 陈宇 on 15/3/24.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *result = [NSMutableString stringWithFormat:@"length:%@\n(\n", @(self.count)];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [result appendFormat:@"\t%@: %@,\n", [key description], [obj description]];
    }];
    [result deleteCharactersInRange:NSMakeRange(result.length - 2, 1)];
    [result appendString:@")"];
    return result;
}
@end
