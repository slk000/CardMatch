//
//  Card.m
//  CardMatch
//
//  Created by Takanashirin on 15/7/17.
//  Copyright © 2015年 孙凌昆. All rights reserved.
//

#import "Card.h"
@interface Card()
@end

@implementation Card

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }

    
    return score;
}

@end
