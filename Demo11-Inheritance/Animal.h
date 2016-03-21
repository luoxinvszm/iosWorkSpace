//
//  Animal.h
//  Demo11-Inheritance
//
//  Created by King Luo on 10/30/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
@private //私有成员，不能被外部函数访问(使用)，也不能被子类继承
    int a;
@protected//保护成员，不能被外部函数访问，可以被子类继承
    int b;
@public//公有成员可以被外部函数访问，可以被继承
    int d;
}
//OC中，所有的成员方法（消息），都是公有的

-(void)setA:(int)newA;

-(void)show;

@end
