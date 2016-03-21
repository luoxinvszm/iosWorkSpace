//
//  ToDoItem.h
//  ToDoList-OC
//
//  Created by King Luo on 4/17/15.
//  Copyright (c) 2015 King Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
