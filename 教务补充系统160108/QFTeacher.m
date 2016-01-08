//
//  QFTeacher.m
//  02教务补充系统
//
//  Created by qianfeng on 15/12/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFTeacher.h"

@implementation QFTeacher

-(QFTeacher*)initWithTeacherNo:(NSString*)teacherNo andTeacherName:(NSString*)teacherName andTeacherPass:(NSString*)teacherPass
{
    if (self=[super init]) {
        self->_teacherNo= teacherNo;
        self->_teacherName= teacherName;
        self->_teacherPass= teacherPass;
    }
    return self;
}


@end
