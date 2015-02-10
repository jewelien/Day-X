//
//  ListTableVIewDataSource.m
//  DayX
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableVIewDataSource.h"
#import "Entry.h"

@implementation ListTableVIewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Entry loadEntriesFromDefaults].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [Entry loadEntriesFromDefaults][indexPath.row];
    return cell;
}


-(void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}





@end
