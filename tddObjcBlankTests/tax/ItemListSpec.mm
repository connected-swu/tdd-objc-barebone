#import <Cedar/Cedar.h>
#import "ItemList.h"
#import "Item.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ItemListSpec)

describe(@"ItemList", ^{
    __block ItemList *subject;
    __block Item *item1;
    __block Item *item2;
    __block Item *item3;

    beforeEach(^{
        item1 = [Item ofType:ITEM_TYPE_GENERAL costing:20.00];
        item2 = [Item ofType:ITEM_TYPE_GENERAL costing:25.00];
    });
    
    describe(@"instantiation", ^{
        beforeEach(^{
            subject = [ItemList withItems:@[item1, item2]];
        });
        
        it(@"should instantiate with right object type", ^{
            subject should be_instance_of([ItemList class]);
        });
        
        it(@"should have the items", ^{
            subject.itemCount should equal(2);
        });
    });
    
    describe(@"total price after tax", ^{
        beforeEach(^{
            subject = [ItemList withItems:@[item1, item2]];
        });
        
        it(@"should be correct", ^{
            subject.totalPrice should be_close_to(49.50);
        });
    });
    
    describe(@"total price after 5% GST tax", ^{
        beforeEach(^{
            item1 = [Item ofType:ITEM_TYPE_BOOK costing:20.00];
            item2 = [Item ofType:ITEM_TYPE_BOOK costing:25.00];
            subject = [ItemList withItems:@[item1, item2]];
        });
        
        it(@"should be correct", ^{
            subject.totalPrice should be_close_to(47.25);
        });
    });
    
    describe(@"calculating the total price of an item and a book", ^{
        beforeEach(^{
            item1 = [Item ofType:ITEM_TYPE_BOOK costing:20.00];
            item2 = [Item ofType:ITEM_TYPE_GENERAL costing:25.00];
            subject = [ItemList withItems:@[item1, item2]];
        });
        
        it(@"should include 10% tax for items and 5% tax for books", ^{
            subject.totalPrice should be_close_to(48.50);
        });
    });
    
    describe(@"total price after 10% HST and 5% GST tax and NO TAX", ^{
        beforeEach(^{
            item1 = [Item ofType:ITEM_TYPE_BOOK costing:10.00];
            item2 = [Item ofType:ITEM_TYPE_GENERAL costing:20.00];
            item3 = [Item ofType:ITEM_TYPE_FOOD 
                         costing:10.00];
            subject = [ItemList withItems:@[item1, item2, item3]];
        });
        
        it(@"should be correct", ^{
            subject.totalPrice should be_close_to(42.5);
        });
    });
    
    describe(@"calculating total", ^{
        context(@"for goods under $50 before tax", ^{
            beforeEach(^{
                item1 = [Item ofType:ITEM_TYPE_BOOK costing:20.00];
                item2 = [Item ofType:ITEM_TYPE_GENERAL costing:24.00];
                item3 = [Item ofType:ITEM_TYPE_FOOD costing:5.00];
                subject = [ItemList withItems:@[item1, item2, item3]];
            });
            it(@"should not apply a 20% discount", ^{
                subject.totalPrice should be_close_to(52.4);
            });
        });
        context(@"for goods costing $50 before tax", ^{
            beforeEach(^{
                item1 = [Item ofType:ITEM_TYPE_BOOK costing:20.00];
                item2 = [Item ofType:ITEM_TYPE_GENERAL costing:25.00];
                item3 = [Item ofType:ITEM_TYPE_FOOD costing:5.00];
                subject = [ItemList withItems:@[item1, item2, item3]];
            });
            it(@"should apply 20% discount", ^{
                //TODO
            });
        });
        context(@"for goods over $50 before tax", ^{
            beforeEach(^{
                item1 = [Item ofType:ITEM_TYPE_BOOK costing:20.00];
                item2 = [Item ofType:ITEM_TYPE_GENERAL costing:25.00];
                item3 = [Item ofType:ITEM_TYPE_FOOD costing:10.00];
                subject = [ItemList withItems:@[item1, item2, item3]];
            });
        });
        

    });
});

SPEC_END
