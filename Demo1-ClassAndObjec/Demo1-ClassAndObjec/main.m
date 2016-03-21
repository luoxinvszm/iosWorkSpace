//
//  main.m
//  Demo1-ClassAndObjec
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //在Stack里开辟变量空间，在Heap中开辟内存空间存储Person对象，并把变量指向Person对象
        Person *xiaoming = [[Person alloc] init];
     //   xiaoming->_age = 20;
        [xiaoming setAge:20];
//        xiaoming->_name = @"小明";
        [xiaoming setName:@"小明"];
        
        //做一个引用操作 不是独立的赋值
        Person *xiaowang = xiaoming;//为在堆（Heap）里开辟内存空间
        //xiaoming和xiaowang不是2个对象 是两个引用指向同一个对象
        Person *xiaoli = [[Person alloc] init];
//        xiaoli->_age = 50;
//        xiaoli->_name = @"小李飞刀";
//        [xiaoli setAge:50];
//        [xiaoli setName:@"小李飞刀"];
        [xiaoli setName:@"小李飞刀" withAge:50];
        
        Person *xiaozhang = [[Person alloc] initWithName:@"小张"];
        
        Person *xiaozhen = [[Person alloc] initWithName:@"小珍" withAge:100];
        
//        [xiaozhang release];
        //调用maxAge也是需要 xxxx
        int maxAge = [Person maxAge];
        
        Person *xiaoliu = [Person person];//self表示Person类
        [xiaoli setAge:20];//self表示xiaoliu
    }
    return 0;
}
