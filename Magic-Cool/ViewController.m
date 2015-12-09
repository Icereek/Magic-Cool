//
//  ViewController.m
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/11/30.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "ViewController.h"
#import "ExpFunctionButton.h"
#import "SystemDefine.h"
//#import "LoginViewController.h"
#import "OtherTableViewController.h"
#import "MyExpViewController.h"
#import "ChartViewController.h"
#import "FindBackView.h"
#import "LoginView.h"
#import "RegistView.h"
@interface ViewController ()
{
    float _functionButtonX;
    UIButton *loginBtn;
    UIVisualEffectView *effectview;
    UIImageView *bgView ;
}
@property (strong,nonatomic)NSArray *titleArray;
@property (strong,nonatomic)NSArray *ViewIDArray;

@end
//特别注意，当用户进入时，如果用户id存在，隐藏登录按钮。如果用户id不存在，显示登录按钮，让用户可以登录。
@implementation ViewController
-(void)viewWillAppear:(BOOL)animated//加载前
{
    [self.navigationController setNavigationBarHidden:YES];
    //隐藏导航栏
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景图片
    bgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, currentScreenWidth, currentScreenHeight)];
    bgView.image=[UIImage imageNamed:@"MainBackground.jpg"];
    [self.view addSubview:bgView];
    //创建标题
    UIImageView *titleImg=[[UIImageView alloc]initWithFrame:CGRectMake(currentScreenWidth/10, 5,currentScreenWidth *8/10 , currentScreenHeight/4)];
//    titleImg.backgroundColor=[UIColor clearColor];
    titleImg.image=[UIImage imageNamed:@"titleImage"];
    [self.view addSubview:titleImg];
    //创建登录按钮
    loginBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-80, 80, 80, 30)];
    loginBtn.backgroundColor=[UIColor clearColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(BtnLogin) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:loginBtn];
    //设置功能按钮
    [self setupFunctionButton];
    // Do any additional setup after loading the view, typically from a nib.
}
//登录按钮跳转
-(void)BtnLogin
{
    //隐藏登录按钮
    [loginBtn setHidden:YES];
    //登录界面
    LoginView *login = [[LoginView alloc]init];
    login.center = self.view.center;
    //毛玻璃
    [self Addeffect];
    __weak LoginView *weakself = login;//使block指向self一个弱指针 。
    //甲里引用乙，乙里引用甲，就会导致 “retain cycle” -- “形成怪圈”的错误。
    [login setForgetcb:^{
        //找回密码
        FindBackView *FindBack = [[FindBackView alloc]init];
        FindBack.center = self.view.center;
        [self.view addSubview:FindBack];
        //点击取消按钮 返回登录界面
        [FindBack setCancelcb:^{
            [weakself setHidden:NO];
        }];
        //点击确认按钮  返回主界面
        [FindBack setSurecb:^{
            [effectview removeFromSuperview];
            [loginBtn setHidden:NO];
        }];
    }];
    [login setGotocb:^{
        NSLog(@"222222");
        [effectview removeFromSuperview];
        [loginBtn setHidden:NO];
        
    }];
    [login setBackcb:^{
        NSLog(@"33333");
        [effectview removeFromSuperview];
        [loginBtn setHidden:NO];
    }];
    [login setNewusercb:^{
        NSLog(@"44444");
        RegistView *Regist = [[RegistView alloc]init];
        Regist.center = self.view.center;
        [self.view addSubview: Regist];
        //点击取消按钮 返回登录界面
        [Regist setCancelcb:^{
            [weakself setHidden: NO];
        }];
        //点击确认按钮  返回主界面
        [Regist setSurecb:^{
            [effectview removeFromSuperview];
            [loginBtn setHidden:NO];
        }];
    }];
    [self.view addSubview:login];
}
// 设置功能按钮
-(void)setupFunctionButton
{
    //创建功能按钮
    int column=2;
    CGFloat buttonWH=90;
    for (int i=0; i<6; i++) {
        int j=i%column;
        int n=i/column;
        if (j==0) {
            _functionButtonX=currentScreenWidth/2-20-buttonWH;
        }
        else if(j==1)
        {
             _functionButtonX=currentScreenWidth/2+20;
        }
        
        CGFloat functionButtonY=currentScreenHeight/4+10+(buttonWH+20)*n;
        ExpFunctionButton *functionButton=[[ExpFunctionButton alloc]initWithFrame:CGRectMake(_functionButtonX, functionButtonY, buttonWH, buttonWH)];
        NSString *imageName=[NSString stringWithFormat:@"btn%d",i+1];
        [functionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        functionButton.tag= i*100 + 100;
        [self.view addSubview:functionButton];
//        监听按钮点击
        [functionButton addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
    };
}
//点击按钮跳转
-(void)pushViewController:(ExpFunctionButton *)button
{
    UIButton *btn = [self.view viewWithTag:button.tag];
    //表情制作
    if (btn.tag == 100) {
        
    }
    //素材库
    else if (btn.tag == 200)
    {
        
    }
    //达人酷
    else if (btn.tag == 300)
    {
        
    }
    //我的表情
    else if (btn.tag == 400)
    {
        MyExpViewController *MyExp = [MyExpViewController alloc];
        [self.navigationController pushViewController:MyExp animated:YES];
    }
    //排行榜
    else if (btn.tag == 500)
    {
        ChartViewController *Chart = [ChartViewController alloc];
        [self.navigationController pushViewController:Chart animated:YES];
    }
    //其他
    else if (btn.tag == 600)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        OtherTableViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"other"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}
//毛玻璃效果
-(void)Addeffect
{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.4;
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    effectview = [[UIVisualEffectView alloc]initWithEffect:blur];
    effectview.tag = 1000;
    effectview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [bgView.layer addAnimation:animation forKey:nil];
    [self.view addSubview:effectview];
}

@end
