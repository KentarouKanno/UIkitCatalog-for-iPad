//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "AlertView.h"

#define VERSION_CHECK NSClassFromString(@"UIAlertController")


@implementation AlertView
{
    UIAlertView *alert;
    UIAlertController *alertController;
    
    __weak IBOutlet UILabel *alert3textLabel;
    __weak IBOutlet UILabel *alert4textLabel;
    __weak IBOutlet UILabel *alert5LoginTextLabel;
    __weak IBOutlet UILabel *alert5PasswardTextLabel;
}



// ViewをNibファイルから読み込む
+ (instancetype)LoadFromNib
{
    AlertView *view = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}


-(void)awakeFromNib
{
    // ホームボタンが押された時にアラートを閉じる通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)willResignActive:(NSNotificationCenter*)notify
{
    [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
    [alertController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)alertBtn1:(id)sender
{
    
    if(VERSION_CHECK) {
        
        // UIAlertControllerを使ってアラートを表示(iOS8)
        alertController = [UIAlertController alertControllerWithTitle:@"確認"
                                                              message:@"実行しますか？"
                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"はい"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              // 「はい」ボタンが押された時の処理
                                                              self.alertLabel.text = @"はい";
                                                              
                                                          }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              // 「いいえ」ボタンが押された時の処理
                                                              self.alertLabel.text = @"いいえ";
                                                              
                                                          }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"キャンセル"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              // 「キャンセル」ボタンが押された時の処理
                                                              self.alertLabel.text = @"キャンセル";
                                                              
                                                          }]];
        
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];
        
    } else {
        
        // UIAlertViewを使ってアラートを表示(iOS7)
        alert = [[UIAlertView alloc]initWithTitle:@"確認"
                                          message:@"実行しますか？"
                                         delegate:self
                                cancelButtonTitle:@"キャンセル"
                                otherButtonTitles:@"はい", @"いいえ", nil];
        alert.tag = 1;
        [alert show];

    }
}

- (IBAction)alertBtn2:(id)sender
{
    if(VERSION_CHECK) {
        
        // UIAlertControllerを使ってアラートを表示(iOS8)
        alertController = [UIAlertController alertControllerWithTitle:@"実行"
                                                              message:@"コピーしました"
                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];
        [self performSelector:@selector(autoClose) withObject:nil afterDelay:2.5];

    } else {
    
    // UIAlertViewを使ってアラートを表示(iOS7)
    alert = [[UIAlertView alloc] initWithTitle:@"実行"
                                        message:@"コピーしました"
                                       delegate:self
                                           cancelButtonTitle:nil
                                           otherButtonTitles:nil];
    alert.tag = 2;
    [alert show];
    
    [self performSelector:@selector(autoClose) withObject:nil afterDelay:2.5];
        
    }
}


- (IBAction)alertBtn3:(id)sender
{
    if (VERSION_CHECK) {
        
        __block UITextField *alert3TextField = [[UITextField alloc]init];
        
        // UIAlertControllerを使ってアラートを表示(iOS8)
        alertController = [UIAlertController alertControllerWithTitle:@"入力"
                                                              message:@"テキストを入力してください"
                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
        {
            textField.placeholder = @"入力してください";
            alert3TextField = textField;
        }];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              alert3textLabel.text = [alert3TextField text];
                                                          }]];
        
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];
        
    } else {
        
        // UIAlertViewを使ってアラートを表示(iOS7)
        alert = [[UIAlertView alloc]initWithTitle:@"入力"
                                          message:@"テキストを入力してください"
                                         delegate:self
                                cancelButtonTitle:nil
                                otherButtonTitles:@"OK", nil];
        
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        alert.tag = 3;
        [alert show];
    }
}


- (IBAction)alertBtn4:(id)sender
{
    if (VERSION_CHECK) {
        
        __block UITextField *alert4TextField = [[UITextField alloc]init];
        
        // UIAlertControllerを使ってアラートを表示(iOS8)
        alertController = [UIAlertController alertControllerWithTitle:@"パスワード"
                                                              message:@"パスワードを入力してください。"
                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
         {
             textField.placeholder = @"パスワードを入力してください";
             textField.secureTextEntry = YES;
             alert4TextField = textField;
         }];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              alert4textLabel.text = [alert4TextField text];
                                                          }]];
        
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];
        
    } else {
        
        // UIAlertViewを使ってアラートを表示(iOS7)
        alert = [[UIAlertView alloc]initWithTitle:@"パスワード"
                                          message:@"パスワードを入力してください。"
                                         delegate:self
                                cancelButtonTitle:nil
                                otherButtonTitles:@"OK",nil];
        
        alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
        alert.tag = 4;
        [alert show];
    }
}


- (IBAction)alertBtn5:(id)sender
{
    
    if (VERSION_CHECK) {
        
        __block UITextField *alert5LoginTextField = [[UITextField alloc]init];
        __block UITextField *alert5PasswordTextField = [[UITextField alloc]init];
        
        // UIAlertControllerを使ってアラートを表示(iOS8)
        alertController = [UIAlertController alertControllerWithTitle:@"入力"
                                                              message:@"IDとPasswardを入力してください。"
                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
         {
             textField.placeholder = @"IDを入力してください";
             alert5LoginTextField = textField;
         }];
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
         {
             textField.placeholder = @"Passwordを入力してください";
             textField.secureTextEntry = YES;
             alert5PasswordTextField = textField;
         }];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              
                                                              alert5LoginTextLabel.text = [alert5LoginTextField text];
                                                              alert5PasswardTextLabel.text = [alert5PasswordTextField text];
                                                          }]];
        
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:nil];
        
    } else {
        
        // UIAlertViewを使ってアラートを表示(iOS7)
        alert = [[UIAlertView alloc]initWithTitle:@"入力"
                                          message:@"IDとPasswardを入力してください。"
                                         delegate:self
                                cancelButtonTitle:nil
                                otherButtonTitles:@"OK",nil];
        
        alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
        alert.tag = 5;
        [alert show];
        
    }
}


-(void)autoClose
{
    [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
    [alertController dismissViewControllerAnimated:YES completion:nil];
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
