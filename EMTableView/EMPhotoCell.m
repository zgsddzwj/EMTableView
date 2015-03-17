//
//  EMPhotoCell.m
//  EMTableView
//
//  Created by Adward on 15/3/17.
//  Copyright (c) 2015年 iDouKou. All rights reserved.
//

#import "EMPhotoCell.h"
@interface EMPhotoCell(){
    void(^_deleteBlock)(EMPhotoCell * cell);
}
@end

@implementation EMPhotoCell

- (void)awakeFromNib {
    // Initialization code
}

+(UINib *)nib{
    return [UINib nibWithNibName:@"EMPhotoCell" bundle:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDeleteBlock:(void (^)(EMPhotoCell *cell))block{
    _deleteBlock = block;
}

-(void)configureCellForPhoto:(EMPhoto *)photo{
    _name.text = photo.name;
    _desp.text = photo.desp;
}
- (IBAction)deleteMe:(id)sender {
    if (_deleteBlock) {
        _deleteBlock(self);
    }
}

@end
