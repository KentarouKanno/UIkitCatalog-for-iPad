//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StringSizeView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *abcLabel;
@property (strong, nonatomic) IBOutlet UITableView *fontTableView;

+ (id)LoadFromNib;

@end
