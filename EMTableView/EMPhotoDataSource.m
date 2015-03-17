//
//  EMPhotoDataSource.m
//  EMTableView
//
//  Created by Adward on 15/3/17.
//  Copyright (c) 2015年 iDouKou. All rights reserved.
//

#import "EMPhotoDataSource.h"
#import <UIKit/UIKit.h>

@implementation EMPhotoDataSource

-(id)initWithItems:(NSMutableArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureBlock = aConfigureCellBlock;
    }
    return self;
}

-(id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return self.items[(NSUInteger)indexPath.row];
}

-(void)addANewItem:(id)newItem{
    NSMutableArray *subsourceArray = self.items;
    [subsourceArray addObject:newItem];
}

-(void)deleteAnItem:(id)item{
    [self.items removeObject:item];
}

- (void)deleteItemAtIndexPath:(NSIndexPath *)path {
    NSMutableArray *subsourceArray = self.items;
    [subsourceArray removeObjectAtIndex:path.row];
}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item);
    return cell;
}


@end
