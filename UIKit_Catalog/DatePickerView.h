//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerView : UIView

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *label4;

@property (strong, nonatomic) IBOutlet UIDatePicker *picker1;
@property (strong, nonatomic) IBOutlet UIDatePicker *picker2;
@property (strong, nonatomic) IBOutlet UIDatePicker *picker3;
@property (strong, nonatomic) IBOutlet UIDatePicker *picker4;

+ (id)LoadFromNib;

- (IBAction)picker1:(id)sender;
- (IBAction)picker2:(id)sender;
- (IBAction)picker3:(id)sender;
- (IBAction)picker4:(id)sender;


@end
