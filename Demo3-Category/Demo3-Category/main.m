//
//  main.m
//  Demo3-Category
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+ReverseString.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"Objective-c开发";
        NSString *retString = [string reverseString];
        NSLog(@"ret string is %@",retString);
    }
    return 0;
}
