//
//  SecondVC.m
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "DisplayTableVC.h"
#import "AddItemVC.h"
#import "EditItemVC.h"

@interface DisplayTableVC ()

{
    NSMutableArray *arrayForTable;
}

@end

@implementation DisplayTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayForTable = [[NSMutableArray alloc] init];
    
    [self.navigationController setNavigationBarHidden:false animated:true];
    [self.navigationController setViewControllers:@[self]];
    self.navigationItem.hidesBackButton = true;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:selectedIndexPath];
    
    if (selectedCell) {
        selectedCell.textLabel.text = arrayForTable[selectedIndexPath.row];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = [segue destinationViewController];
    
    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
    
    if ([vc isKindOfClass:[AddItemVC class]])
    {
        AddItemVC *tvc = (AddItemVC *)vc;
        tvc.delegateAddItem = self;
    }
    else if ([vc isKindOfClass:[EditItemVC class]])
    {
        EditItemVC *divc = (EditItemVC *)vc;
        divc.itemToDisplay = arrayForTable[selectedIndex.row];
        divc.delegateEditItem = self;
    }
}

#pragma mark - Delegate methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    cell.textLabel.text = arrayForTable[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.accessibilityIdentifier = [NSString stringWithFormat:@"cell_%ld", (long)indexPath.row];
    cell.textLabel.accessibilityIdentifier = [NSString stringWithFormat:@"cellTextLabel_%ld", (long)indexPath.row];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayForTable count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"displayItem" sender:self];
}

#pragma mark - Custom Delegate Methods

-(void)addItem:(NSString *)stringToAdd
{
    [self.tableView beginUpdates];
    
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[arrayForTable count] inSection:0];
    [arrayForTable addObject:stringToAdd];

    
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.tableView endUpdates];
}

-(void)replaceString:(NSString *)stringOriginal withString:(NSString *)stringModified
{
    NSUInteger indexOfOriginalString = [arrayForTable indexOfObject:stringOriginal];
    [arrayForTable replaceObjectAtIndex:indexOfOriginalString withObject:stringModified];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark IBAction Methods

- (IBAction)pressedAdd:(id)sender {
    [self performSegueWithIdentifier:@"addItem" sender:self];
}

@end
