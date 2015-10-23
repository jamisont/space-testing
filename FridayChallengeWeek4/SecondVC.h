//
//  SecondVC.h
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdVC.h"

@interface SecondVC : UIViewController <UITableViewDataSource, UITableViewDelegate, addItemDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
