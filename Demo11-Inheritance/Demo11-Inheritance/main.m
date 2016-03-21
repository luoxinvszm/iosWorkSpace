//
//  main.m
//  Demo11-Inheritance
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Human.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //当创建Human对象时，它前面是一个完整的Animal对象，因此是有私有变量a的空间的
        Human * laowang = [[Human alloc] init];
        
        [laowang setA:7];
        
        [laowang show];
        
        [laowang work];
        
        [laowang show];
    }
    return 0;
}
