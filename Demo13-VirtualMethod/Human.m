//
//  Human.m
//  VirtualMethod
//
//  Created by King Luo on 10/31/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

#import "Human.h"

@implementation Human

-(void)beatAnimal:(Animal *)animal
{
    NSLog(@"Human beat the %@",[animal class]);
    [animal beBeaten];
    return;
}

@end
