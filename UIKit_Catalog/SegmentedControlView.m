//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "SegmentedControlView.h"

@implementation SegmentedControlView

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"SegmentedControlView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}


-(void)awakeFromNib
{
    
}

- (IBAction)control1:(id)sender
{
    switch (self.segment1.selectedSegmentIndex) {
        case 0:
            self.label1.text = @"First";
            break;
        case 1:
            self.label1.text = @"Second";
            break;
            
        default:
            break;
    }}

- (IBAction)control2:(id)sender
{
    switch (self.segment2.selectedSegmentIndex) {
        case 0:
            self.label2.text = @"Left";
            break;
        case 1:
            self.label2.text = @"Right";
            break;
            
        default:
            break;
    }
}

- (IBAction)control3:(id)sender
{
    switch (self.segment3.selectedSegmentIndex) {
        case 0:
            self.label3.text = @"1";
            break;
        case 1:
            self.label3.text = @"2";
            break;
        case 2:
            self.label3.text = @"3";
            break;
        case 3:
            self.label3.text = @"4";
            break;
        case 4:
            self.label3.text = @"5";
            break;
        
        default:
            break;
    }
}

- (IBAction)control4:(id)sender
{
    switch (self.segment4.selectedSegmentIndex) {
        case 0:
            self.segmentImage.image = [UIImage imageNamed:@"image0.jpg"];
            break;
        case 1:
            self.segmentImage.image = [UIImage imageNamed:@"image1.jpg"];
            break;
        case 2:
            self.segmentImage.image = [UIImage imageNamed:@"image2.jpg"];
            break;
        
        default:
            break;
    }
}

@end
