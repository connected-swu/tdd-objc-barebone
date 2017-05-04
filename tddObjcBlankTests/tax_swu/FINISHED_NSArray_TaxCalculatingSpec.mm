#import <Cedar/Cedar.h>
#import "NSArray+SwuTaxCalculating.h"
#import "SwuItem.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NSArray_TaxCalculatingSpec)

xdescribe(@"NSArray_TaxCalculating", ^{
    __block NSArray *subject;
    
    describe(@"single general item", ^{
        beforeEach(^{
            subject = @[[SwuItem ofType:SwuItemTypeGeneral
                                costing:25.0]];
        });
        it(@"should add 10% HST tax", ^{
            [subject swu_totalTax] should be_close_to(27.5);
        });
    });
    
    describe(@"multiple general items", ^{
        beforeEach(^{
            subject = @[[SwuItem ofType:SwuItemTypeGeneral
                                costing:25.0],
                        [SwuItem ofType:SwuItemTypeGeneral
                                costing:10.0]];
        });
        it(@"should add 10% HST tax for both items", ^{
            [subject swu_totalTax] should be_close_to(38.5);
        });
    });
    
    describe(@"books", ^{
        beforeEach(^{
            subject = @[[SwuItem ofType:SwuItemTypeBook
                                costing:5.0]];
        });
        it(@"should add 5% GST tax for the item", ^{
            [subject swu_totalTax] should be_close_to(5.25);
        });
    });
    
    describe(@"food", ^{
        beforeEach(^{
            subject = @[[SwuItem ofType:SwuItemTypeFood
                                costing:5.0],
                        [SwuItem ofType:SwuItemTypeFood
                                costing:3.3]];
        });
        it(@"should be tax exempt", ^{
            [subject swu_totalTax] should be_close_to(8.3);
        });
    });
    
    describe(@"mixed items", ^{
        beforeEach(^{
            subject = @[[SwuItem ofType:SwuItemTypeGeneral
                                costing:8.0],
                        [SwuItem ofType:SwuItemTypeBook
                                costing:1.0],
                        [SwuItem ofType:SwuItemTypeFood
                                costing:7.0]];
        });
        it(@"should be tax exempt", ^{
            [subject swu_totalTax] should be_close_to(8.8 + 1.05 + 7.0);
        });
    });
    
    describe(@"applying discount", ^{
        context(@"for items costing less than $50 before tax, but more than $50 after tax", ^{
            beforeEach(^{
                subject = @[[SwuItem ofType:SwuItemTypeGeneral
                                    costing:49.99]];
            });
            it(@"should not apply a 20% discount", ^{
                [subject swu_totalTax] should be_close_to(54.99);
            });
        });
        context(@"for items costing exactly $50 before tax", ^{
            beforeEach(^{
                subject = @[[SwuItem ofType:SwuItemTypeFood
                                    costing:25.00],
                            [SwuItem ofType:SwuItemTypeFood
                                    costing:25.00]];
            });
            it(@"should apply a 20% discount", ^{
                [subject swu_totalTax] should be_close_to(40.00);
            });
        });
        context(@"for items costing more than $50 before tax", ^{
            beforeEach(^{
                subject = @[[SwuItem ofType:SwuItemTypeGeneral
                                    costing:15.00],
                            [SwuItem ofType:SwuItemTypeBook
                                    costing:15.00],
                            [SwuItem ofType:SwuItemTypeFood
                                    costing:20.01]];
            });
            it(@"should apply a 20% discount", ^{
                [subject swu_totalTax] should be_close_to(41.81);
            });
        });
    });
    
});

SPEC_END
