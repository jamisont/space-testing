//
//  ViewController.h
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageViewCustom;
@property (weak, nonatomic) IBOutlet UILabel *labelLoading;
@property (weak, nonatomic) IBOutlet UIView *viewObscuring;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraintViewObscuring;

@end

