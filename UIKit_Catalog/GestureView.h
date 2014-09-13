//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureView : UIView <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRight;

@property (strong, nonatomic) IBOutlet UILabel *gestureLabel;

+ (id)LoadFromNib;

@end


