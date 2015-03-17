//
//  EMPhotoCell.h
//  EMTableView
//
//  Created by Adward on 15/3/17.
//  Copyright (c) 2015年 iDouKou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMPhoto.h"

@interface EMPhotoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desp;
+(UINib *)nib;
-(void)configureCellForPhoto:(EMPhoto *)photo;
-(void)setDeleteBlock:(void (^)(EMPhotoCell *cell))block;
@end
