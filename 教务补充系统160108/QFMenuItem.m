//
//  QFMenuItem.m
//  07教务补充系统
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "QFMenuItem.h"

@implementation QFMenuItem


-(QFMenuItem*)initWithMenuId:(int)menuId andHotKey:(NSString*)hotKey andMenuName:(NSString*)menuName andFuncName:(NSString*)funcName andParMenuId:(int)parMenuId
{
    if(self = [super init])
    {
        self->_menuId = menuId;
        self->_hotKey = hotKey;
        self->_menuName = menuName;
        self->_funcName = funcName;
        self->_parMenuId = parMenuId;
    }
    return self;
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"%@、%@",self.hotKey,self.menuName];
}

@end
