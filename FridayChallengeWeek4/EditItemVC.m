//
//  DisplayItemVC.m
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "EditItemVC.h"

@interface EditItemVC ()

@end

@implementation EditItemVC

#pragma mark - Default Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.itemToDisplay;
    self.textField.text = self.itemToDisplay;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self shouldSaveChanges];
    return false;
}

#pragma mark - Custom Methods

- (void)shouldSaveChanges
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"About to end editing!" message:@"Would you like to save your changes?" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self saveChanges];
    }];
    UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"Continue editing" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self resumeEditing];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Discard changes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self discardChanges];
    }];
    
    [alert addAction:saveAction];
    [alert addAction:continueAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)resumeEditing
{
    // since alert controller is only presented when textfield is first responder, no code required here
}

- (void)saveChanges
{
    [self.delegateEditItem replaceString:self.itemToDisplay withString:self.textField.text];
    [self.navigationController popViewControllerAnimated:true];
}

- (void)discardChanges
{
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - IBAction Methods

- (IBAction)pressedEdit:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        self.buttonCancel.alpha = .6;
        self.buttonEdit.alpha = 0;
        self.buttonSave.alpha = .6;
        self.textField.alpha = .6;
    }];
    [self.textField becomeFirstResponder];
}

- (IBAction)pressedSave:(id)sender {
    [self saveChanges];
}

- (IBAction)pressedCancel:(id)sender {
    [self discardChanges];
}

@end
