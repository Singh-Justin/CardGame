#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *) cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}


- (void) addCard:(Card *)card atTop:(BOOL)atTop {}
- (void) addCard:(Card *)card {}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if(![self.cards count]) return randomCard;
    
    unsigned index = arc4random() % [self.cards count];
    randomCard = self.cards[index];
    [self.cards removeObjectAtIndex:index];
        
    return randomCard;
}

@end
