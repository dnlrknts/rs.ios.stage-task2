#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableArray *mutableNumbers = [numbersArray mutableCopy];
    if (nil == mutableNumbers || mutableNumbers.count == 0) {
        return @"";
    }
    for (NSNumber *number in mutableNumbers) {
        if (number.integerValue < 0) {
            return @"Negative numbers are not valid for input.";
        }
        if (number.integerValue > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
    }
    while (mutableNumbers.count < 4) {
        [mutableNumbers addObject:@0];
    }
    
    NSRange range = NSMakeRange(0, 4);
    return [[mutableNumbers subarrayWithRange:range] componentsJoinedByString:@"."];
}

@end
