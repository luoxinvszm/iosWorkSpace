//
//  main.m
//  Demo10-NSData
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSString * str = @"hello world";
        //将字符串转换为NSData对象（以UTF8编码）
        NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
        
        NSLog(@"%s", data.bytes);
        
        NSString * newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",newStr);
    }
    return 0;
}
