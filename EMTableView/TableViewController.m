//
//  TableViewController.m
//  EMTableView
//
//  Created by Adward on 15/3/17.
//  Copyright (c) 2015年 iDouKou. All rights reserved.
//

#import "TableViewController.h"
#import "EMPhotoDataSource.h"
#import "EMPhotoCell.h"
#import "EMPhoto.h"

static NSString *const cellIdentifier = @"EMTableViewCellIdentifier";

@interface TableViewController ()
@property (nonatomic, strong) EMPhotoDataSource *photoDataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupViewInitilization];
    [self p_setupTableView];
}

-(void)p_setupViewInitilization{
    self.title = NSStringFromClass([self class]);
    [self p_setupRightBarButtonWithTitle:@"New"];
}

-(void)p_setupRightBarButtonWithTitle:(NSString *)title{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(self.view.frame.size.width - 60, 3, 60, 38);
    [rightButton setTitle:title forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton sizeToFit];
    [rightButton addTarget:self action:@selector(rightBarButtonPress) forControlEvents:UIControlEventTouchUpInside];
    rightButton.layer.cornerRadius = 5.0f;
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

-(void)rightBarButtonPress{
    [self p_addNewItem];
}

-(void)p_setupTableView{
    __weak TableViewController *weakSelf = self;
    TableViewCellConfigureBlock configureBlock = ^(EMPhotoCell *cell, EMPhoto *photo){
        [cell configureCellForPhoto:photo];
        [cell setDeleteBlock:^(EMPhotoCell *cell) {
            [weakSelf p_deleteCell:cell];
        }];
    };
#pragma mark -- test data
    NSMutableArray *newPhotos = [NSMutableArray array];
    for (int i =0; i < 15; i ++) {
        EMPhoto *photo = [[EMPhoto alloc]init];
        photo.name = [NSString stringWithFormat:@"photo_%d",i];
        photo.desp = [NSString stringWithFormat:@"photo_desp_%d",i];
        [newPhotos addObject:photo];
    }
#pragma mark --
    _photoDataSource = [[EMPhotoDataSource alloc]initWithItems:newPhotos
                                                cellIdentifier:cellIdentifier configureCellBlock:configureBlock];
    self.tableView.dataSource = _photoDataSource;
    [self.tableView registerNib:[EMPhotoCell nib] forCellReuseIdentifier:cellIdentifier];
}

-(void)p_addNewItem{
    EMPhoto *photo = [[EMPhoto alloc]init];
    photo.name = @"photo_new";
    photo.desp = @"photo_new_desp";
    [_photoDataSource addANewItem:photo];
    NSLog(@"喵，又来一个～");
    [self.tableView reloadData];
}

-(void)p_deleteCell:(EMPhotoCell *)cell{
    NSIndexPath *deletingPath = [self.tableView indexPathForCell:cell];
    [_photoDataSource deleteItemAtIndexPath:deletingPath];
    NSLog(@"真的不要我了么～");
    [self.tableView deleteRowsAtIndexPaths:@[deletingPath] withRowAnimation:UITableViewRowAnimationFade];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"you tapped row:%ld",indexPath.row);
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
