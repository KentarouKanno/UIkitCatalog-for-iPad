//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchView : UIView

@property (strong, nonatomic) IBOutlet UISwitch *defaultSwitch;
@property (strong, nonatomic) IBOutlet UILabel *OnOffLabel;

+ (id)LoadFromNib;
- (IBAction)switchChange:(id)sender;

@end
