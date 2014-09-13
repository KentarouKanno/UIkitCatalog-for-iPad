//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "DatePickerView.h"

@implementation DatePickerView
{
    NSDateFormatter *df;
}

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"DatePickerView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    df = [[NSDateFormatter alloc]init];
    [self performSelector:@selector(setlabelDate) withObject:nil afterDelay:0.15];
}

- (void)setlabelDate
{
    [self picker1:self.picker1];
    [self picker2:self.picker2];
    [self picker3:self.picker3];
    [self picker4:self.picker4];
}

- (IBAction)picker1:(id)sender
{
    df.dateFormat = @"HH:mm";
    self.label1.text = [df stringFromDate:((UIDatePicker*)sender).date];
}

- (IBAction)picker2:(id)sender
{
    df.dateFormat = @"yyyy/MM/dd";
    self.label2.text = [df stringFromDate:((UIDatePicker*)sender).date];
}

- (IBAction)picker3:(id)sender
{
    df.dateFormat = @"yyyy/MM/dd HH:mm";
    self.label3.text = [df stringFromDate:((UIDatePicker*)sender).date];
}

- (IBAction)picker4:(id)sender
{
    df.dateFormat = @"HH:mm";
    self.label4.text = [df stringFromDate:((UIDatePicker*)sender).date];
}


@end
