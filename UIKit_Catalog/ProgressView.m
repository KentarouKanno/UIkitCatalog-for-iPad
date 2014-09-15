//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView
{
    NSTimer *timer;
    float value;
}

+ (instancetype)LoadFromNib
{
    ProgressView *view = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}



-(void)awakeFromNib
{
    value = 0;
}


- (IBAction)downLoadBtn:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(progressUpdate) userInfo:nil repeats:YES];
    
    self.hideView.hidden = NO;
    self.DLindicator.hidden = NO;
}

- (void)progressUpdate
{
    if (value  > 1.4) {
        value = 0;
        self.progress1.progress = value;
        self.progress2.progress = value;
        _progress3.progress = value;
        
        self.hideView.hidden = YES;
        self.DLindicator.hidden = YES;
        
        [timer invalidate];
    }
    
    self.progress1.progress = value;
    self.progress2.progress = value;
    _progress3.progress = value;
    
    value += 0.08;
}

@end
