//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonSizeView : UIView

@property (strong, nonatomic) IBOutlet UILabel *displayLabel;

+ (id)LoadFromNib;
- (IBAction)pushBtn:(id)sender;

@end
