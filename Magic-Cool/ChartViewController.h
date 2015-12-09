//
//  ChartViewController.h
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/12/2.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorldTableViewController.h"
#import "AreaTableViewController.h"
@interface ChartViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic,retain) UIScrollView *scroll;
@property (nonatomic,strong) WorldTableViewController *table;
@property (nonatomic,strong) AreaTableViewController *area;
@property (nonatomic,strong) UISegmentedControl *segmentControl;
@end
