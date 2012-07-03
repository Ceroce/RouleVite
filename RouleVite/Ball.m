//
//  Ball.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "Ball.h"

#define BALL_DIAMETER   32.0

@interface Ball ()
{
    float ballElevation;
    BOOL ballRaising;
}

@end

@implementation Ball

@synthesize skyHeight;

- (void) touchBegan
{
    if(ballElevation == 0.0)    // On the ground
        ballRaising = YES;
}

- (void) touchEnded
{
    ballRaising = NO;
}

- (void) update
{
    const float kBallElevationIncrement = 8.0;
    float elevationMax = skyHeight - BALL_DIAMETER;
    
    if(ballRaising)
    {
        ballElevation += kBallElevationIncrement;
        if(ballElevation > elevationMax)
        {
            ballElevation = elevationMax;
            ballRaising = NO;
        }
    }
    else
    {
        ballElevation -= kBallElevationIncrement;
        if(ballElevation < 0.0)
            ballElevation = 0.0;
    }    
}

- (void) draw
{
    [[UIColor redColor] setFill];
    CGRect ballRect = CGRectMake(50.0, 
                                 skyHeight-BALL_DIAMETER-ballElevation, 
                                 BALL_DIAMETER, 
                                 BALL_DIAMETER);
    [[UIBezierPath bezierPathWithOvalInRect:ballRect] fill];    
}

@end
