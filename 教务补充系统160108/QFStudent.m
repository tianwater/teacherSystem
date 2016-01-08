//
//  QFStudent.m
//  02教务补充系统
//
//  Created by qianfeng on 15/12/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFStudent.h"

@implementation QFStudent


-(QFStudent*)initWithClassNo:(NSString*)classNo andStuNo:(NSString*)stuNo andStuName:(NSString*)stuName
{
    if (self=[super init]) {
        self->_classNo = classNo;
        self->_stuName = stuName;
        self->_stuNo = stuNo;
    }
    return self;
}


@end
