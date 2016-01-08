//
//  QFMenuManager.h
//  07教务补充系统
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFUI.h"

@interface QFMenuManager : NSObject

@property QFUI *ui;
@property NSMutableDictionary *menuDict;
//当前父菜单编号；
@property int currParMenuId;

+(QFMenuManager*)defaultMenuManager;

-(void)showMenu;

-(int)getChoice;

-(void)doSomething:(int)choice;

@end
