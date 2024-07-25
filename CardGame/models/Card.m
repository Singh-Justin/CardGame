#import "Card.h"

@implementation Card

- (int)match:(Card *)card {
    int score = 0;

    if (card && [card.contents isEqualToString:self.contents]) {
        score = 1;
    }
    
    return score;
}

@end
