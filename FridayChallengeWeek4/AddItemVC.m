//
//  ThirdVC.m
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "AddItemVC.h"



@interface AddItemVC ()


@end

@implementation AddItemVC

#pragma mark - Default Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textField becomeFirstResponder];
    self.navigationItem.title = @"Add an item";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self commitChanges];
    return false;
}

#pragma mark - Custom Methods

- (void)commitChanges
{
    // Save user input to array and return to view controller displaying list
    [self.delegateAddItem addItem:self.textField.text];
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - IBAction Methods

- (IBAction)pressedButton:(id)sender {
    [self commitChanges];
}


@end
