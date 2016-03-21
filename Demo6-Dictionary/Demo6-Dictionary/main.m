//
//  main.m
//  Demo6-Dictionary
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //字典中的元素是以键值对的形式存储的
        NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"One", @"1" ,@"Two" ,@"2" ,@"Three" ,@"3" , nil];
        //@"One" 和 @"1"组成了一个键值对
        //@"One"称为值（value），@"1"称为键（key）
        //键值对的值和键，可以是任意的对象，但是键往往使用字符串
        //字典存储对象的地址没有顺序，数组存储对象的地址有顺序
        //存储顺序对字典无意义
        NSLog(@"%@", dict);
        
        //枚举法遍历
//        NSEnumerator * enumerator = [dict keyEnumerator];//键遍历
        NSEnumerator * enumerator = [dict objectEnumerator];//值遍历
        id obj;
        while (obj =  [enumerator nextObject]) {
            NSLog(@"%@", obj);
        }
        
        //快速枚举法
        for ( id obj in dict) {
            NSString * str = [dict  objectForKey:obj];//通过键找到值
            NSLog(@"%@ : %@", obj, str);
        }
        
        NSMutableDictionary * mDict = [[NSMutableDictionary alloc] init];
        
        [mDict setObject:@"One" forKey:@"1"];
        [mDict setObject:@"Two" forKey:@"2"];
        [mDict setObject:@"Three" forKey:@"3"];
        
        NSLog(@"%@", mDict);
        
        [mDict removeObjectForKey:@"1"];
        
        NSLog(@"%@", mDict);
        
    }
    return 0;
}
