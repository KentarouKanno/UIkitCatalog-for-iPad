//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "WebView1.h"

@implementation WebView1

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"WebView1" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    
    // PDF画面
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"sample"withExtension:@"pdf"];
    NSURLRequest* req = [NSURLRequest requestWithURL:url];
    [self.pdfV loadRequest:req];
    
    // Web画面
    NSURL *URL = [NSURL URLWithString:@"http://www.apple.com/jp/"];
    NSURLRequest *URLreq = [NSURLRequest requestWithURL:URL];
    [self.webV loadRequest: URLreq];
    
}


- (IBAction)back:(id)sender
{
    if (self.webV.canGoBack) {
        [self.webV goBack];
    }
}

- (IBAction)reload:(id)sender
{
    [self.webV reload];
}

- (IBAction)forward:(id)sender
{
    if (self.webV.canGoForward) {
        [self.webV goForward];
    }
}

-(void)webViewDidStartLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    if (self.webV.canGoBack) {
        self.backBtn.enabled = YES;
    } else {
        self.backBtn.enabled = NO;
    }
    
    if (self.webV.canGoForward) {
        self.forwardBtn.enabled = YES;
    } else {
        self.forwardBtn.enabled = NO;
    }

}

@end
