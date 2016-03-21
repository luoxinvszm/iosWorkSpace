//
//  Person.m
//  Demo1-ClassAndObjec
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//
#import "Person.h"

@implementation Person

//-(void) dealloc {
//    NSLog(@"name %@ release",_name);
//    //析构函数 是在对象完全消失的时候调用
//    //对象销毁时候调用 对象计数器 = 0
//    //这个dealloc不要人为的用用 [xiaozhang dealloc];
//    //应该这样去调用 [xiaozhang release];
//    //release销毁对象 release计数器-1 减到0就自动调用[dealloc]函数
//    [super dealloc];
//}

//只调用一次 类方法在该类第一次实例化时调用
+ (void) initialize {
    NSLog(@"initialize is calling");
}

-(id) init {
       return [self initWithName:@"无名氏"];
}

-(id) initWithName:(NSString *)newName {
//    self = [super init];
//       if (self) {
//        [self setName:newName];
//        [self setAge:-1];
//        NSLog(@"在构造函数中 name %@ age %d %s",_name, _age, __FUNCTION__);
//    }
//    return self;
    return [self initWithName:newName withAge:-1];
}

-(id) initWithName:(NSString *)newName withAge:(int)newAge {
    self = [super init];
    if (self) {
        [self setName:newName];
        [self setAge:newAge];
        NSLog(@"在构造函数中 name %@ age %d %s",_name, _age, __FUNCTION__);
    }
    return self;

}

-(void) setAge:(int)newAge{
    [self setNewAge:newAge];
}
-(int) getAge {
    return _age;
}

-(void) setNewAge:(int)newAge {
    _age = newAge;
}

-(void) setName:(NSString *)newName {
    _name = newName;
}
-(NSString*) getName {
    return _name;
}

-(void) setName:(NSString *)newName withAge:(int)newAge {
    [self setName:newName];
    [self setAge:newAge];
}

+(int) maxAge {
    // self 是一个当前的对象（是在 - 方法里面）
    // 在+方法（静态方法）self表示本类
    NSLog(@"slelf is %@",self);
    return 150;
}

+(id) person {
//    id obj = [[self alloc] init];
    id obj = [[[self class]alloc] init];
    return obj;
}

+(id) personWithName:(NSString *)newName withAge:(int)newAge {
    id obj = [[self alloc] initWithName:newName withAge:newAge];
    return obj;
}
@end