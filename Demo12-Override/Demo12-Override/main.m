//
//  main.m
//  Demo12-Override
//
//  Created by King Luo on 10/31/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parent.h"
#import "Child.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Parent * parent = [[Parent alloc] init];
        Child * child = [[Child alloc] init];
        
        [parent jump];
        [parent run];
        
        [child jump];
        [child run];
    }
    return 0;
}
