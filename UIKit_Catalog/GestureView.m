//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "GestureView.h"


@implementation GestureView


+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"GestureView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self labelUpDate:@"Shake"];
}
- (IBAction)pinchGesture:(id)sender
{
    [self labelUpDate:@"Pinch"];
}
- (IBAction)rotationGesture:(id)sender
{
    [self labelUpDate:@"Rotation"];
}
- (IBAction)panGesture:(id)sender
{
    [self labelUpDate:@"Pan"];
}
- (IBAction)lognPressGesture:(UIGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        [self labelUpDate:@"LongPress"];
    }
}

- (IBAction)tapOne:(id)sender
{
    [self labelUpDate:@"Tap One"];
}
- (IBAction)tapTwo:(id)sender
{
    [self labelUpDate:@"Tap Two"];
}
- (IBAction)tapThree:(id)sender
{
    [self labelUpDate:@"Tap Three"];
}
- (IBAction)tapFour:(id)sender
{
    [self labelUpDate:@"Tap Four"];
}
- (IBAction)tapFive:(id)sender
{
    [self labelUpDate:@"Tap Five"];
}

- (IBAction)swipeRight:(id)sender
{
    [self labelUpDate:@"Swipe Right"];
}
- (IBAction)swipeLeft:(id)sender
{
    [self labelUpDate:@"Swipe Left"];
}
- (IBAction)swipeUp:(id)sender
{
    [self labelUpDate:@"Swipe Up"];
}
- (IBAction)swipeDown:(id)sender
{
    [self labelUpDate:@"Swipe Down"];
}

- (void)labelUpDate:(NSString*)str
{
    self.gestureLabel.text = str;
    [self performSelector:@selector(labelClear) withObject:Nil afterDelay:0.15];
}

- (void)labelClear
{
    self.gestureLabel.text = @"";
}

@end
