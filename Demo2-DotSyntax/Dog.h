//
//  Dog.h
//  Demo2-DotSyntax
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
//    int age;
    int _age;
}
//setter and getter functions;
//-(void) setAge:(int)newAge;
//-(int) age;
@property int age;//编译器自动转换成上两行

@end