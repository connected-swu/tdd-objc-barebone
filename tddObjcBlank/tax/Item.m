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
    item.totalPrice = price * 1.10;
    
    return item;
}

+ (instancetype)ofType:(ITEM_TYPE)type costing:(float)price {
    Item *item = [[Item alloc] init];
    item.price = price;
    
    switch (type) {
        case ITEM_TYPE_BOOK:
            item.totalPrice = price * 1.05;
            break;
        case ITEM_TYPE_FOOD:
            item.totalPrice = price;
            break;
        case ITEM_TYPE_GENERAL:
        default:
            item.totalPrice = price * 1.10;
            break;
    }
    return item;
}

@end
