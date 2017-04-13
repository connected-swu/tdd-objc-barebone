//
//  ItemList.h
//  tddObjcBlank
//
//  Created by cl-dev on 2017-04-12.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
@interface ItemList : NSObject 
+ (instancetype)withItems:(NSArray *)items;
- (NSUInteger)itemCount;
- (float)totalPrice;
@end
