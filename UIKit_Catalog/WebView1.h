//
//  SliderView.h
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebView1 : UIView <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UIButton *forwardBtn;
@property (strong, nonatomic) IBOutlet UIWebView *webV;
@property (strong, nonatomic) IBOutlet UIWebView *pdfV;

- (IBAction)back:(id)sender;
- (IBAction)reload:(id)sender;
- (IBAction)forward:(id)sender;

+ (instancetype)LoadFromNib;

@end
