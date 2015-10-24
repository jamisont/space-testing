//
//  ViewController.m
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "LoadingVC.h"
#import "DisplayTableVC.h"

@interface LoadingVC ()

@end

@implementation LoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    int duration = 5;
    
    [UIView animateWithDuration:(duration / 2 + 1) animations:^{
        self.labelLoading.alpha = 0;
    }];
    
    self.heightConstraintViewObscuring.constant -= self.view.frame.size.height;
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"goToTableView" sender:self];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
