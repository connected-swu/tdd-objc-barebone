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

    beforeEach(^{
        item1 = [Item costing:20.00];
        item2 = [Item costing:25.00];
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
});

SPEC_END
