//
//  GTableDelegate.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-5.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "GTableDelegate.h"


#import "GAppDefine.h"
#import "Category.h"

@implementation GTableDelegate

- (id)init
{
    self = [super init];
    if (self){
        //        self.tableItems = [NSMutableArray array];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeight){
        return self.cellHeight(indexPath);
    }
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = self.tableData[indexPath.row];
    self.selectCell(indexPath, item);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 1)];
    view.backgroundColor = kClearColor;
    return view;
}


@end
