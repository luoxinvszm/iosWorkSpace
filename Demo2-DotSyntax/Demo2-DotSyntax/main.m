//
//  main.m
//  Demo2-DotSyntax
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 经典方式
        NSLog(@"Hello, World!");
        Dog *dog = [[Dog alloc] init];
        [dog setAge:60];
        int dogAge = [dog age];
        NSLog(@"dog age is %d", dogAge);
        
        //Dot Syntax
        dog.age = 70;
        //[dog setAge:200];
        dogAge = dog.age;
        //dogAge = [dog age];
        NSLog(@"dog new age is %d", dogAge);
    }
    return 0;
}
