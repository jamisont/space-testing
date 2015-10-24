//
//  DisplayItemVC.h
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifyArrayDelegate.h"

@interface DisplayItemVC : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSString *itemToDisplay;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *buttonEdit;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;

@property (strong, nonatomic) id <editItemDelegate> delegateEditItem;

@end
