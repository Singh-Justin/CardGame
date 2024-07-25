#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL isMatched;
@property (nonatomic) BOOL isChosen;

- (int)match:(Card *)card;

@end
