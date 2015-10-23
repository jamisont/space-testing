//
//  DisplayItemVC.m
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "DisplayItemVC.h"

@interface DisplayItemVC ()

@end

@implementation DisplayItemVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.itemToDisplay;
    self.textField.text = self.itemToDisplay;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)toggleHidden
{
    [UIView animateWithDuration:2 animations:^{
        self.buttonCancel.alpha = 1 - self.buttonCancel.alpha;
        self.buttonEdit.alpha = 1 - self.buttonEdit.alpha;
        self.buttonSave.alpha = 1 - self.buttonSave.alpha;
        self.textField.alpha = 1 - self.textField.alpha;
    }];
}

- (IBAction)pressedEdit:(id)sender {
    [self toggleHidden];
}

- (IBAction)pressedSave:(id)sender {
    [self.delegateEditItem replaceString:self.itemToDisplay withString:self.textField.text];
//    [self toggleHidden];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)pressedCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

@end
