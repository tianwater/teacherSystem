//
//  QFUI.m
//  01教务补充系统
//
//  Created by qianfeng on 15/12/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFUI.h"
#import "QFRecords.h"
#import "QFClass.h"
#import "QFTeacher.h"
#import "QFStudent.h"

static QFUI *shareUI = nil;

@implementation QFUI

+(id)allocWithZone:(struct _NSZone *)zone
{
    if (shareUI == nil) {
        shareUI = [super allocWithZone:nil];
    }
    return shareUI;
}

+(QFUI*)defaultMenuManager
{
    if (shareUI==nil) {
        shareUI = [[QFUI alloc]init];
    }
    return shareUI;
}

-(QFUI*)init
{
    if (self=[super init]) {
        self->_controller = [[QFController alloc]init];
    }
    return self;
}

//添加学生
-(void)addStudent
{
//    NSString *stuNo;
//    NSString *classNo;
//    NSString *stuName;
//    
    //1、录入学生信息
    NSLog(@"亲，请输入学生信息：");
    NSLog(@"班级号：");
    char cClassNo[20];
    scanf("%s",cClassNo);
    NSLog(@"学号：");
    char cStuNo[20];
    scanf("%s",cStuNo);
    NSLog(@"姓名：");
    char cName[50];
    scanf("%s",cName);
    
    NSString *ocClassNo = [NSString stringWithFormat:@"%s",cClassNo];
    NSString *ocStuNo = [NSString stringWithFormat:@"%s",cStuNo];
    NSString *ocName = [NSString stringWithFormat:@"%s",cName];
    
    //2、构造对象；
     QFStudent *student = [[QFStudent alloc]initWithClassNo:ocClassNo andStuNo:ocStuNo andStuName:ocName];
    //3、保存对象；
    [self->_controller addStudent:student];
}

//上班打卡

-(void)workStart
{
    //1、录入考勤信息：
    NSLog(@"亲，请输入考勤信息：");
    NSLog(@"学号：");
    char cStuNo[20];
    scanf("%s",cStuNo);
    
    NSString *ocStuNo = [NSString stringWithFormat:@"%s",cStuNo];

    //2、构造对象；
    QFRecords *newRecords = [[QFRecords alloc]initWithStuNo:ocStuNo andDate:nil andStartDate:nil];
    //3、保存对象；
    [self->_controller workerStartRecords:newRecords];

}

//下班打卡
-(void)workEnd
{
    //1、录入考勤信息：
    NSLog(@"亲，请输入考勤信息：");
    NSLog(@"学号：");
    char cStuNo[20];
    scanf("%s",cStuNo);
    
    NSString *ocStuNo = [NSString stringWithFormat:@"%s",cStuNo];
    
    //2、构造对象；
    QFRecords *newRecords = [[QFRecords alloc]initWithStuNo:ocStuNo andDate:nil andStartDate:nil];
    //3、保存对象；
    [self->_controller workerEndRecords:newRecords];
   
}

//考勤查询；
-(void)searchRecord
{

}

//此功能正在完善中……
-(void)working
{
    NSLog(@"不好意思，此功能正在完善中……");
}

@end
