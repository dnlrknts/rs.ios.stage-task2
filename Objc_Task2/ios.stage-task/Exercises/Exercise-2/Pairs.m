#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger counter = 0;
    for (int i = 0; i < array.count - 1; i++) {
        for (int j = i + 1; j < array.count; j++) {
            if (fabs([[array objectAtIndex:i] doubleValue] - [[array objectAtIndex:j] doubleValue]) == [number doubleValue]) {
                counter += 1;
            }
        }
    }
    return counter;
}

@end
