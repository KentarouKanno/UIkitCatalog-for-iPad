//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : UIView

@property (strong, nonatomic) IBOutlet UILabel *alertLabel;

+ (instancetype)LoadFromNib;

- (IBAction)alertBtn1:(id)sender;
- (IBAction)alertBtn2:(id)sender;

@end
