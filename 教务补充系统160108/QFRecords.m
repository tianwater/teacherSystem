//
//  QFRecords.m
//  02教务补充系统
//
//  Created by qianfeng on 15/12/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFRecords.h"

@implementation QFRecords
-(QFRecords*)initWithStuNo:(NSString*)stuNo andDate:(NSDate*)date andStartDate:(NSDate*)startDate
{
    if (self=[super init]) {
        self->_stuNo= stuNo;
        self->_date= date;
        self->_startDate= startDate;
    }
    return self;
}


@end
