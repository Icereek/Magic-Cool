//
//  ChartViewController.m
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/12/2.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "ChartViewController.h"
#import "SystemDefine.h"
@interface ChartViewController ()

@end

@implementation ChartViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"排行榜";
    UIImageView *MainImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, currentScreenWidth, currentScreenHeight)];
    MainImg.image = [UIImage imageNamed:@"MainBackground"];
    [self.view addSubview:MainImg];
   //添加选择器
//    UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"世界排名",@"地区排名"]];
//    self.segmentControl.frame = CGRectMake(currentScreenWidth/2-100, 20, 200, 40);
    self.segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"世界排名",@"地区排名"]];
    //选择器的frame
    self.segmentControl.frame = CGRectMake(currentScreenWidth/2-100, 15, 200, 40);
    self.segmentControl.selectedSegmentIndex = 0;//默认进入时显示第一个
    self.segmentControl.tintColor = [UIColor grayColor];
    [self.segmentControl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentControl];
    
    //添加scrollView
    //scroll的frame
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, currentScreenWidth, currentScreenHeight -120)];
    //scroll的可滑动范围
    self.scroll.contentSize = CGSizeMake(currentScreenWidth *2, currentScreenHeight -120);
    self.scroll.scrollEnabled = YES;
    self.scroll.delegate = self;
    self.scroll.bounces = NO;
    self.scroll.pagingEnabled = YES;
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.directionalLockEnabled =YES;
    [self.view addSubview:self.scroll];
    
    //添加tableview-World
    self.table = [[WorldTableViewController alloc]init];
    //world的frame   相对于scroll的位置
    self.table.view.frame = CGRectMake(0,0, currentScreenWidth, currentScreenHeight);
    [self.scroll addSubview:self.table.view];
    
    //添加tableview-Area
    self.area = [[AreaTableViewController alloc]init];
    //area的frame  相对于scroll的位置
    self.area.view.frame = CGRectMake(currentScreenWidth,0, currentScreenWidth, currentScreenHeight);
    [self.scroll addSubview:self.area.view];
    
    // Do any additional setup after loading the view.
}

-(void)changeSegment:(id)sender
{
    UISegmentedControl *control = sender;
    if (control.selectedSegmentIndex == 1)
    {
        //contentOffset是scrollview当前显示区域顶点相对于frame顶点的偏移量，比如上个例子你拉到最下面，contentoffset就是(0 ,480)，也就是y偏移了480
        [self.scroll setContentOffset:CGPointMake(currentScreenWidth,0) animated:YES];
    }
    else if (control.selectedSegmentIndex ==0)
    {
        [self.scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

//停止滑动时 让segmentIndex的值变化
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]]) {
        return;
    }
    
    int index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    [self.segmentControl setSelectedSegmentIndex:index];
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
