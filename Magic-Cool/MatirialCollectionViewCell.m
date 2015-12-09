//
//  MatirialCollectionViewCell.m
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/12/9.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "MatirialCollectionViewCell.h"

@implementation MatirialCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(3, 3, 105, 110)];
        [self addSubview:self.imgView];
        NSLog(@"%@",self.imgView.image);
        
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 111, 105, 22)];
        self.priceLabel.backgroundColor = [UIColor brownColor];
        self.priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.priceLabel];
        
        self.praiseLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, 40, 20)];
        self.praiseLabel.backgroundColor = [UIColor brownColor];
        self.praiseLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.praiseLabel];
    }
    return self;
}
@end
