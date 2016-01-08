//
//  QFBussiness.m
//  01教务补充系统
//
//  Created by qianfeng on 15/12/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFBussiness.h"
#import "QFRecords.h"
#import "QFClass.h"
#import "QFTeacher.h"
#import "QFStudent.h"

@implementation QFBussiness

-(QFBussiness*)initWithClassDict:(NSMutableDictionary*)classDict andStuDict:(NSMutableDictionary*)stuDict andTeacherDict:(NSMutableDictionary*)teacherDict andRecordesDict:(NSMutableDictionary*)recordesDict

{
    if (self=[super init]) {
        self->classDict = [[NSMutableDictionary alloc]init];
        self->stuDict = [[NSMutableDictionary alloc]init];
        self->teacherDict = [[NSMutableDictionary alloc]init];
        self->recordesDict = [[NSMutableDictionary alloc]init];
    }
    return self;
}

//添加班级；
-(void)addClass:(QFClass*)newClass
{
    //1、判断班级是否存在；
    
    
    //2、不存在就添加到字典；
    [self->classDict setObject:newClass forKey:newClass.classNo];
    
}

//添加学生
-(void)addStudent:(QFStudent*)newStudent
{
    //1、判断学生是否存在；
    
    //2、不存在就添加到字典；
    [self->stuDict setObject:newStudent forKey:newStudent.stuNo];
}

//添加老师
-(void)addTeacher:(QFTeacher*)newTeacher
{
    //1、判断是否存在；
    
    //2、不存在就添加到字典；
    [self->teacherDict setObject:newTeacher forKey:newTeacher.teacherNo];
}


//上班打卡（添加考勤；）
//newRecord对象包含的信息：学号，日期，上班打卡时间；
-(void)workerStartRecords:(QFRecords*)newRecord
{
    newRecord.date =  [NSDate date];
    //   1、 键：学生编号和日期连接起来的字符串；
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    
    NSString *dateStr = [dateFormatter stringFromDate:newRecord.date];
    
    NSString *keyStr = [NSString stringWithFormat:@"%@,%@",newRecord.stuNo,dateStr];
    
    //2、把实际上班打卡时间和作息时间对比，判断状态。（四位字符串：每一位代表一种状态，从第一位到第四位分别表示：迟到，早退，旷课，请假；如：1000：表示迟到；0000：表示正常；）
    
    
    
    //3、把打卡记录添加到字典中
    [self->recordesDict setObject:newRecord forKey:keyStr];
}


//下班打卡（）
//newRecord对象包含的信息：学号，日期，下班打卡时间；
-(void)workerEndRecords:(QFRecords*)newRecord
{
    newRecord.endDate = [NSDate date];
    //   1、 键：学生编号和日期连接起来的字符串；
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    NSString *dateStr = [dateFormatter stringFromDate:newRecord.endDate];
    
    NSString *keyStr = [NSString stringWithFormat:@"%@,%@",newRecord.stuNo,dateStr];
    
    //2、把当天的打卡记录对象取出来，修改它的下班打卡时间；
    QFRecords *currRecord = [self->recordesDict objectForKey:keyStr];
    currRecord.endDate = newRecord.endDate;
    
    //3、把实际上班打卡时间和作息时间对比，判断状态（）。
    
}

//考勤查询根据学生学号和时间段；
//  iOS1501   2015-12-01  到  2015- 12-31的考勤
-(NSArray*)searchUsingStuNo:(NSString*)stuNo andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
{
    //循环考勤字典，判断每个考勤记录是否满足条件；若满足，则放入数组中。
    NSMutableArray *resultArr = [[NSMutableArray alloc]init];//保存最终查询到的考勤记录。
    
    for(NSString *keyStr in self->recordesDict)
    {
        QFRecords *record = [self->recordesDict objectForKey:keyStr];
        if ([record.stuNo isEqualToString:stuNo]==YES && [record.date compare:startTime]==NSOrderedDescending && [record.date compare:endTime]==NSOrderedAscending) {
            [resultArr addObject:record];
        }
    }
    return resultArr;
}


//考勤查询（根据班级和时间段）
-(NSArray*)searchUsingClass:(NSString*)classNo  andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
{
    //循环考勤字典，判断每个考勤记录是否满足条件；若满足，则放入数组中。
    NSMutableArray *resultArr = [[NSMutableArray alloc]init];//保存最终查询到的考勤记录。
    
    for(NSString *keyStr in self->recordesDict)
    {
        QFRecords *record = [self->recordesDict objectForKey:keyStr];
        if ([record.classNo isEqualToString:classNo]==YES && [record.date compare:startTime]==NSOrderedDescending && [record.date compare:endTime]==NSOrderedAscending) {
            [resultArr addObject:record];
        }
    }
    return resultArr;
}

//考勤统计，统计某个学生的出勤情况(根据学生姓名和时间段)//月度
// iOS150501   2015-12-01  到 2015-12-31
//统计结果示例：

//    iOS150501  田广 应出勤次数 实际出勤次数 迟到几次

//早退几次，请假次数 旷课次数；
-(NSString*)totalUsingStuNo:(NSString*)stuNo andStartTime:(NSDate*)startTime andEndTime:(NSDate*)endTime
{
    int mustCount = 22;//结束时间减去开始时间；除去周末；暂时写死，以22天为单位；
    int realCount = 0;
    int lateCount = 0;
    //循环考勤字典
    for (QFRecords *record in self->recordesDict) {
        if ([record.stuNo isEqualToString:stuNo]==YES && [record.date compare:startTime]==NSOrderedDescending && [record.date compare:endTime]==NSOrderedAscending) {
            realCount++;
//            （四位字符串：每一位代表一种状态，从第一位到第四位分别表示：迟到，早退，旷课，请假；如：1000：表示迟到；0000：表示正常；）
            if ([record.recordsState characterAtIndex:0] =='1'){
                lateCount++;
            }
        }
    }
    return [NSString stringWithFormat:@"学号：%@，应出勤次数：%d，实际出勤次数：%d，迟到次数：%d",stuNo,mustCount,realCount,lateCount];
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
    
    return nil;
}


@end
