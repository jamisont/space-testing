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
    
//    [self.textField becomeFirstResponder];
    self.navigationItem.title = @"Add an item";
    [self registerForKeyboardNotifications];
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

#pragma mark - Keyboard Handling Methods
// this code modified from "About Text Handling in iOS" documentation

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWasShown:(NSNotification *)aNotification
{
    // get keyboard size from notification
    CGSize kbSize = [[[aNotification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // resize view frame based on keyboard size
    self.viewContainerHeightConstraint.constant = -kbSize.height;
    
    [self.view layoutIfNeeded];
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    // return view container to superview size
    self.viewContainerHeightConstraint.constant = 0;
    
    [self.view layoutIfNeeded];
}

#pragma mark - IBAction Methods

- (IBAction)pressedButton:(id)sender {
    [self commitChanges];
}


@end
