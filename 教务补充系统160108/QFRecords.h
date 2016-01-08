//
//  QFRecords.h
//  02教务补充系统
//
//  Created by qianfeng on 15/12/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

//属性：学生编号，日期，上班打卡时间，下班打卡时间，考勤状态（1、正常，2、迟到，3、早退，4、旷课，5、请假）。总结。

@interface QFRecords : NSObject

@property NSString *classNo;
@property NSString *stuNo;
@property NSDate *date;
@property NSDate *startDate;
@property NSDate *endDate;
@property NSString *recordsState;
//@property NSString *recordsState;
//四位字符串：每一位代表一种状态，从第一位到第四位分别表示：迟到，早退，旷课，请假；如：1000：表示迟到；0000：表示正常；
@property NSString *summary;//总结

-(QFRecords*)initWithStuNo:(NSString*)stuNo andDate:(NSDate*)date andStartDate:(NSDate*)startDate;

@end
