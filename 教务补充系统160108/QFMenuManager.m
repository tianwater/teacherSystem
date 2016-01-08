//
//  QFMenuManager.m
//  07教务补充系统
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFMenuManager.h"
#import "QFMenuItem.h"

static QFMenuManager *shareMenuManager=nil;

@implementation QFMenuManager

+(id)allocWithZone:(struct _NSZone *)zone
{
    if (shareMenuManager==nil) {
        shareMenuManager = [super allocWithZone:nil];
    }
    return shareMenuManager;
}

+(QFMenuManager*)defaultMenuManager
{
    if(shareMenuManager == nil)
    {
        shareMenuManager = [[QFMenuManager alloc]init];
    }
    return shareMenuManager;
}

-(QFMenuManager*)init
{
    if (self=[super init]) {
        self->_ui = [[QFUI alloc]init];
        self->_menuDict = [[NSMutableDictionary alloc]init];
        [self menuInit];
        self->_currParMenuId = 0;
    }
    return self;
}

-(void)menuInit
{
    QFMenuItem *menuItem = [[QFMenuItem alloc]initWithMenuId:1 andHotKey:@"1" andMenuName:@"学生上班打卡" andFuncName:@"workStart" andParMenuId:0];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    menuItem = [[QFMenuItem alloc]initWithMenuId:2 andHotKey:@"2" andMenuName:@"学生下班打卡" andFuncName:@"workEnd" andParMenuId:0];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:3 andHotKey:@"3" andMenuName:@"考勤查询" andFuncName:nil andParMenuId:0];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:4 andHotKey:@"4" andMenuName:@"考勤统计" andFuncName:nil andParMenuId:0];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:5 andHotKey:@"5" andMenuName:@"每天的学习总结" andFuncName:nil andParMenuId:0];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:6 andHotKey:@"6" andMenuName:@"上传晚自习下班时的照片" andFuncName:nil andParMenuId:0];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:15 andHotKey:@"7" andMenuName:@"添加学生" andFuncName:@"addStudent" andParMenuId:0];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:7 andHotKey:@"1" andMenuName:@"按照时间查询" andFuncName:@"working" andParMenuId:3];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    menuItem = [[QFMenuItem alloc]initWithMenuId:8 andHotKey:@"2" andMenuName:@"按照班级，姓名，时间查询" andFuncName:@"working" andParMenuId:3];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:9 andHotKey:@"1" andMenuName:@"以人为单位进行统计" andFuncName:@"working" andParMenuId:4];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    menuItem = [[QFMenuItem alloc]initWithMenuId:10 andHotKey:@"2" andMenuName:@"以班为单位进行统计" andFuncName:@"working" andParMenuId:4];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:11 andHotKey:@"1" andMenuName:@"录入" andFuncName:@"working" andParMenuId:5];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    menuItem = [[QFMenuItem alloc]initWithMenuId:12 andHotKey:@"2" andMenuName:@"查看" andFuncName:@"working" andParMenuId:5];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    
    menuItem = [[QFMenuItem alloc]initWithMenuId:13 andHotKey:@"1" andMenuName:@"录入" andFuncName:@"working" andParMenuId:6];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
    menuItem = [[QFMenuItem alloc]initWithMenuId:14 andHotKey:@"2" andMenuName:@"查看" andFuncName:@"working" andParMenuId:6];
    [self->_menuDict setObject:menuItem forKey:@(menuItem.menuId)];
}

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

-(void)showMenu
{
//    NSLog(@"当前父菜单编号：%d",self->_currParMenuId);
    //键的数组：得到字典里所有的键（菜单的编号）
    NSArray *keys = [self->_menuDict allKeys];
    //对键的数组进行排序
    NSArray *sortedKeys = [keys sortedArrayUsingSelector:@selector(compare:)];
    //根据排序好的键数组打印菜单项；
    for (NSString *menuId in sortedKeys) {
        QFMenuItem *currMenuItem = [self->_menuDict objectForKey:menuId];
        if(currMenuItem.parMenuId == self->_currParMenuId)
        {
            NSLog(@"%@",[self->_menuDict objectForKey:menuId]);
        }
    }
    NSLog(@"0、返回");
}

-(int)getChoice
{
    int choice;
    NSLog(@"亲，请输入您的选择：");
    scanf("%d",&choice);
    return choice;
}

//习仲勋
//    习大大
//        习大大儿子1
//        习大大儿子2
//        习大大儿子3
//    习小小

-(void)doSomething:(int)choice
{
    if(choice==0)
    {
        if(self->_currParMenuId==0)
        {
            NSLog(@"欢迎下次继续使用教务补充系统");
            exit(0);
        }
        //通过当前父菜单编号得到父菜单项；
       QFMenuItem *parentMenuItem =  [self->_menuDict objectForKey:@(self->_currParMenuId)];
        //把 父菜单项的父菜单编号 赋给 成员变量中的当前（显示）的父菜单编号；
        self->_currParMenuId = parentMenuItem.parMenuId;
        return;
    }
    
    //键是menuId，但是choice是hotKey，所以，没法通过choice得到对应菜单项；
    NSString *ocChoice = [NSString stringWithFormat:@"%d",choice];
    //获得所有的菜单项
    NSArray *menuItemArr = [self->_menuDict allValues];
    //循环所有菜单项
    for (QFMenuItem *menuItem in menuItemArr) {
        //判断数组中的当前菜单项的父菜单编号是不是，当前显示的菜单的父菜单编号（成员变量）
        if(menuItem.parMenuId == self->_currParMenuId)
        {//缩小了查找范围，
            //判断，用户的输入是否和当前菜单项的热键一样。
            if ([menuItem.hotKey isEqualToString:ocChoice]==YES) {
                if (menuItem.funcName ==nil)
                {//如果当前菜单项的funcName为nil，表示，当前菜单项有子一级菜单，所有，只需要把成员变量中的当前父菜单编号进行更改，改为当前菜单项的菜单编号；
                    self->_currParMenuId = menuItem.menuId;
                }
                else
                {
                    //如果当前菜单项的funcName不为nil，则没有下一级菜单，也就是说它就是一个功能菜单。那就直接调用函数；
                    SEL mySel = NSSelectorFromString(menuItem.funcName);
                    [self->_ui performSelector:mySel];
                }
                break;
            }
        }
    }
}

@end
