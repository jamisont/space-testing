//
//  SecondVC.m
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

{
    NSMutableArray *arrayForTable;
}

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayForTable = [[NSMutableArray alloc] init];
    
    [self.navigationController setNavigationBarHidden:false animated:true];
    [self.navigationController setViewControllers:@[self]];
    self.navigationItem.hidesBackButton = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ThirdVC *tvc = [segue destinationViewController];
    tvc.delegateAddItem = self;
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
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayForTable count];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressedAdd:(id)sender {
    [self performSegueWithIdentifier:@"addItem" sender:self];
}

@end
