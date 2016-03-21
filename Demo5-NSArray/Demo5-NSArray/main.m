//
//  main.m
//  Demo5-NSArray
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"不可变数组!");
        
        Dog * dog = [[Dog alloc] init];
        
        NSArray * array = [[NSArray alloc] initWithObjects:@"One", @"Two", @"Three",dog, nil];
        //数组的元素可以是任意的对象
        //数组中装有元素的地址
        
        //打印数组就是打印数组的每个元素
        NSLog(@"%@", array);
        NSLog(@"%@", dog);
        
        //枚举器发遍历，不可修改元素顺序和个数
        NSEnumerator * enumerator = [array objectEnumerator];
        id obj;
        while (obj = [enumerator nextObject]) {
            NSLog(@"%@", obj);
        }
        
        //快速枚举法，不可修改元素顺序和个数
        for (id obj in array) {
            NSLog(@"%@", obj);
        }
        
        //使用i值遍历，可以修改元素顺序和个数
//        NSUInteger length = [array count];
        obj = [array objectAtIndex:2];
        
        NSInteger i;
        for (i = 0; i < [array count]; i++) {
            NSLog(@"%@", [array objectAtIndex:i]);
        }
        
        NSLog(@"可变数组！");
        NSMutableArray * array1 = [[NSMutableArray alloc] init];
        //添加元素
        [array1 addObject:@"one"];
        [array1 addObject:@"two"];
        [array1 addObject:@"three"];
        
        //删除元素
//        [array1 removeObject:@"one"];
//        [array1 removeObjectAtIndex:1];
        
        //交换位置
        [array1 exchangeObjectAtIndex:0 withObjectAtIndex:2];
        
        NSLog(@"%@", array1);
        
        NSMutableArray * array2 = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", nil];
        NSEnumerator * e1 = [array2 objectEnumerator];
        NSString * str;
        while (str == [e1 nextObject]) {
            [array2 removeLastObject];
        }
        
        NSString * s = @"I am a so bad man";
        NSArray * a = [s componentsSeparatedByString:@" "];
        NSMutableArray * mutableArray = [[NSMutableArray alloc] init];
        
        NSEnumerator * en = [a reverseObjectEnumerator];
        NSString * tmp;
        while (tmp = [en nextObject])  {
            [mutableArray addObject:tmp];
        }
        
        NSString * newStr = [mutableArray componentsJoinedByString:@" "];
        NSLog(@"%@", newStr);
    }
    return 0;
}
