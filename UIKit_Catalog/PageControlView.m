//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "PageControlView.h"

#define SCROLL_IMAGE_HEIGHT 300
#define SCROLL_IMAGE_WIDTH 400

@implementation PageControlView

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"PageControlView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    self.imageScrollView.contentSize = CGSizeMake(SCROLL_IMAGE_WIDTH * 5, SCROLL_IMAGE_HEIGHT);
    
    for (int i = 0; i < 5; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpg",i]];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
        imgView.frame = CGRectMake(SCROLL_IMAGE_WIDTH * i, 0, SCROLL_IMAGE_WIDTH, SCROLL_IMAGE_HEIGHT);
        [self.imageScrollView addSubview:imgView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	int page = scrollView.contentOffset.x / SCROLL_IMAGE_WIDTH;
    self.pageControl.currentPage = page;
}

- (IBAction)pageChange:(id)sender
{
    [self.imageScrollView setContentOffset:CGPointMake(self.pageControl.currentPage * SCROLL_IMAGE_WIDTH, 0) animated:YES];
}


@end
