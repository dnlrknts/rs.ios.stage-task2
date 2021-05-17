#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 reversed = 0;

    for (int i = 0; i < 8; i++) {
        reversed <<= 1;

        if ((n & 1) == 1) {
            reversed ^= 1;
        }

        n >>= 1;
    }
    return reversed;
}
