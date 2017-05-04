//
//  NSArray+SwuTaxCalculating.m
//  tddObjcBlank
//


#import "NSArray+SwuTaxCalculating.h"
#import "SwuItem.h"


@implementation NSArray (SwuTaxCalculating)

- (float)swu_totalTax {
    float total = 0.0;
    float totalBeforeTax = 0.0;
    for (SwuItem *item in self) {
        totalBeforeTax += item.price;
        switch (item.type) {
            case SwuItemTypeGeneral:
                total += item.price * 1.1;
                break;
            case SwuItemTypeBook:
                total += item.price * 1.05;
                break;
            case SwuItemTypeFood:
            default:
                total += item.price;
                break;
        }
    }
    return (50.00 - totalBeforeTax > FLT_EPSILON) ? total : total * 0.8;
}

@end
