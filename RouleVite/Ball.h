//
//  Ball.h
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameItem.h"


@interface Ball : NSObject <GameItem>

@property (nonatomic, assign) CGFloat skyHeight;
@property (nonatomic, readonly, assign) float elevation;
- (CGPoint) center;

- (void) touchBegan;
- (void) touchEnded;


@end
