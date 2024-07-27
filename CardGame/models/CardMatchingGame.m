#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

- (NSMutableArray *) cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    
    self = [super init];
    
    if(!self) return self;
    
    for(int i = 0; i < count; i++){
        Card *card = [deck drawRandomCard];
        [self.cards addObject:card];
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        if(card.isChosen){
            card.isChosen = NO;
        }else{
            for(Card *cardItem in self.cards){
                if(cardItem.isChosen && !cardItem.isMatched){
                    int score = [card match:cardItem];
                    
                    if(score){
                        self.score += score * MATCH_BONUS;
                        card.isMatched = YES;
                        cardItem.isMatched = YES;
                    }
                    else{
                        self.score -= MISMATCH_PENALTY;
                        cardItem.isChosen = FALSE;
                    }
                    
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.isChosen = YES;
        }
    }
}


- (Card *) cardAtIndex:(NSUInteger)index {
    if(![self.cards count]) return nil;
    
    
    return self.cards[index];
}

- (instancetype) init {
    return nil;
}

@end
