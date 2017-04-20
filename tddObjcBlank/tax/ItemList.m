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
    float totalPreTax = 0.0f;
    float totalAfterTax = 0.0f;
    for (Item *item in self.items) {
        totalPreTax += item.price;
        totalAfterTax += item.totalPrice;
    }
    if (totalPreTax >= 50.f) {
        totalAfterTax *= 0.8;
    }
    return totalAfterTax;
}

@end
