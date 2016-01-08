//
//  QFUI.h
//  01教务补充系统
//
//  Created by qianfeng on 15/12/24.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFController.h"

@interface QFUI : NSObject

@property QFController *controller;

+(QFUI*)defaultMenuManager;

//添加学生
-(void)addStudent;

//上班打卡
-(void)workStart;

//下班打卡
-(void)workEnd;

//考勤查询；
-(void)searchRecord;

//此功能正在完善中……
-(void)working;

@end
