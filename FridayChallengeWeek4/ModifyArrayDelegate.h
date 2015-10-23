//
//  ModifyArrayDelegate.h
//  FridayChallengeWeek4
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#ifndef ModifyArrayDelegate_h
#define ModifyArrayDelegate_h

@protocol addItemDelegate

- (void)addItem:(NSString *)stringToAdd;

@end

@protocol editItemDelegate

- (void)replaceString:(NSString *)stringOriginal withString:(NSString *)stringModified;

@end

#endif /* ModifyArrayDelegate_h */
