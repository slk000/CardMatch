//
//  CardMatchingGame.m
//  CardMatch
//
//  Created by Takanashirin on 15/7/17.
//  Copyright © 2015年 孙凌昆. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
            
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return ((index < [self.cards count]) ? self.cards[index] : nil);
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.isChosen = NO;
        } else {
            for (Card *otherCard in self.cards) {//only 1 card in cards since it's simply matching 2 cards
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.isMatched = YES;
                        card.isMatched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.isChosen = NO;
                    }
                    break;//2 cards to match
                }
                
            }
            self.score -= COST_TO_CHOOSE;
            card.isChosen = YES;
        }
    }
}
@end
