//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollView : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *zoomScrollView;
@property (strong, nonatomic) IBOutlet UILabel *zoomLabel;

+ (id)LoadFromNib;

@end
