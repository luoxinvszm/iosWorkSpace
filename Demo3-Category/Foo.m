//
//  Foo.m
//  Demo3-Category
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import "Foo.h"

@interface Foo (Private)
- (void) test2;
@end

@implementation Foo
- (void) test {
    [self test2];
}
- (void) test2{
    NSLog(@"test2 is calling");
}
@end
