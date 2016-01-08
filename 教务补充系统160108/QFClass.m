//
//  QFClass.m
//  02教务补充系统
//
//  Created by qianfeng on 15/12/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFClass.h"

@implementation QFClass

-(QFClass*)initWithClassNo:(NSString*)classNo andClassRoom:(NSString*)classRoom andNum:(int)num
{
    if (self=[super init]) {
        self->_classNo = classNo;
        self->_classRoom = classRoom;
        self->_num = num;
    }
    return self;
}



@end
