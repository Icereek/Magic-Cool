//
//  LoginView.m
//  登录弹窗－自定义view
//
//  Created by 斯普瑞恩 on 15/12/4.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView
{
    UIImageView *mainBack;
    UIVisualEffectView *effectview;
    UILabel *loginLabel;
    UILabel *userIDLabel;
    UILabel *pwdLabel;
    UITextField *userIDField;
    UITextField *pwdIDField;
    UIButton *GotoBtn;
    UIButton *backBtn;
    UIButton *forgetBtn;
    UIButton *newUserBtn;
}

//-(id)initWithFrame:(CGRect)frame{
//    
//    return self;
//}

-(id)init{
    if (self) {
        self = [[LoginView alloc]initWithFrame:CGRectMake(self.frame.size.width/2 -120, self.frame.size.height/2-120, 240, 200)];
        self.backgroundColor = [UIColor redColor];
        UIImageView *newImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 240, 200)];
        newImg.image = [UIImage imageNamed:@"MainBackground.jpg"];
        [self addSubview:newImg];
        //登录界面  界面控件
        [self LoginView];
    }
    return self;
}

-(void)LoginView
{
    loginLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 80, 50)];
    loginLabel.text = @"用户登录";
    loginLabel.textColor = [UIColor blackColor];
    loginLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:loginLabel];
    userIDLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 30, 20)];
    userIDLabel.text = @"账号";
    userIDLabel.textColor = [UIColor blackColor];
    userIDLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:userIDLabel];
    pwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 30, 20)];
    pwdLabel.text = @"密码";
    pwdLabel.textColor = [UIColor blackColor];
    pwdLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:pwdLabel];
    
    //textfield
    userIDField = [[UITextField alloc]initWithFrame:CGRectMake(50, 70, 100, 20)];
    userIDField.delegate = self;
    userIDField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:userIDField];
    
    pwdIDField = [[UITextField alloc]initWithFrame:CGRectMake(50, 120, 100, 20)];
    pwdIDField.delegate = self;
    pwdIDField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:pwdIDField];
    
    //button
    GotoBtn = [[UIButton alloc]initWithFrame:CGRectMake(55, 150, 150, 20)];
    GotoBtn.backgroundColor = [UIColor redColor];
    [GotoBtn setTitle:@"登录" forState:UIControlStateNormal];
    [GotoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: GotoBtn];
    [GotoBtn addTarget:self action:@selector(GotoBtn) forControlEvents:UIControlEventTouchUpInside];
    
    backBtn = [[UIButton alloc]initWithFrame:CGRectMake(220, 0 , 20, 20)];
    backBtn.backgroundColor = [UIColor redColor];
    [backBtn setTitle:@"叉" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: backBtn];
    [backBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    
    forgetBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 180, 60, 20)];
    forgetBtn.backgroundColor = [UIColor redColor];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: forgetBtn];
    [forgetBtn addTarget:self action:@selector(forgetBtn) forControlEvents:UIControlEventTouchUpInside];
    
    newUserBtn = [[UIButton alloc]initWithFrame:CGRectMake(160, 180, 60, 20)];
    newUserBtn.backgroundColor = [UIColor redColor];
    [newUserBtn setTitle:@"新用户" forState:UIControlStateNormal];
    [newUserBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: newUserBtn];
    [newUserBtn addTarget:self action:@selector(newUserBtn) forControlEvents:UIControlEventTouchUpInside];
}

-(void)GotoBtn
{
    self.hidden = YES;
    _gotocb();
}
-(void)backBtn
{
    self.hidden = YES;
    _backcb();
}
-(void)forgetBtn
{
    self.hidden = YES;
    _forgetcb();
}
-(void)newUserBtn
{
    self.hidden = YES;
    _newusercb();
}

@end

