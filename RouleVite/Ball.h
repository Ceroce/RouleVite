//
//  Ball.h
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ball : NSObject

@property (nonatomic, assign) CGFloat skyHeight;

- (void) touchBegan;
- (void) touchEnded;
- (void) update;
- (void) draw;

@end
