//
//  main.m
//  Demo7-NSNumber
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //对象可以是任意数组的内容,类簇
        NSNumber * intNumber = [[NSNumber alloc] initWithInt:65];
        NSNumber * floatNumber = [[NSNumber alloc] initWithFloat:65.0f];
        NSNumber * doubleNumber = [[NSNumber alloc] initWithDouble:6.7];
        NSNumber * charNumber = [[NSNumber alloc] initWithChar:'A'];
        
        NSNumber * intNumber2 = [NSNumber numberWithInt:5];
        
//        BOOL ret = [intNumber isEqualToNumber:intNumber2];
//        BOOL ret = [intNumber isEqualToNumber:floatNumber];
        BOOL ret = [intNumber isEqualToNumber:charNumber];
        NSLog(@"%d", ret);
        
        if ([intNumber compare:intNumber2] == NSOrderedAscending){
            NSLog(@"小于");
        }else if ([intNumber compare:intNumber2] == NSOrderedSame){
            NSLog(@"等于");
        }else if ([intNumber compare:intNumber2]){
            NSLog(@"大于");
        }
        
        //还原为基本数据类型
        NSLog(@"%d", [intNumber intValue]);
        NSLog(@"%f", [floatNumber floatValue]);
        NSLog(@"%f", [doubleNumber doubleValue]);
        NSLog(@"%c", [charNumber charValue]);
        
    }
    return 0;
}
