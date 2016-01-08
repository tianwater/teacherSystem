//
//  QFBussiness.h
//  01教务补充系统
//
//  Created by qianfeng on 15/12/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QFClass;
@class QFStudent;
@class QFTeacher;
@class QFRecords;
@class QFBussiness;

@interface QFBussiness : NSObject
{
    NSMutableDictionary *classDict;//键：班级编号
    NSMutableDictionary *stuDict; //键：学生编号
    NSMutableDictionary *teacherDict;//键：老师的工号
    NSMutableDictionary *recordesDict;//键：学生编号和日期连接起来的字符串；格式：“学生编号,日期”；如：iOS150501,20151224；
    //    NSMutableDictionary *recordPhotoDict;
}

-(QFBussiness*)initWithClassDict:(NSMutableDictionary*)classDict andStuDict:(NSMutableDictionary*)stuDict andTeacherDict:(NSMutableDictionary*)teacherDict andRecordesDict:(NSMutableDictionary*)recordesDict;


//添加班级；
-(void)addClass:(QFClass*)newClass;

//添加学生
-(void)addStudent:(QFStudent*)newStudent;

//添加老师
-(void)addTeacher:(QFTeacher*)newTeacher;

//上班打卡（添加考勤；）
-(void)workerStartRecords:(QFRecords*)newRecord;

//下班打卡（）
-(void)workerEndRecords:(QFRecords*)newRecord;

//考勤查询根据学生学号和时间段；
-(NSArray*)searchUsingStuNo:(NSString*)stuNo andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime;

//考勤查询（根据班级和时间段）
-(NSArray*)searchUsingClass:(NSString*)classNo  andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime;

//考勤统计(根据学生姓名和时间段)
-(NSString*)totalUsingStuNo:(NSString*)stuNo andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime;

//考勤统计（根据班级和时间段）
-(NSArray*)totalUsingClass:(NSString*)classNo  andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime;

////添加考勤照片；
//-(void)addRecordsPhoto;
//
////查询考勤照片（根据班级，时间段）；
//-(void)searchRecordPhotoUsingClassAndTime;

@end
