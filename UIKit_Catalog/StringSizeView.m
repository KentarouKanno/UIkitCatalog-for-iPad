//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "StringSizeView.h"

@implementation StringSizeView
{
    NSMutableArray *fontArray;
}

+ (id)LoadFromNib
{
    UIView *view = [[UINib nibWithNibName:@"StringSizeView" bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    fontArray = [NSMutableArray arrayWithCapacity:0];
    
    // font一覧を取得
    NSMutableString *str = @"".mutableCopy;
    for (NSString *familyName in [UIFont familyNames]) {
        [str appendFormat:@"%@\n", familyName];
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            [str appendFormat:@"%@\n", fontName];
            [fontArray addObject:fontName];
        }
    }
   // NSLog(@"%@", str);
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fontArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
	NSString *fontName = fontArray[indexPath.row];
    
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName size:cell.textLabel.font.pointSize];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.abcLabel.font = [UIFont fontWithName:fontArray[indexPath.row] size:19];
}


@end
