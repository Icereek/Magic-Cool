////
////  RegistView.h
////  登录弹窗－自定义view
////
////  Created by 斯普瑞恩 on 15/12/4.
////  Copyright © 2015年 斯普瑞恩. All rights reserved.
////
//
#import <UIKit/UIKit.h>

@interface RegistView : UIView<UITextFieldDelegate>
@property (nonatomic,copy) void (^cancelcb)();
@property (nonatomic,copy) void(^surecb)();

@end
