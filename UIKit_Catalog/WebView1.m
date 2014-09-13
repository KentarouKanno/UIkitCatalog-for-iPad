//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "WebView1.h"

@implementation WebView1

+ (instancetype)LoadFromNib
{
    WebView1 *view = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:nil options:nil][0];
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

// webViewDidStartLoadより先に呼ばれる NOを返すとリンク先に飛ばない
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{

    // リンク先によって処理を分けるならここで書く
    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView*)webView
{
    // Statue Bar のインジケーター表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView*)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    
    _webV.canGoBack?    [_backBtn setEnabled:YES]    : [_backBtn setEnabled:NO];
    _webV.canGoForward? [_forwardBtn setEnabled:YES] : [_forwardBtn setEnabled:NO];
    
    
    // WebViewが初期表示時に拡大表示される対応
    CGSize contentSize = _webV.scrollView.contentSize;
    CGSize viewSize = _webV.frame.size;
    
    float scale = viewSize.width / contentSize.width;
    if (scale < 0.9) {
        NSLog(@"Zoom out fix for web view: %f", scale);
        _webV.scrollView.zoomScale = scale;
    }
}


@end
