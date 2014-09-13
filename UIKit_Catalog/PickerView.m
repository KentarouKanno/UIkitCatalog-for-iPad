//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "PickerView.h"

@implementation PickerView
{
    NSArray *dataArray1;
}

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"PickerView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    dataArray1 = @[@"image0.jpg",@"image1.jpg",@"image2.jpg"];
    self.selectTextLabel.text = [NSString stringWithFormat:@"1列目:0行目\n\n2列目:0行目\n\n3列目:0行目"];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerView.tag == 0) {
        return 1;
    } else {
        return 3;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 0) {
        return 3;
    } else {
        return 5;
    }
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (pickerView.tag == 0) {
        switch (component) {
            case 0:
                return 200.0;
                break;
                
            default:
                return 0;
                break;
        }
    } else {
        
        switch (component) {
            case 0:
                return 50.0;
                break;
                
            case 1:
                return 100.0;
                break;
                
            case 2:
                return 150.0;
                break;
                
            default:
                return 0;
                break;
        }
    }
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 0) {
        switch (component) {
            case 0:
                return dataArray1[row];
                break;
                
            case 1:
                return dataArray1[row];
                break;
                
            case 2:
                return dataArray1[row];
                break;
                
            default:
                return 0;
                break;
        }
    } else {
        switch (component) {
            case 0:
                return [NSString stringWithFormat:@"%ld", (long)row];
                break;
                
            case 1:
                return [NSString stringWithFormat:@"%ld行目", (long)row];
                break;
                
            case 2:
                return [NSString stringWithFormat:@"%ld列-%ld行", (long)component, (long)row];
                break;
                
            default:
                return 0;
                break;
        }
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 0) {
        NSInteger val0 = [pickerView selectedRowInComponent:0];
        
        switch (val0) {
            case 0:
                self.selectImageView.image = [UIImage imageNamed:dataArray1[0]];
                break;
            case 1:
                self.selectImageView.image = [UIImage imageNamed:dataArray1[1]];
                break;
            case 2:
                self.selectImageView.image = [UIImage imageNamed:dataArray1[2]];
                break;
                
            default:
                break;
        }
    } else {
        NSInteger val0 = [pickerView selectedRowInComponent:0];
        NSInteger val1 = [pickerView selectedRowInComponent:1];
        NSInteger val2 = [pickerView selectedRowInComponent:2];
        
        self.selectTextLabel.text = [NSString stringWithFormat:@"1列目:%ld行目\n\n2列目:%ld行目\n\n3列目:%ld行目",(long)val0,(long)val1,(long)val2];
    }
}

@end
