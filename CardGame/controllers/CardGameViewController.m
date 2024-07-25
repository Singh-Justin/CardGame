#import "CardGameViewController.h"
#import "../models/PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *deck;

@end

@implementation CardGameViewController

- (Deck *) deck {
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)handleCardPress:(UIButton *)sender {
    
    Card *card = [self.deck drawRandomCard];
    
    if(!card) return;
    
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"front"] forState:UIControlStateNormal];
        [sender setTitle:card.contents forState:UIControlStateNormal];
    }
    
    self.flipCount++;
}

@end
