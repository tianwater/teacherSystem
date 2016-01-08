//
//  QFMenuItem.h
//  07教务补充系统
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

//1）、学生上班打卡
//2）、下班打卡（移动端和服务器端都可以进行）
//3）、考勤查询
//    1、时间查询
//    2、按照班级，姓名，时间查询；
//4）、考勤统计
//    1、以人为单位统计；
//    2、以班为单位统计；
//5）、每天的学习总结
//    1、录入
//    2、查看
//6）、上传晚自习下班时的照片。
//    1、录入
//    2、查看

#import <Foundation/Foundation.h>

@interface QFMenuItem : NSObject

@property int menuId;//菜单编号，唯一的；菜单编号从1开始，按照自然数的顺序增加；
@property NSString *hotKey;
@property NSString *menuName;
@property NSString *funcName; //点击菜单后，调用的函数名，如果该属性的值为nil，表示当前菜单有子一级菜单；
@property int parMenuId;//父菜单编号；//第一级菜单的父菜单编号用0表示；

-(QFMenuItem*)initWithMenuId:(int)menuId andHotKey:(NSString*)hotKey andMenuName:(NSString*)menuName  andFuncName:(NSString*)funcName  andParMenuId:(int)parMenuId;

@end

//菜单编号 热键  菜单名          父菜单编号
//
//   1  "1"  "学生上班打卡"  ""    0
//
//   2  "2"  "学生下班打卡"  ""    0
//
//   3  "3"  "考勤查询"  nil      0
//
//   4  "4"  "考勤统计"  nil      0
//
//   5  "5"  "每天的学习总结" nil  0
//
//   6  "6"  "上次晚自习下班时的照片"  nil  0
//
//   7  "1"  "按照时间查询"  ""  3 
//
//   8  "2"  "按照班级，姓名，时间查询"  ""  3
//
//   9  "1"  "以人为单位进行统计"  ""  4 
//
//   10  "2"  "以班为单位进行统计"  ""  4
//
//   11  "1"  "录入"  ""  5 
//   12  "2"  "查看"  ""  5
//
//   13  "1"  "录入"  ""  6 
//   14  "2"  "查看"  ""  6
//
//    16                    7
//    17                    7
