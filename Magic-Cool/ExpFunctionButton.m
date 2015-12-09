//
//  ExpFunctionButton.m
//  Magic-Cool
//
//  Created by 斯普瑞恩 on 15/11/30.
//  Copyright © 2015年 斯普瑞恩. All rights reserved.
//

#import "ExpFunctionButton.h"

@implementation ExpFunctionButton

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
//        self.titleLabel.font=[UIFont boldSystemFontOfSize:16];
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
//        self.titleLabel.textAlignment=NSTextAlignmentCenter;
//        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

//-(CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    CGFloat titleY=contentRect.size.height * 0.7;
//    CGFloat titleW=contentRect.size.width;
//    CGFloat titleH=contentRect.size.height *0.2;
//    return CGRectMake(0, titleY, titleW, titleH);
//}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX=0;
    CGFloat imageY=0;
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
@end
