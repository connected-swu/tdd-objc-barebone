//
//  Item.m
//  tddObjcBlank
//
//  Created by cl-dev on 2017-04-12.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "Item.h"

@implementation Item

+ (instancetype)costing:(float)price {
    Item *item = [[Item alloc] init];
    item.price = price;
    
    return item;
}

+ (instancetype)ofType:(ITEM_TYPE)type costing:(float)price {
    Item *item = [[Item alloc] init];
    item.price = price;
    item.type = type;
    return item;
}

@end
