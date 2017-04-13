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
    float total = 0.0f;
    for (Item *item in self.items) {
        total += item.totalPrice;
    }
    return total;
}

@end
