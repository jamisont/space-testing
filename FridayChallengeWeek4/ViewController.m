//
//  ViewController.m
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    int duration = 7;
    
    [UIView animateWithDuration:(duration / 2 + 1) animations:^{
        self.labelLoading.alpha = 0;
    }];
    
//    self.heightConstraintViewObscuring.constant -= self.view.frame.size.height;
//    
//    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
//        // modify frame
////        [self.view translatesAutoresizingMaskIntoConstraints];
////        self.viewObscuring.frame = CGRectMake(0, self.view.frame.size.height, self.viewObscuring.frame.size.width, self.viewObscuring.frame.size.height);
//        // alternate option: modify constraint directly
//        [self.view layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        [self performSegueWithIdentifier:@"goToSecondScreen" sender:self];
//    }];
    
    [UIView transitionWithView:self.view duration:duration options:UIViewAnimationOptionTransitionCurlDown animations:^{
        [self.viewObscuring setHidden:true];
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"goToTableView" sender:self];
    }];
    
//    [UIView transitionFromView:self.view toView:self.imageViewCustom duration:duration options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
//        [self performSegueWithIdentifier:@"goToTableView" sender:self];
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
