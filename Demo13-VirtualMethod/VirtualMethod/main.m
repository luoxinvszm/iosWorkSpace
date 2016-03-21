//
//  main.m
//  VirtualMethod
//
//  Created by King Luo on 10/31/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Father.h"
#import "Son.h"
#import "Cat.h"
#import "Dog.h"
#import "Frog.h"
#import "Human.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Son * son = [[Son alloc] init];
        Father * p = son;
        
        //调用方法时不看指针，看对象
        //对象的地址调用对象的方法
        [p jump];
        
        Frog * frog = [[Frog alloc] init];
        Cat * cat = [[Cat alloc] init];
        Dog * dog = [[Dog alloc] init];
        Human * xiaoming = [[Human alloc] init];
        
        [xiaoming beatAnimal:frog];
        [xiaoming beatAnimal:cat];
        [xiaoming beatAnimal:dog];
        
        
        
    }
    return 0;
}
