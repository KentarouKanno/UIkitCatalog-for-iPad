//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView
{
    UIAlertView *alert;
    __weak IBOutlet UILabel *alert3textLabel;
    __weak IBOutlet UILabel *alert4textLabel;
    __weak IBOutlet UILabel *alert5LoginTextLabel;
    __weak IBOutlet UILabel *alert5PasswardTextLabel;
}



// ViewをNibファイルから読み込む
+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}


-(void)awakeFromNib
{
   
}

- (IBAction)alertBtn1:(id)sender
{
    alert = [[UIAlertView alloc]initWithTitle:@"確認"
                                       message:@"実行しますか？"
                                      delegate:self
                             cancelButtonTitle:@"キャンセル"
                             otherButtonTitles:@"はい", @"いいえ", nil];
    alert.tag = 1;
    [alert show];
}

- (IBAction)alertBtn2:(id)sender
{
    alert = [[UIAlertView alloc] initWithTitle:@"実行"
                                        message:@"コピーしました"
                                       delegate:self
                                           cancelButtonTitle:nil
                                           otherButtonTitles:nil
                           ];
    alert.tag = 2;
    [alert show];
    
    [self performSelector:@selector(autoClose) withObject:nil afterDelay:2.5];
}

- (IBAction)alertBtn3:(id)sender
{
    alert = [[UIAlertView alloc]initWithTitle:@"入力"
                                      message:@"テキストを入力してください"
                                     delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"OK", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 3;
    [alert show];
}


- (IBAction)alertBtn4:(id)sender
{
    alert = [[UIAlertView alloc]initWithTitle:@"パスワード"
                                      message:@"パスワードを入力してください。"
                                     delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"OK",nil];
    
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    alert.tag = 4;
    [alert show];
}


- (IBAction)alertBtn5:(id)sender
{
    alert = [[UIAlertView alloc]initWithTitle:@"入力"
                                      message:@"IDとPasswardを入力してください。"
                                     delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"OK",nil];
    
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alert.tag = 5;
    [alert show];
}


-(void)autoClose
{
    [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
}

#pragma mark- UIAlertView Delegate

// AlertViewのボタンが押された時に呼ばれる
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        switch (buttonIndex) {
            case 0:
                self.alertLabel.text = @"キャンセル";
                NSLog(@"キャンセル");
                break;
                
            case 1:
                self.alertLabel.text = @"はい";
                NSLog(@"はい");
                break;
                
            case 2:
                self.alertLabel.text = @"いいえ";
                NSLog(@"いいえ");
                break;
                
            default:
                break;
        }
    }
    
    if (alertView.tag == 2) {
        NSLog(@"Auto Close");
    }
    
    if (alertView.tag == 3) {
        
        alert3textLabel.text = [NSString stringWithFormat:@"Input Text :%@",[[alertView textFieldAtIndex:0] text]];
    }
    
    if (alertView.tag == 4) {
        alert4textLabel.text = [NSString stringWithFormat:@"Input Text :%@",[[alertView textFieldAtIndex:0] text]];
    }
    
    if (alertView.tag == 5) {
        alert5LoginTextLabel.text = [NSString stringWithFormat:@"Login Input Text :%@",[[alertView textFieldAtIndex:0] text]];
        alert5PasswardTextLabel.text = [NSString stringWithFormat:@"Password Input Text :%@",[[alertView textFieldAtIndex:1] text]];
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    
}

// AlertViewが表示される直前に呼ばれる
- (void)willPresentAlertView:(UIAlertView *)alertView
{
    NSLog(@"willPresentAlertView: ------ AlertViewが表示される直前に呼ばれる");
}

// AlertViewが表示された後に呼ばれる
- (void)didPresentAlertView:(UIAlertView *)alertView
{
    NSLog(@"didPresentAlertView: ------ AlertViewが表示された後に呼ばれる");
}

// AlertViewが閉じる直前に呼ばれる
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"willDismissWithButtonIndex: ------ AlertViewが閉じる直前に呼ばれる");
}

// AlertViewが閉じた後に呼ばれる
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"didDismissWithButtonIndex: ------ AlertViewが閉じた後に呼ばれる");
}

@end
