//
//  OtherTableViewController.m
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/12/1.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "OtherTableViewController.h"
#import "AboutViewController.h"
#import "AnnounceViewController.h"
@interface OtherTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UserNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *PwdLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *AreaPicker;
@property (weak, nonatomic) IBOutlet UIButton *OutOfLogin;
@property (weak, nonatomic) IBOutlet UILabel *CleanLabel;

@end

@implementation OtherTableViewController
{
    float size;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"其他";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AboutViewController *vc1 = [[AboutViewController alloc]init];
    AnnounceViewController *vc2 = [[AnnounceViewController alloc]init];
    if (indexPath.row == 0 && indexPath.section == 1) {
        [self.navigationController pushViewController:vc1 animated:YES];
    }
    else if (indexPath.row == 1 && indexPath.section == 1) {
        [self.navigationController pushViewController:vc2 animated:YES];
    }
    else if (indexPath.row ==0 && indexPath.section == 2)
    {
//        [self.navigationController pushViewController:vc1 animated:YES];
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否清除缓存" preferredStyle:UIAlertControllerStyleAlert];
        [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel  handler:nil]];
        [alertVc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            [self CacheClean];
        }]];
        [self presentViewController:alertVc animated:NO completion:nil];
    }
}

//清除缓存
-(void)CacheClean
{
    NSString *rootPath = NSHomeDirectory();
    //记得加上缓存图片的沙盒地址
    NSString *path = [NSString stringWithFormat:@"%@/",rootPath];
    //建立文件管理类
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *name;
    NSDirectoryEnumerator *directoryEnumerator = [manager enumeratorAtPath:path];
    //遍历目录
    while ( name = [directoryEnumerator nextObject]) {
        NSString *newPath = [NSString stringWithFormat:@"%@/%@",path,name];
        //执行删除沙盒目录里的图片
        [manager removeItemAtPath:newPath error:nil];
    }
    NSLog(@"%f",size);
    self.CleanLabel.text = [NSString stringWithFormat:@"0.0M"];
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"newfeature"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 8;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
