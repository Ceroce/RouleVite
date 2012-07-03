//
//  GameItem.h
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//


@protocol GameItem <NSObject>

- (void) draw;
- (void) updateAtTimestamp:(CFTimeInterval)timestamp;

@end
