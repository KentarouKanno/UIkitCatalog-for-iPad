//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextView : UIView <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *attributedTextView;

+ (id)LoadFromNib;

@end
