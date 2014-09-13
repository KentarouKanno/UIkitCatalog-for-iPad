//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "ButtonSizeView.h"

@implementation ButtonSizeView
{
    NSMutableArray *fontArray;
}

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"ButtonSizeView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    
}

- (IBAction)pushBtn:(id)sender
{
    self.displayLabel.text = [NSString stringWithFormat:@"Push! %@",((UIButton*)sender).titleLabel.text];
}

@end
