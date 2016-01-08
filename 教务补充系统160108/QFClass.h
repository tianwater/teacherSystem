//
//  QFClass.h
//  02教务补充系统
//
//  Created by qianfeng on 15/12/18.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
//成员变量（属性）：班级编号，所在教室，班级人数
@interface QFClass : NSObject
@property NSString *classNo;
@property NSString *classRoom;
@property int num;


-(QFClass*)initWithClassNo:(NSString*)classNo andClassRoom:(NSString*)classRoom andNum:(int)num;


@end
