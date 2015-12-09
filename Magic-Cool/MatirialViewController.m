//
//  MatirialViewController.m
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/12/9.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "MatirialViewController.h"
#import "WJItemsControlView.h"
@interface MatirialViewController ()<UIScrollViewDelegate>

{
    WJItemsControlView *_itemControlView;
    UIButton *LatestBtn ;
    UIButton *HottestBtn ;
}

@end

@implementation MatirialViewController
static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    float widht = [UIScreen mainScreen].bounds.size.width;
    float heith = [UIScreen mainScreen].bounds.size.height;
    
    NSArray *array = @[@"新闻",@"房产",@"体育",@"美女",@"文化",@"历史",@"故事",@"汽车"];
    //主背景图
    UIImageView *MainBack = [[UIImageView alloc]initWithFrame:self.view.bounds];
    MainBack.image = [UIImage imageNamed:@"MainBackground"];
    [self.view addSubview:MainBack];
    //最新和最热按钮
    LatestBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 60, 40)];
    LatestBtn.backgroundColor = [UIColor clearColor];
    [LatestBtn setTitle:@"最新" forState:UIControlStateNormal];
    [LatestBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [LatestBtn addTarget:self action:@selector(LatestBtn) forControlEvents:UIControlEventTouchUpInside];
    LatestBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:LatestBtn];
    HottestBtn = [[UIButton alloc]initWithFrame:CGRectMake(315, 5, 60, 40)];
    HottestBtn.backgroundColor = [UIColor clearColor];
    [HottestBtn setTitle:@"最热" forState:UIControlStateNormal];
    [HottestBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [HottestBtn addTarget:self action:@selector(HottestBtn) forControlEvents:UIControlEventTouchUpInside];
    HottestBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:HottestBtn];
    
    //4页内容的scrollView
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 80, widht, heith-80)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(widht*array.count, 80);
    
    for (int i=0; i<array.count; i++) {
        UICollectionViewFlowLayout *fi = [[UICollectionViewFlowLayout alloc]init];
        UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(375 *i, 0, widht, heith-80) collectionViewLayout:fi];
        [collection registerClass:[MatirialCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        collection.delegate = self;
        collection.dataSource = self;
        collection.backgroundColor = [UIColor grayColor];
        [scroll addSubview:collection];
    }
    [self.view addSubview:scroll];
    
    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = widht/4.0;
    
    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, 80-30, widht, 30)];
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;
    
    __weak typeof (scroll)weakScrollView = scroll;
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
        
        
        [weakScrollView scrollRectToVisible:CGRectMake(index*weakScrollView.frame.size.width, 0.0, weakScrollView.frame.size.width,weakScrollView.frame.size.height) animated:animation];
        //滚动一个特定区域的内容，以便它在滚动时是可见的
    }];
    [self.view addSubview:_itemControlView];
    // Do any additional setup after loading the view.
}

//最新按钮功能实现
-(void)LatestBtn
{
}

//最热按钮功能实现
-(void)HottestBtn
{
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];
    
    
    
    //collectionView
}- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MatirialCollectionViewCell *cell = (MatirialCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell sizeToFit];
    cell.imgView.image = [UIImage imageNamed:@"MainBackground"];
    cell.priceLabel.text = @"$1";
    cell.praiseLabel.text = @"925";
    if(!cell)
    {
        NSLog(@"fail");
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//返回每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(111, 129);
}

//返回每个uiCollectionView的margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//返回这个uicollectionview是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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
