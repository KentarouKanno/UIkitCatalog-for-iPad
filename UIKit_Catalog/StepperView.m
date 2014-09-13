//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "StepperView.h"

@implementation StepperView

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"StepperView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    
}

- (IBAction)pushStepper:(id)sender
{
    self.countLabel.text = @((int)self.stepper.value).stringValue;
}

@end
