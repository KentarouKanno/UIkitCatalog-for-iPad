//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "TextFieldView.h"

@implementation TextFieldView
{
    NSMutableArray *fontArray;
}

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"TextFieldView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
