#import <Cedar/Cedar.h>
#import "Item.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ItemSpec)

describe(@"Item", ^{
    __block Item *subject;

    describe(@"instantiation", ^{
        beforeEach(^{
            subject = [Item ofType:ITEM_TYPE_GENERAL costing:2.50];
        });
        
        it(@"should populate with correct price", ^{
            subject.price should be_close_to(2.50);
        });
    });
});

SPEC_END
