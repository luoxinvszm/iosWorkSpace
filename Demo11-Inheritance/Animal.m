//
//  Animal.m
//  Demo11-Inheritance
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(void)setA:(int)newA
{
    a = newA;
    return;
}

-(void)show
{//继承自父类的方法，可以使用父类的私有成员
    NSLog(@"%d", a);
    return;
}
@end
