//
//  ViewController.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "ViewController.h"
#import "SliderView.h"
#import "StepperView.h"
#import "StringSizeView.h"
#import "ButtonSizeView.h"
#import "TextFieldView.h"
#import "IndicatorView.h"
#import "SwitchView.h"
#import "PageControlView.h"
#import "ScrollView.h"
#import "TextView.h"
#import "WebView1.h"
#import "DatePickerView.h"
#import "SegmentedControlView.h"
#import "PickerView.h"
#import "MapView.h"
#import "ProgressView.h"
#import "AlertView.h"
#import "ActionSheet.h"
#import "GestureView.h"

@interface ViewController ()
{
    NSMutableArray *viewArray;
    UIView *grayBackView;
    
    UIView *selectView;
    
    //UIkit View
    SliderView *slider;
    StepperView *stepper;
    StringSizeView *stringSize;
    ButtonSizeView *buttonSize;
    TextFieldView *textField;
    IndicatorView *indicator;
    SwitchView *switchV;
    PageControlView *pageControl;
    ScrollView *scroll;
    TextView *textV;
    WebView1 *webV;
    DatePickerView *datePicker;
    SegmentedControlView *segmentedC;
    PickerView *picker;
    MapView *map;
    ProgressView *progress;
    AlertView *alert;
    ActionSheet *action;
    GestureView *gesture;
}

@end


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIView *view in self.baseView.subviews) {
        if ([view isKindOfClass:[UIButton class]])
        {
            view.exclusiveTouch = YES;
            view.multipleTouchEnabled = YES;
        }
    }
    
    selectView = [[UIView alloc]init];
    self.navigationItem.title = @"UIKit Catalog";
    [self.view bringSubviewToFront:self.grayHideView];
}



#pragma mark- Button Action
- (IBAction)viewOpen:(id)sender
{
    
    switch (((UIButton*)sender).tag) {
        case 0:
            // SliderView [0]
            slider = [SliderView LoadFromNib];
            selectView = slider;
            break;
        case 1:
            // StepperView [1]
            stepper = [StepperView LoadFromNib];
            selectView = stepper;
            break;
        case 2:
            // StringSizeView [2]
            stringSize = [StringSizeView LoadFromNib];
            selectView =  stringSize;
            break;
        case 3:
            // ButtonSizeView [3]
            buttonSize = [ButtonSizeView LoadFromNib];
            selectView = buttonSize;
            break;
        case 4:
            // TextFieldView [4]
            textField = [TextFieldView LoadFromNib];
            textField.layer.masksToBounds = YES;
            selectView = textField;
            break;
        case 5:
            // IndicatorView [5]
            indicator = [IndicatorView LoadFromNib];
            selectView = indicator;

            break;
        case 6:
            // SwitchView [6]
            switchV = [SwitchView LoadFromNib];
            selectView = switchV;
            break;
        case 7:
            // PageControlView [7]
            pageControl = [PageControlView LoadFromNib];
            selectView = pageControl;
            break;
        case 8:
            // ScrollView [8]
            scroll = [ScrollView LoadFromNib];
            selectView = scroll;
            break;
        case 9:
            // TextView [9]
            textV = [TextView LoadFromNib];
            selectView = textV;
            break;
        case 10:
            // WebView [10]
            webV = [WebView1 LoadFromNib];
            selectView = webV;
            break;
        case 11:
            // DatePickerView [11]
            datePicker = [DatePickerView LoadFromNib];
            selectView = datePicker;
            break;
        case 12:
            // SegmentedControl [12]
            segmentedC = [SegmentedControlView LoadFromNib];
            selectView = segmentedC;
            break;
        case 13:
            // PickerView [13]
            picker = [PickerView LoadFromNib];
            selectView = picker;
            break;
        case 14:
            // MapView [14]
            map = [MapView LoadFromNib];
            selectView = map;
            break;
        case 15:
            // ProgressView [15]
            progress = [ProgressView LoadFromNib];
            selectView = progress;
            break;
        case 16:
            // AlertView [16]
            alert = [AlertView LoadFromNib];
            selectView = alert;
            break;
        case 17:
            // ActionSheet [17]
            action = [ActionSheet LoadFromNib];
            selectView = action;
            break;
        case 18:
            // GestureView [18]
            gesture = [GestureView LoadFromNib];
            selectView = gesture;
            break;

        default:
            break;
    }
    
    selectView.center = self.view.center;
    [self.view addSubview:selectView];
    
    [UIView animateWithDuration:0.4f
                     animations:^{
                         
                         selectView.alpha = 1.0f;
                         self.grayHideView.alpha = 0.85f;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
}




// View Close
- (void)removeView
{
    
    [UIView animateWithDuration:0.4f
                     animations:^{
                         
                         selectView.alpha = 0.0f;
                         self.grayHideView.alpha = 0.0f;
                     }
                     completion:^(BOOL finished){
                         
                         [selectView removeFromSuperview];
                     }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    if([event touchesForView:selectView]) {
        NSLog(@"SelectView");
        return;
    }
    
    UITouch *touch = [touches anyObject];
    
    if(touch.view.tag == 99)
    {
        [self removeView];
    }
}

@end
