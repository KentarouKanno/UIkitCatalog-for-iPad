//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "SwitchView.h"

@implementation SwitchView

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"SwitchView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    
}

- (IBAction)switchChange:(id)sender
{
    if (self.defaultSwitch.on) {
        self.OnOffLabel.text = @"ON";
    } else {
         self.OnOffLabel.text = @"OFF";
    }
}


@end
