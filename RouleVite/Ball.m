//
//  Ball.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "Ball.h"

#define DIAMETER   32.0

@interface Ball ()
{
    float elevation;
    BOOL raising;
}

@property (nonatomic, readwrite, assign) float elevation;

@end

@implementation Ball

@synthesize skyHeight;
@synthesize elevation;

- (void) touchBegan
{
    if(elevation == 0.0)    // On the ground
        raising = YES;
}

- (void) touchEnded
{
    raising = NO;
}

- (void) updateAtTimePosition:(CFTimeInterval)timePosition
{
    const float kBallElevationIncrement = 8.0;
    float elevationMax = skyHeight - DIAMETER;
    
    if(raising)
    {
        elevation += kBallElevationIncrement;
        if(elevation > elevationMax)
        {
            elevation = elevationMax;
            raising = NO;
        }
    }
    else
    {
        elevation -= kBallElevationIncrement;
        if(elevation < 0.0)
            elevation = 0.0;
    }    
}

- (void) draw
{
    [[UIColor redColor] setFill];
    CGRect ballRect = CGRectMake(50.0, 
                                 skyHeight-DIAMETER-elevation, 
                                 DIAMETER, 
                                 DIAMETER);
    [[UIBezierPath bezierPathWithOvalInRect:ballRect] fill];    
}

- (CGPoint) center
{
    return CGPointMake(50.0+DIAMETER/2.0, skyHeight-DIAMETER/2.0);
}

@end
