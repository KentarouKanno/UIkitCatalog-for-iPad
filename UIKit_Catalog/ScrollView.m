//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "ScrollView.h"

#define SCROLL_IMAGE_HEIGHT 300
#define SCROLL_IMAGE_WIDTH 400

@implementation ScrollView
{
    UIImageView *zoomImage;
}

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"ScrollView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    self.imageScrollView.contentSize = CGSizeMake(SCROLL_IMAGE_WIDTH * 5,SCROLL_IMAGE_HEIGHT);
    
    // scrollImage 作成
    for (int i = 0; i < 5; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpg",i]];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
        imgView.frame = CGRectMake(SCROLL_IMAGE_WIDTH * i, 0, SCROLL_IMAGE_WIDTH, SCROLL_IMAGE_HEIGHT);
        [self.imageScrollView addSubview:imgView];
    }
    
    // zoomImage 作成
    UIImage *img = [UIImage imageNamed:@"mac.jpg"];
    zoomImage = [[UIImageView alloc]initWithImage:img];
    [self.zoomScrollView addSubview:zoomImage];
    self.zoomScrollView.contentSize = zoomImage.frame.size;
    [self.zoomScrollView setZoomScale:0.2];
}

// Zoomサイズを表示
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    self.zoomLabel.text = [NSString stringWithFormat:@"%.2f%%",scale * 100];
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return zoomImage;
}

// ScrollView Paging Enable切り替え
- (IBAction)pagingChange:(UISwitch*)sender
{
    sender.on? [_imageScrollView setPagingEnabled:YES] :[_imageScrollView setPagingEnabled:NO];
}

@end
