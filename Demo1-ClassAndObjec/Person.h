//
//  Person.h
//  Demo1-ClassAndObjec
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface Person : NSObject{
@private
    //字段 成员变量
    int _age;
    NSString *_name;
}
//构造函数 各种变种
-(id) init;
-(id) initWithName:(NSString *)newName;
-(id) initWithName:(NSString *)newName withAge:(int)newAge;

//加号的方法 静态方法
//这个函数是类 的第一次实例化时调用
+ (void)initialize;

//向外面暴露的成员变量方法
//setAge:和getAge:这2个方法是我们对_age字段提供的两个封装
-(void) setAge:(int)newAge;
-(int) getAge;

-(void) setNewAge:(int)newAge;

-(void) setName:(NSString *)newName;
-(NSString*) getName;
-(void) setName:(NSString *)newName withAge:(int)newAge;

+(int) maxAge;
+(id) person;
+(id) personWithName:(NSString *)newName withAge:(int)newAge;
@end

