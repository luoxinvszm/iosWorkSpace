//
//  main.m
//  Demo4-NSString
//
//  Created by King Luo on 10/28/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSString字符串
        NSLog(@"Hello, World!");
        
        NSString * str1 = @"Hello World";
        
        NSString * str2 = [[NSString alloc] initWithString:str1];
        
        //使用C的字符串创建OC的字符串对象
        NSString * str3 = [[NSString alloc] initWithUTF8String:"hello world"];
        
        //使用个格式符，拼接一个字符串
        NSString * str4 = [[NSString alloc] initWithFormat:@"hello %d %c",5 ,'A'];
        
        //三种临时字符串，自动释放内存的对象
        NSString * str5 = [NSString stringWithUTF8String:"hello world"];
        NSString * str6 = [NSString stringWithFormat:@"%d %@ %c",11, @"hello", 'R'];
        NSString * str7 = [NSString stringWithString:str1];
        
        NSLog(@"%@",str1);
        NSLog(@"%@",str2);
        NSLog(@"%@",str3);
        NSLog(@"%@",str4);
        NSLog(@"%@",str5);
        NSLog(@"%@",str6);
        NSLog(@"%@",str7);
        
        NSString * s1 = @"hello world";
        NSString * s2 = @"hello world";
        BOOL ret = [s1 isEqualToString:s2];
        NSLog(@"%d", ret);
        
        NSString * s3 = @"45";
        NSString * s4 = @"44";
        NSComparisonResult result = [s3 compare:s4];
        if(result == NSOrderedAscending) {
            NSLog(@"s3 < s4");
        }else if (result == NSOrderedSame){
            NSLog(@"s3 = s4");
        }else if (result == NSOrderedDescending){
            NSLog(@"s3 > s4");
        }
        
        NSString * s5 = @"I am a so bad man!";
        NSString * subStr = @"so";
        
        NSRange range = [s5 rangeOfString:subStr];
        NSLog(@"location:%lu length:%lu", range.location, range.length);
        
        NSString * s6 = @"0123456789";
        //从s6中提取从头至第6个字符串（不包括第6个，生成新字符串。返回字符串地址。开区间
        NSString * s7 = [s6 substringToIndex:6];
        NSLog(@"%@",s6);
        NSLog(@"%@",s7);
        
        //从s6中提取第6个字符（包括第6个），到最后一个字符，生成新字符串，返回字符串地址。闭区间
        NSString * s8 = [s6 substringFromIndex:6];
        NSLog(@"%@",s8);
        
        //从s6中提取从第3个字符提取长度为4的字符串
        NSRange ra = {3, 4};
        NSString * s9 = [s6 substringWithRange:ra];
        NSLog(@"%@",s9);
        
        //可变字符串NSMutableString
        
//        NSMutableString * ms = @"hello";//不能这样创建可变字符串
        
        NSMutableString * ms = [[NSMutableString alloc] init];
        [ms setString:@"hello"];
        [ms setString:@"world"];//会发生替换
        NSLog(@"%@",ms);
        
        //可变字符串的增：1）追加append 2）插入insert
        [ms appendString:@"123"];
        NSLog(@"%@",ms);
        [ms appendFormat:@"%c", 'D'];
        NSLog(@"%@",ms);
        [ms insertString:@"XXXX" atIndex:4];
        NSLog(@"%@",ms);
        [ms insertString:[NSString stringWithFormat:@"%d",-54] atIndex:7];
        NSLog(@"%@",ms);
        
        //可变字符串的删delete
        [ms deleteCharactersInRange:NSMakeRange(3, 5)];
        NSLog(@"%@",ms);
        
        //可变字符串的改replace
        [ms replaceCharactersInRange:NSMakeRange(3, 2) withString:@"RRRRRRRRRRRRRRRRRR"];
        NSLog(@"%@",ms);

    }
    return 0;
}
