//
//  GTableDelegate.h
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-5.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

/**
 *  UITableView的代理类，本类设计的作用是为了给TableView的主类减负，让TableView的控制器类只专注于做逻辑管理，而把一些繁复的工作交给本类来完成。
 本类配合OTableViwDataSource和OCell，将TableView的dataSource和delegate两个代理分离，将本来需要在一个类里实现的任务，分解到三个类里，成功的让TableView的控制器的变得简单易理解和管理。
 
 以下定义了4个个配置cell的block:
 
 typedef CGFloat (^CellHeightBlock) (NSIndexPath *indexPath)
 
 在这里，根据indexPath，设置该路径的cell的高度。
 
 typedef void (^SelectCellBlock) (NSIndexPath *indexPath, id data)
 */


//配置路径下的cell高
typedef CGFloat (^CellHeightBlock) (NSIndexPath *indexPath);

//选中某行时的block
typedef void (^SelectCellBlock) (NSIndexPath *indexPath, id data);



@interface GTableDelegate : NSObject<UITableViewDelegate>

///数据源，由数据模型给定，与DataSource一致
@property (strong, nonatomic) NSMutableArray    *tableData;
/// 先中某一行时，调用的代理，具体见类定义说明
@property (copy, nonatomic) SelectCellBlock     selectCell;
///如果没有设置，则为默认的44高，具体见类定义说明
@property (copy, nonatomic) CellHeightBlock     cellHeight;


@end