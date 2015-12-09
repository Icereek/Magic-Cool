//
//  AboutViewController.m
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/12/1.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "AboutViewController.h"
#import "SystemDefine.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *MainImg = [[UIImageView alloc]initWithFrame:CGRectMake(currentScreenWidth/2-50, currentScreenHeight/2-200, 100, 100)];
    MainImg.image = [UIImage imageNamed:@"btn1"];
    [self.view addSubview:MainImg];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(currentScreenWidth/2-150, currentScreenHeight/2-120, 300, 100)];
    label.text = @"labellabelllllllllllllllllllllllllllllll";
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textColor = [UIColor redColor];
//    label.textAlignment = UITextAlignmentCenter;
//    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 10;
    [self.view addSubview:label];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
