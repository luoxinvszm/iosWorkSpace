//
//  Dog.m
//  Demo2-DotSyntax
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import "Dog.h"

@implementation Dog

//-(void) setAge:(int)newAge {
//    age = newAge;
//}
//-(int) age {
//    return age;
//}
//@synthesize age;//编译器自动转成上面的setter getter方法
@synthesize age = _age;

@end