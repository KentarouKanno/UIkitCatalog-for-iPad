//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlView : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

+ (id)LoadFromNib;

- (IBAction)pageChange:(id)sender;

@end
