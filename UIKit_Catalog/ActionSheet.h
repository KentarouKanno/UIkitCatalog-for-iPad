//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionSheet : UIView <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UILabel *selectLabel1;
@property (strong, nonatomic) IBOutlet UILabel *selectLabel2;
@property (strong, nonatomic) IBOutlet UILabel *selectLabel3;

+ (instancetype)LoadFromNib;

@end
