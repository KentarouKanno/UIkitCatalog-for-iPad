//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndicatorView : UIView

@property (strong, nonatomic) IBOutlet UIButton *animationBtn;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator1;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator2;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator3;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator4;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator5;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator6;

+ (id)LoadFromNib;
- (IBAction)animetion:(id)sender;

@end
