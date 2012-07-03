//
//  CeGameView.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "GameView.h"

#define GROUND_Y    272.0
#define BALL_DIAMETER   32.0

@interface GameView ()
{
    float ballElevation;
}

- (void) _drawBackground;
- (void) _drawGround;
- (void) _drawBall;

@end


@implementation GameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    [self _drawBackground];
    [self _drawGround];
    [self _drawBall];
}


- (void) _drawBackground
{
    [[UIColor colorWithRed:118.0/255.0 green:181.0/255.0 blue:252.0/255.0 alpha:1.0] setFill];
    UIRectFill(self.bounds);    
}

- (void) _drawGround
{
    [[UIColor colorWithRed:125.0/255.0 green:70.0/255.0 blue:25.0/255.0 alpha:1.0] setFill];
    UIRectFill(CGRectMake(0.0, GROUND_Y, 480.0, 48.0));      
}

- (void) _drawBall
{
    [[UIColor redColor] setFill];
    CGRect ballRect = CGRectMake(50.0, GROUND_Y-BALL_DIAMETER, BALL_DIAMETER, BALL_DIAMETER);
    [[UIBezierPath bezierPathWithOvalInRect:ballRect] fill];
}

@end
