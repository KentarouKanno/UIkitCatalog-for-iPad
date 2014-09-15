//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property (strong, nonatomic) IBOutlet UIProgressView *progress1;
@property (strong, nonatomic) IBOutlet UIProgressView *progress2;
@property (strong, nonatomic) IBOutlet UIView *hideView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *DLindicator;
@property (weak, nonatomic) IBOutlet UIProgressView *progress3;

+ (instancetype)LoadFromNib;

- (IBAction)downLoadBtn:(id)sender;

@end
