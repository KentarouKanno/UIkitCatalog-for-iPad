//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "ActionSheet.h"


#define VERSION_CHECK NSClassFromString(@"UIAlertController")

@implementation ActionSheet
{
    
    UIAlertController *actionSheetController;
    __weak IBOutlet UIButton *Button1;
    __weak IBOutlet UIButton *Button2;
    __weak IBOutlet UIButton *Button3;
    
}


// nibファイルからの読み込み
+ (instancetype)LoadFromNib
{
    ActionSheet *view = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}


-(void)awakeFromNib
{
   
}

- (IBAction)actionSheetBtn1:(id)sender
{
    if(VERSION_CHECK) {
        
        // UIAlertControllerを使ってアクションシートを表示(iOS8)
        actionSheetController = [UIAlertController alertControllerWithTitle:@"Default"
                                                                    message:nil
                                                             preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheetController addAction:[UIAlertAction actionWithTitle:@"Select1"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction *action) {
                                                                    
                                                                    // 「Select1」ボタンが押された時の処理
                                                                    self.selectLabel1.text =@"Select1";
                                                                    
                                                                }]];
        
        [actionSheetController addAction:[UIAlertAction actionWithTitle:@"Select2"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction *action) {
                                                                    
                                                                    // 「Select2」ボタンが押された時の処理
                                                                    self.selectLabel1.text =@"Select2";
                                                                    
                                                                }]];
        
        [actionSheetController addAction:[UIAlertAction actionWithTitle:@"RedButton"
                                                                  style:UIAlertActionStyleDestructive
                                                                handler:^(UIAlertAction *action) {
                                                                    
                                                                    // 「RedButton」ボタンが押された時の処理
                                                                    self.selectLabel1.text =@"RedButton";
                                                                    
                                                                }]];
        
        // ユニバーサルアプリかiPadアプリの場合は、
        // UIPopoverPresentationControllerを使った以下のコードが無いと落ちてしまうので注意
        // （このコードがあっても、iPhoneでの実行時には何も変化なし）
        actionSheetController.modalPresentationStyle = UIModalPresentationPopover;
        UIPopoverPresentationController *pop = actionSheetController.popoverPresentationController;
        pop.sourceView = Button1;
        pop.sourceRect = Button1.bounds;
        
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:actionSheetController animated:YES completion:nil];
        
    } else {
    
        // iPadではCancelボタンは表示されない(ポップオーバーの外側をタップすればアクションシートを消せるため)
        // iOS Human Interface Guidelines ↓
        // https://developer.apple.com/jp/devcenter/ios/library/documentation/UserExperience/Conceptual/MobileHIG/Alerts/Alerts.html#//apple_ref/doc/uid/TP40006556-CH14-SW36
        
        UIActionSheet *actionSheet =[[UIActionSheet alloc]
                                     initWithTitle:@"Default"
                                     delegate:self
                                     cancelButtonTitle:@"Cancel"
                                     destructiveButtonTitle:@"RedButton"
                                     otherButtonTitles:@"Select1",@"Select2", nil];
        actionSheet.tag = 0;
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        
        // アクションシートを出す場所を指定する
        [actionSheet showFromRect:Button1.frame inView:self animated:YES];
    }
}

- (IBAction)actionSheetBtn2:(id)sender
{
    UIActionSheet *actionSheet =[[UIActionSheet alloc]
                                 initWithTitle:@"BlackOpaque"
                                 delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 destructiveButtonTitle:@"RedButton"
                                 otherButtonTitles:@"Select1",@"Select2",@"Select3", nil];
    
    actionSheet.tag = 1;
    actionSheet.actionSheetStyle = UIBarStyleBlackOpaque;
    
    // アクションシートを出す場所を指定する
    [actionSheet showFromRect:Button2.frame inView:self animated:YES];
}
- (IBAction)actionSheetBtn3:(id)sender
{
    UIActionSheet *actionSheet =[[UIActionSheet alloc]
                                 initWithTitle:@"Translucent"
                                 delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 destructiveButtonTitle:@"RedButton"
                                 otherButtonTitles:@"Select1",@"Select2",@"Select3",@"Select4", nil];
    
    actionSheet.tag = 2;
    actionSheet.actionSheetStyle = UIBarStyleBlackTranslucent;
   
    // アクションシートを出す場所を指定する
    [actionSheet showFromRect:Button3.frame inView:self animated:YES];
}

#pragma mark- UIActionSheet Delegate

// アクションシートのボタンが押された時に呼ばれる
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 0) {
        switch (buttonIndex) {
            case 0:
                self.selectLabel1.text =@"RedButton";
                break;
            case 1:
                self.selectLabel1.text =@"Select1";
                break;
            case 2:
                self.selectLabel1.text =@"Select2";
                break;
                
            default:
                break;
        }
    }
    
    if (actionSheet.tag == 1) {
        switch (buttonIndex) {
            case 0:
                self.selectLabel2.text =@"RedButton";
                break;
            case 1:
                self.selectLabel2.text =@"Select1";
                break;
            case 2:
                self.selectLabel2.text =@"Select2";
                break;
            case 3:
                self.selectLabel2.text =@"Select3";
                break;
                
            default:
                break;
        }
    }
    
    if (actionSheet.tag == 2) {
        switch (buttonIndex) {
            case 0:
                self.selectLabel3.text =@"RedButton";
                break;
            case 1:
                self.selectLabel3.text =@"Select1";
                break;
            case 2:
                self.selectLabel3.text =@"Select2";
                break;
            case 3:
                self.selectLabel3.text =@"Select3";
                break;
            case 4:
                self.selectLabel3.text =@"Select4";
                break;
                
            default:
                break;
        }
    }
}


- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    
}


// アクションシートが開く前に呼ばれる
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    NSLog(@"willPresentActionSheet: ------ アクションシートが開く前に呼ばれる");
}

// アクションシートが開いた後に呼ばれる
- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    NSLog(@"didPresentActionSheet: ------ アクションシートが開いた後に呼ばれる");
}

// アクションシートが閉じる前に呼ばれる
- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"willDismissWithButtonIndex: ------ アクションシートが閉じる前に呼ばれる");
}

// アクションシートが閉じた後に呼ばれる
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"didDismissWithButtonIndex: ------ アクションシートが閉じた後に呼ばれる");
}




@end
