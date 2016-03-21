//
//  Human.m
//  Demo11-Inheritance
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import "Human.h"

@implementation Human

-(void)work
{
//    a = 6;
//    self.a = 6;
    [self setA:6];//与上句相同
    b = 5;
    d = 3;
    c = 4;
    return;
}

@end
