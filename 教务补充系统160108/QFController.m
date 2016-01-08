//
//  QFController.m
//  01教务补充系统
//
//  Created by qianfeng on 15/12/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFController.h"
#import "QFBussiness.h"

@implementation QFController

-(QFController*)init
{
    if (self=[super init]) {
        self->_bussiness = [[QFBussiness alloc]init];
    }
    return self;
}



//添加班级；
-(void)addClass:(QFClass*)newClass
{
    
    [self->_bussiness addClass:newClass];
}

//添加学生
-(void)addStudent:(QFStudent*)newStudent
{
    [self->_bussiness addStudent:newStudent];
}

//添加老师
-(void)addTeacher:(QFTeacher*)newTeacher
{
    [self->_bussiness addTeacher:newTeacher];
}


//上班打卡（添加考勤；）
-(void)workerStartRecords:(QFRecords*)newRecord
{
    [self->_bussiness workerStartRecords:newRecord];
}


//下班打卡（）
//newRecord对象包含的信息：学号，日期，下班打卡时间；
-(void)workerEndRecords:(QFRecords*)newRecord
{
    [self->_bussiness workerEndRecords:newRecord];
}

//考勤查询根据学生学号和时间段；
//  iOS1501   2015-12-01  到  2015- 12-31的考勤
-(NSArray*)searchUsingStuNo:(NSString*)stuNo andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
{
   return [self->_bussiness searchUsingStuNo:stuNo andStartTime:startTime andEndTime:endTime];
}


//考勤查询（根据班级和时间段）
-(NSArray*)searchUsingClass:(NSString*)classNo  andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
{
    return [self->_bussiness searchUsingClass:classNo andStartTime:startTime andEndTime:endTime ];
}

//考勤统计，统计某个学生的出勤情况(根据学生姓名和时间段)//月度
// iOS150501   2015-12-01  到 2015-12-31
//统计结果示例：

//    iOS150501  田广 应出勤次数 实际出勤次数 迟到几次

//早退几次，请假次数 旷课次数；
-(NSString*)totalUsingStuNo:(NSString*)stuNo andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
{
    return [self->_bussiness totalUsingStuNo:stuNo andStartTime:startTime andEndTime:endTime];
}

////考勤统计，统计的是某个班级每个学生的出勤情况(根据学生姓名和时间段)//月
//-(NSArray*)totalUsingClass:(NSString*)classNo  andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
//{
//
//
//}



//考勤统计（根据班级和时间段）
-(NSArray*)totalUsingClass:(NSString*)classNo  andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
{
    
    return [self->_bussiness totalUsingClass:classNo andStartTime:startTime andEndTime:endTime];
}

@end
