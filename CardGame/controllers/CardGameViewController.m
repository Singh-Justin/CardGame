#import "CardGameViewController.h"
#import "../models/PlayingCardDeck.h"
#import "../models/CardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation CardGameViewController

-(CardMatchingGame *) game {
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck: [self createDeck]];
    }

    return _game;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)handleCardPress:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void) updateUI{
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardIndex];
        
        if(card){
            [cardButton setTitle:[self setCardTitle:card] forState:(UIControlStateNormal)];
            [cardButton setBackgroundImage:[self setCardBackgroundImage:card] forState:(UIControlState)UIControlStateNormal];
            cardButton.enabled = !card.isMatched;
            
        }
    }
}

- (NSString *) setCardTitle:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) setCardBackgroundImage:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"front" : @"back"];
}

@end
