////
////  RegistView.m
////  登录弹窗－自定义view
////
////  Created by 斯普瑞恩 on 15/12/4.
////  Copyright © 2015年 斯普瑞恩. All rights reserved.
////
//
#import "RegistView.h"

@implementation RegistView

{
    UIImageView *mainBack;
    UILabel *registLabel;
    UILabel *userNameLabel;
    UILabel *pwdLabel1;
    UILabel *pwdLabel2;
    UILabel *question;
    UILabel *answer;
    UILabel *areaLabel;
    UITextField *userNameField;
    UITextField *pwdField;
    UITextField *pwdField2;
    UITextField *questionField;
    UITextField *answerField;
    UIButton *cancelBtn;
    UIButton *suerBtn;
}
-(id)init
{
    if (self) {
        self = [[RegistView alloc]initWithFrame:CGRectMake(self.frame.size.width/2 -120, self.frame.size.height/2-160, 240, 320)];
        self.backgroundColor = [UIColor redColor];
        UIImageView *newImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 240, 320)];
        newImg.image = [UIImage imageNamed:@"MainBackground.jpg"];
        [self addSubview:newImg];
        [self RegistView];
    }
    return  self;
}
//
-(void)RegistView
{
    registLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 80, 50)];
    registLabel.text = @"用户注册";
    registLabel.textColor = [UIColor blackColor];
    registLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:registLabel];
    
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 30, 20)];
    userNameLabel.text = @"账号";
    userNameLabel.textColor = [UIColor blackColor];
    userNameLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:userNameLabel];
    pwdLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 30, 20)];
    pwdLabel1.text = @"密码";
    pwdLabel1.textColor = [UIColor blackColor];
    pwdLabel1.font = [UIFont systemFontOfSize:10];
    [self addSubview:pwdLabel1];
    pwdLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, 30, 20)];
    pwdLabel2.text = @"确认密码";
    pwdLabel2.textColor = [UIColor blackColor];
    pwdLabel2.font = [UIFont systemFontOfSize:10];
    [self addSubview:pwdLabel2];
    question = [[UILabel alloc]initWithFrame:CGRectMake(10, 160, 30, 20)];
    question.text = @"提示问题";
    question.textColor = [UIColor blackColor];
    question.font = [UIFont systemFontOfSize:10];
    [self addSubview:question];
    answer = [[UILabel alloc]initWithFrame:CGRectMake(10, 190, 30, 20)];
    answer.text = @"提示答案";
    answer.textColor = [UIColor blackColor];
    answer.font = [UIFont systemFontOfSize:10];
    [self addSubview:answer];
    areaLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 220, 200, 20)];
    areaLabel.text = @"请选择地区";
    areaLabel.textColor = [UIColor blackColor];
    areaLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:areaLabel];
    
    //textfield
    userNameField = [[UITextField alloc]initWithFrame:CGRectMake(50, 70, 100, 20)];
    userNameField.delegate = self;
    userNameField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:userNameField];
    pwdField = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 100, 20)];
    pwdField.delegate = self;
    pwdField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:pwdField];
    pwdField2 = [[UITextField alloc]initWithFrame:CGRectMake(50, 130, 100, 20)];
    pwdField2.delegate = self;
    pwdField2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:pwdField2];
    questionField = [[UITextField alloc]initWithFrame:CGRectMake(50, 160, 100, 20)];
    questionField.delegate = self;
    questionField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:questionField];
    answerField = [[UITextField alloc]initWithFrame:CGRectMake(50, 190, 100, 20)];
    answerField.delegate = self;
    answerField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:answerField];
    
    
    //button
    cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 250, 40, 30)];
    cancelBtn.backgroundColor = [UIColor redColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: cancelBtn];
    [cancelBtn addTarget:self action:@selector(cancelBtn) forControlEvents:UIControlEventTouchUpInside];
    suerBtn = [[UIButton alloc]initWithFrame:CGRectMake(150, 250, 40, 30)];
    suerBtn.backgroundColor = [UIColor redColor];
    [suerBtn setTitle:@"确认" forState:UIControlStateNormal];
    [suerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: suerBtn];
    [suerBtn addTarget:self action:@selector(sureBtn) forControlEvents:UIControlEventTouchUpInside];
}

-(void)cancelBtn
{
    self.hidden = YES;
    _cancelcb();
}
-(void)sureBtn
{
    self.hidden = YES;
    _surecb();
}
@end
