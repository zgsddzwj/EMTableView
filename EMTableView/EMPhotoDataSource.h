//
//  EMPhotoDataSource.h
//  EMTableView
//
//  Created by Adward on 15/3/17.
//  Copyright (c) 2015年 iDouKou. All rights reserved.
//
typedef void(^TableViewCellConfigureBlock)(id cell, id item);
#import <UIKit/UIKit.h>

@interface EMPhotoDataSource : NSObject<UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic ,copy) TableViewCellConfigureBlock configureBlock;

-(id)initWithItems:(NSMutableArray *)anItems
    cellIdentifier:(NSString *)aCellIdentifier
configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

-(id)itemAtIndexPath:(NSIndexPath *)indexPath;

-(void)deleteAnItem:(id)item;

-(void)addANewItem:(id)newItem;

- (void)deleteItemAtIndexPath:(NSIndexPath *)path;

@end
