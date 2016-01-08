//
//  main.m
//  07教务补充系统
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFMenuManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        QFMenuManager *menuManager = [[QFMenuManager alloc]init];
        while (YES) {
            [menuManager showMenu];
            int choice = [menuManager getChoice];
            [menuManager doSomething:choice];
        }
    }
    return 0;
}
