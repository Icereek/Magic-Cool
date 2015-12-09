//
//  FindBackView.m
//  登录弹窗－自定义view
//
//  Created by 斯普瑞恩 on 15/12/4.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "FindBackView.h"
@implementation FindBackView
{
    UIImageView *mainBack;
    UILabel *FindBackLabel;
    UILabel *QuestionLabel;
    UILabel *AnswerLabel;
    UILabel *NewPwdLabel;
    UILabel *NewPwdLabel2;
    UITextField *AnswerField;
    UITextField *NewPwdField;
    UITextField *NewPwdField2;
    UIButton *CancelBtn;
    UIButton *SureBtn;
}

-(id)init
{
    if (self) {
        self = [[FindBackView alloc]initWithFrame:CGRectMake(self.frame.size.width/2 -120, self.frame.size.height/2-130 , 240, 260)];
        self.backgroundColor = [UIColor redColor];
        UIImageView *newImg = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2 -120, self.frame.size.height/2-130 , 240, 260)];
        newImg.image = [UIImage imageNamed:@"MainBackground.jpg"];
        [self addSubview:newImg];
        [self FindBackView];
    }
    return  self;
}

-(void)FindBackView
{
    FindBackLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 80, 50)];
    FindBackLabel.text = @"找回密码";
    FindBackLabel.textColor = [UIColor blackColor];
    FindBackLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:FindBackLabel];
    QuestionLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 80, 50)];
    QuestionLabel.text = @"提示问题";
    QuestionLabel.textColor = [UIColor blackColor];
    QuestionLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:QuestionLabel];
    AnswerLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 80, 50)];
    AnswerLabel.text = @"答案";
    AnswerLabel.textColor = [UIColor blackColor];
    AnswerLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:AnswerLabel];
    NewPwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 140, 80, 50)];
    NewPwdLabel.text = @"新密码";
    NewPwdLabel.textColor = [UIColor blackColor];
    NewPwdLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:NewPwdLabel];
    NewPwdLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 180, 80, 50)];
    NewPwdLabel2.text = @"再次输入";
    NewPwdLabel2.textColor = [UIColor blackColor];
    NewPwdLabel2.font = [UIFont systemFontOfSize:18];
    [self addSubview:NewPwdLabel2];
    AnswerField = [[UITextField alloc]initWithFrame:CGRectMake(70, 100, 100, 20)];
    AnswerField.delegate = self;
    AnswerField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:AnswerField];
    AnswerField = [[UITextField alloc]initWithFrame:CGRectMake(70, 140, 100, 20)];
    NewPwdField.delegate = self;
    NewPwdField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:NewPwdField];
    NewPwdField2 = [[UITextField alloc]initWithFrame:CGRectMake(70, 180, 100, 20)];
    NewPwdField2.delegate = self;
    NewPwdField2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:NewPwdField2];
    CancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 210, 40, 30)];
    CancelBtn.backgroundColor = [UIColor redColor];
    [CancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [CancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: CancelBtn];
    [CancelBtn addTarget:self action:@selector(CancelBtn) forControlEvents:UIControlEventTouchUpInside];
    SureBtn = [[UIButton alloc]initWithFrame:CGRectMake(150, 210, 40, 30)];
    SureBtn.backgroundColor = [UIColor redColor];
    [SureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [SureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: SureBtn];
    [SureBtn addTarget:self action:@selector(SureBtn) forControlEvents:UIControlEventTouchUpInside];
}
-(void)CancelBtn
{
    self.hidden = YES;
    _Cancelcb();

}
-(void)SureBtn
{
    self.hidden = YES;
    _Surecb();
}

@end
