#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (nil == array) {
        return @[];
    }
    
    NSPredicate *arrPred = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSArray class]];
    NSArray *filteredArrays = [array filteredArrayUsingPredicate:arrPred];
    if (filteredArrays.count == 0) {
        return @[];
    }
    
    NSArray *flatArray = [array valueForKeyPath:@"@unionOfArrays.self"];

    NSPredicate *numberPred = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSNumber class]];
    NSPredicate *stringPred = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSString class]];
    NSArray *filteredNumbers = [flatArray filteredArrayUsingPredicate:numberPred];

    if (filteredNumbers.count == flatArray.count || filteredNumbers.count == 0) {
        return [flatArray sortedArrayUsingSelector: @selector(compare:)];
    }
    else {
        NSArray *numbers = [filteredNumbers sortedArrayUsingSelector: @selector(compare:)];
        NSArray *filteredStrings = [flatArray filteredArrayUsingPredicate:stringPred];
        NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(compare:)];
        NSArray *strings = [filteredStrings sortedArrayUsingDescriptors:@[sortDescriptor]];
        return @[numbers, strings];
    }   
}

@end
