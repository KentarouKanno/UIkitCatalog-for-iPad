//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "TextView.h"

@implementation TextView


+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"TextView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    
    NSString *str = @"NSAttributedString Sample";
    NSMutableAttributedString *attrStr;
    attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    // フォント
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont fontWithName:@"Futura-CondensedMedium" size:17.]
                    range:NSMakeRange(0, [attrStr length])];
    
    // 背景色
    [attrStr addAttribute:NSBackgroundColorAttributeName
                    value:[UIColor colorWithRed:1. green:1. blue:.0 alpha:1.]
                    range:NSMakeRange(0, [attrStr length])];
    
    // 打ち消し線
    [attrStr addAttribute:NSStrikethroughStyleAttributeName
                    value:[NSNumber numberWithInt:3]
                    range:[str rangeOfString:@"Sample"]];
    
   // [self.attributedTextView setAttributedText:attrStr];
}

#pragma mark- UITextView Delegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}



@end
