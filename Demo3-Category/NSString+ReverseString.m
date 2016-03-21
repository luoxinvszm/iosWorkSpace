//
//  NSString+ReverseString.m
//  Demo3-Category
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import "NSString+ReverseString.h"

@implementation NSString (ReverseString)
- (id) reverseString
{
    NSUInteger len = [self length];//self 表示字符串本身
    
    NSMutableString *retStr = [NSMutableString stringWithCapacity:len];
    while (len > 0) {
        //从后取一个字符 unicode
        unichar c = [self characterAtIndex:--len];
        NSLog(@" c is %C",c);
        NSString *s = [NSString stringWithFormat:@"%C",c];
        [retStr appendString:s];
    }
    return retStr;
}
@end
