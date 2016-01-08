//
//  QFTeacher.h
//  02教务补充系统
//
//  Created by qianfeng on 15/12/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

//
@interface QFTeacher : NSObject

@property    NSString *teacherNo;
@property    NSString *teacherName;
@property    NSString *teacherPass;

-(QFTeacher*)initWithTeacherNo:(NSString*)teacherNo andTeacherName:(NSString*)teacherName andTeacherPass:(NSString*)teacherPass ;

@end
