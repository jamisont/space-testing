//
//  ThirdVC.h
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addItemDelegate

- (void)addItem:(NSString *)stringToAdd;

@end

@interface ThirdVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) id <addItemDelegate> delegateAddItem;

@end
