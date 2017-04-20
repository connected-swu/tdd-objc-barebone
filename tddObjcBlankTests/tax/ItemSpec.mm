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
    
    describe(@"total price after tax 10% HST", ^{
        beforeEach(^{
            subject = [Item ofType:ITEM_TYPE_GENERAL costing:10.00];
        });
        
        it(@"should populate the correct cost", ^{
            subject.totalPrice should be_close_to(11.00);
        });
    });
    
    describe(@"total price for a book after 5% GST", ^{
        beforeEach(^{
            subject = [Item ofType:ITEM_TYPE_BOOK costing:7.00];
        });
        
        it(@"should populate the correct total price", ^{
            subject.totalPrice should be_close_to(7.35);
        });
    });
    
    describe(@"total price for a food after NO TAX!", ^{
        beforeEach(^{
            subject = [Item ofType:ITEM_TYPE_FOOD costing:7.00];
        });
        
        it(@"should populate the correct total price", ^{
            subject.totalPrice should be_close_to(7.00);
        });
    });
});

SPEC_END
