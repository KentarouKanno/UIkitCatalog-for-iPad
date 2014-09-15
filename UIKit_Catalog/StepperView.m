//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "StepperView.h"

@interface StepperView()

@property (weak, nonatomic) IBOutlet UIStepper *backImageStepper;

@end

@implementation StepperView

+ (instancetype)LoadFromNib
{
    StepperView *view = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:nil options:nil][0];
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
