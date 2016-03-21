//
//  main.m
//  Demo8-NSSet
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //集合中的元素没有顺序，每个元素只能有一个
        NSSet * set = [[NSSet alloc] initWithObjects:@"One", @"Two", @"Three",@"Three",  @"Four", nil];
        
        
        NSLog(@"%@", set);
        
        NSLog(@"%lu", [set count]);//获取元素个数
        
//        BOOL ret = [set containsObject:@"Two"];
        BOOL ret = [set containsObject:@"Five"];
        
        NSLog(@"%d", ret);
        
        NSSet * set2 = [[NSSet alloc] initWithObjects:@"One", @"Three", @"Two", @"Four", @"Five", nil];
        
        BOOL ret2 = [set isEqualToSet:set2];
        NSLog(@"%d", ret2);
        
        BOOL ret3 = [set isSubsetOfSet:set2];
        NSLog(@"%d", ret3);
        
        //枚举器法遍历
        NSEnumerator * enumerator = [set objectEnumerator];
        NSString * str;
        while (str = [enumerator nextObject]) {
            NSLog(@"%@", str);
        }
        
        //通过组数创建集合
        NSArray * array = [[NSArray alloc] initWithObjects:@"One", @"TWo", @"Three", @"Four", nil];
        
        NSSet * set3 = [[NSSet alloc] initWithArray:array];
        
        NSLog(@"%@", set3);
        
        //通过集合生成数组
        NSArray * array2 = [set allObjects];
        NSLog(@"%@", array2);
        
        //可变集合
        NSMutableSet * set4 = [[NSMutableSet alloc] init];
        [set4 addObject:@"One"];
        [set4 addObject:@"Two"];
        [set4 addObject:@"Three"];
        [set4 addObject:@"Two"];
        
        NSLog(@"%@", set4);
        
        [set4 removeObject:@"Three"];
        NSLog(@"%@", set4);
        
        NSSet * set5 = [[NSSet alloc] initWithObjects:@"Five", @"Six", @"Three", nil];
        
        [set4 unionSet:set5];
        
        NSLog(@"set4 %@", set4);
        
        [set4 minusSet:set5];
        
        NSLog(@"after set4 %@",set4);
        
        
        //NSIndexSet索引集合，与NSSet没有继承关系，是NSSet的一个变种
        NSIndexSet * indexSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(2, 3)];//集合中的数字是2，3，4
        
        NSArray * arr = [[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", @"Six", nil];
        NSArray * newArr = [arr objectsAtIndexes:indexSet];
        NSLog(@"newArr is %@", newArr);
        
        NSMutableIndexSet * mIndexSet = [[NSMutableIndexSet alloc] init];
        [mIndexSet addIndex:0];
        [mIndexSet addIndex:3];
        [mIndexSet addIndex:5];
        
        NSArray * newArr2 = [arr objectsAtIndexes:mIndexSet];
        NSLog(@"newArr2 is %@",newArr2);
        
        
    }
    return 0;
}
