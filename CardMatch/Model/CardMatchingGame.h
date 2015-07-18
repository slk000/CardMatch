//
//  CardMatchingGame.h
//  CardMatch
//
//  Created by Takanashirin on 15/7/17.
//  Copyright © 2015年 孙凌昆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void) chooseCardAtIndex:(NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger)index;
@property (nonatomic, readonly) NSInteger score;

@end
