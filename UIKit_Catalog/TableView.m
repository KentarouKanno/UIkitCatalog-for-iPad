//
//  SliderView.m
//  UIKit_Catalog
//
//  Created by KentarOu on 2013/12/07.
//  Copyright (c) 2013年 KentarOu. All rights reserved.
//

#import "TableView.h"

@interface TableView()
{
    NSArray *sectionList;
    
    UIRefreshControl *refreshControl;
    UIRefreshControl *refreshControl2;
}

@property (weak, nonatomic) IBOutlet UITableView *defaultTable;
@property (weak, nonatomic) IBOutlet UITableView *value1Table;
@property (weak, nonatomic) IBOutlet UITableView *value2Table;
@property (weak, nonatomic) IBOutlet UITableView *subtitleTable;

@end

@implementation TableView




+ (instancetype)LoadFromNib
{
    TableView *view = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:nil options:nil][0];
    return view;
}

-(void)awakeFromNib
{
    _defaultTable.delegate = self;
    _defaultTable.dataSource = self;
    
    _value1Table.delegate = self;
    _value1Table.dataSource = self;
    
    _value2Table.delegate = self;
    _value2Table.dataSource = self;
    
    _subtitleTable.delegate = self;
    _subtitleTable.dataSource = self;
    
    _value1Table.layer.borderColor = [[UIColor redColor]CGColor];
    _value1Table.layer.borderWidth = 1.0f;
    _value1Table.layer.cornerRadius = 5.0f;
    _value1Table.layer.masksToBounds = YES;
    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 330, 50)];
    headerView.backgroundColor = [UIColor redColor];
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    headerLabel.text  = @"Header View";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.center = headerView.center;
    [headerView addSubview:headerLabel];
    
    _value1Table.tableHeaderView = headerView;

    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 330, 50)];
    footerView.backgroundColor = [UIColor redColor];
    
    UILabel *footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    footerLabel.text  = @"Footer View";
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.textColor = [UIColor whiteColor];
    footerLabel.center = footerView.center;
    [footerView addSubview:footerLabel];
    
    _value1Table.tableFooterView = footerView;

    
    
    // セクション名を設定する
    sectionList =  [NSArray arrayWithObjects:@"Section1",@"Section2",@"Section3",@"Section4",@"Section5", nil];
    
    UIRefreshControl *refreshC = [[UIRefreshControl alloc]init];
    
    // 更新アクションを設定
    [refreshC addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    /* 24時間表記 */
    dateFormatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    NSString *date24 = [dateFormatter stringFromDate:date];
    
    // UITableViewにUIRefreshControlを設定
    refreshControl = refreshC;
    refreshControl.attributedTitle =[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"更新:%@",date24]];
    [_value2Table addSubview:refreshControl];
    
    UIRefreshControl *refreshC2 = [[UIRefreshControl alloc]init];
    
    // 更新アクションを設定
    [refreshC2 addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    [refreshC2 setTintColor:[UIColor redColor]];
    // UITableViewにUIRefreshControlを設定
    refreshControl2 = refreshC2;
    [_value1Table addSubview:refreshControl2];
}

- (void)onRefresh:(id)sender
{
    // 更新開始
    [refreshControl beginRefreshing];
    [refreshControl2 beginRefreshing];
    
    // 更新処理をここに記述
    
    // 更新終了
    [refreshControl endRefreshing];
    [refreshControl2 endRefreshing];
}

// セクション名を返す
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionList objectAtIndex:section];
}

// Sectionのカウントを返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionList count];
}

// Rowのカウントを返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    
    if (tableView.tag == 0) {
        
        // UITableViewCellStyleDefault
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else if(tableView.tag == 1){
        
        // UITableViewCellStyleValue1
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor redColor];
        bgColorView.layer.masksToBounds = YES;
        cell.selectedBackgroundView = bgColorView;
        
    } else if(tableView.tag == 2){
        
        // UITableViewCellStyleValue2
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        cell.backgroundColor = [UIColor colorWithRed:0.828 green:1.000 blue:0.981 alpha:1.000];
        
    } else if(tableView.tag == 3){
        
        // UITableViewCellStyleSubtitle
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"index.row = %ld",indexPath.row];
    cell.detailTextLabel.text = @"subtitle";
    
    if (indexPath.row > 2) {
        cell.imageView.image = [ UIImage imageNamed:@"image1.jpg" ];
    }
    return cell;
}



@end
