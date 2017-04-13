//
//  Item.h
//  tddObjcBlank
//
//  Created by cl-dev on 2017-04-12.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ITEM_TYPE){
    ITEM_TYPE_BOOK
};

@interface Item : NSObject
@property (nonatomic) float price;
@property (nonatomic) float totalPrice;
+ (instancetype)costing:(float)price;
+ (instancetype)ofType:(ITEM_TYPE)type costing:(float)price;
@end
