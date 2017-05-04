//
//  ItemList.m
//  tddObjcBlank
//
//  Created by cl-dev on 2017-04-12.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "ItemList.h"

@interface ItemList ()

@property (nonatomic, strong)NSArray *items;

@end

@implementation ItemList

+ (instancetype)withItems:(NSArray *)items {
    ItemList *list = [[ItemList alloc] init];
    list.items = items;
    return list;
}

- (NSUInteger)itemCount {
    return self.items.count;
}

- (float)totalPrice {
    float totalAfterTax = 0.0;
    float totalBeforeTax = 0.0;
    for (Item *item in self.items) {
        totalBeforeTax += item.price;
        if (item.type == ITEM_TYPE_BOOK) {
            totalAfterTax += item.price * 1.05;
        } else if (item.type == ITEM_TYPE_FOOD) {
            totalAfterTax += item.price;
        } else {
            totalAfterTax += item.price * 1.1;
        }
    }
    if (totalBeforeTax >= 50.0) {
        totalAfterTax *= 0.8;
    }
    return totalAfterTax;
}

@end
