//
//  ThirdVC.h
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifyArrayDelegate.h"

@interface AddItemVC : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) id <addItemDelegate> delegateAddItem;
@property (weak, nonatomic) IBOutlet UIView *viewContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewContainerHeightConstraint;

@end
