//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "IndicatorView.h"

@interface IndicatorView()
{
    UIView *baseView;
    UIView *indicatorView;
    UIActivityIndicatorView *indicator;
}

@end

@implementation IndicatorView

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"IndicatorView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

- (IBAction)animetion:(id)sender
{
    if (self.animationBtn.selected == YES) {
        
        self.animationBtn.selected = NO;
        [self.indicator1 stopAnimating];
        [self.indicator2 stopAnimating];
        [self.indicator3 stopAnimating];
        [self.indicator4 stopAnimating];
        [self.indicator5 stopAnimating];
        [self.indicator6 stopAnimating];
        
    } else {
        self.animationBtn.selected = YES;
        [self.indicator1 startAnimating];
        [self.indicator2 startAnimating];
        [self.indicator3 startAnimating];
        [self.indicator4 startAnimating];
        [self.indicator5 startAnimating];
        [self.indicator6 startAnimating];
    }
}


-(void)awakeFromNib
{
    self.indicator4.color = [UIColor blueColor];
    self.indicator5.color = [UIColor redColor];
    self.indicator6.color = [UIColor greenColor];
}


- (IBAction)customIndicatorStart:(id)sender
{
    [self showIndicator];
    [self performSelector:@selector(hideIndicator) withObject:nil afterDelay:3];
}

- (void)showIndicator
{
    if (!indicatorView) {
        
        baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        baseView.backgroundColor = [UIColor clearColor];
        
        indicatorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        indicatorView.backgroundColor = [UIColor blackColor];
        indicatorView.alpha = 0.0f;
        indicatorView.layer.cornerRadius = 10.0f;
        indicatorView.center = baseView.center;
        
        indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicator.center = baseView.center;
        indicator.alpha = 0.0f;
        
        [self addSubview:baseView];
        [self addSubview:indicatorView];
        [self addSubview:indicator];
    }
    
    
    baseView.hidden = NO;
    indicatorView.hidden = NO;
    indicator.hidden = NO;
    [indicator startAnimating];
    
    [UIView animateWithDuration:0.5f animations:^{
        indicatorView.alpha = 0.6f;
        indicator.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
        
    }];
}

- (void)hideIndicator
{
    [UIView animateWithDuration:0.5f animations:^{
        indicatorView.alpha = 0.0f;
        indicator.alpha = 0.0f;
    } completion:^(BOOL finished) {
        
        baseView.hidden = YES;
        indicatorView.hidden = YES;
        indicator.hidden = YES;
        [indicator stopAnimating];
        
    }];
}


@end
