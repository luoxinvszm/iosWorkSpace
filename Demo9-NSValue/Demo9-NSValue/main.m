//
//  main.m
//  Demo9-NSValue
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

//既创建了结构体sct，同时也声明了全局的结构体变量sctt,并初始化
struct sct{
    int a;
    int b;
}sctt = {4,5};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSValue * value = [[NSValue alloc] initWithBytes:&sctt objCType:@encode(struct sct)];//结构体数据的地址:即将要存储的数据类型转化成c的字符串
        
        NSLog(@"%s", @encode(int));//@encode();把数据类型转换为某个字符串,每一个类型生成的字符串是唯一的
        NSLog(@"%s", @encode(float));
        NSLog(@"%s", @encode(long));
        NSLog(@"%s", @encode(struct sct));
        
        if (strcmp(value.objCType, @encode(struct sct)) == 0){
            NSLog(@"it is struct sct");
        }
        
        struct sct newSctt;
        [value getValue:&newSctt];
        NSLog(@"%d %d",newSctt.a, newSctt.b);
        
        char * p = (char *)0x1f;
        NSValue * value2 = [[NSValue alloc] initWithBytes:&p objCType:@encode(char *)];
        [value2 getValue:&p];
        NSLog(@"%p", p);
        
        CGPoint point;
        CGSize size;
        CGRect rect;
        
        NSValue * pointValue = [NSValue valueWithPoint:point];
        NSValue * sizeValue = [NSValue valueWithSize:size];
        NSValue * rectValue = [NSValue  valueWithRect:rect];
        NSValue * rangeValue = [NSValue valueWithRange:NSMakeRange(3, 4)];
    }
    return 0;
}
