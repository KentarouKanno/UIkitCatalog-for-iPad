//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "SliderView.h"

@implementation SliderView

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"SliderView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    [self.slider2 setThumbImage:[UIImage imageNamed:@"zoom.png"] forState:UIControlStateNormal];
}

- (IBAction)slider1Change:(id)sender
{
    self.label1.text = @((int)self.slider1.value).stringValue;
    self.zoomLabel.font = [UIFont systemFontOfSize:(int)self.slider1.value];
}

- (IBAction)slider2Change:(id)sender
{
    self.label2.text = @(self.slider2.value).stringValue;
}

- (IBAction)slider3Change:(id)sender
{
    self.label3.text = @(self.slider3.value).stringValue;
    self.slider3.thumbTintColor = [UIColor greenColor];
}

@end
