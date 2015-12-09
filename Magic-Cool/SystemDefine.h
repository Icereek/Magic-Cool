//
//  SystemDefine.h
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/11/30.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#ifndef SystemDefine_h
#define SystemDefine_h

#define currentSystemVersion [[UIDevice currentDevice].systemVersion floatValue]
#define currentScreenHeight ((currentSystemVersion >=7.0) ?([UIScreen mainScreen].bounds.size.height):([UIScreen mainScreen].bounds.size.height-20))
#define currentScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define APPDELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#endif /* SystemDefine_h */

