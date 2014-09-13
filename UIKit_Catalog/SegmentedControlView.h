//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedControlView : UIView
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment1;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment2;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment3;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment4;

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UIImageView *segmentImage;



+ (id)LoadFromNib;
- (IBAction)control1:(id)sender;
- (IBAction)control2:(id)sender;
- (IBAction)control3:(id)sender;
- (IBAction)control4:(id)sender;


@end
