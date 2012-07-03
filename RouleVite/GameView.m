//
//  CeGameView.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "GameView.h"
#import <QuartzCore/QuartzCore.h>

#define SCREEN_HEIGHT   320.0
#define GROUND_Y    272.0
#define BALL_DIAMETER   32.0
#define ELEVATION_MAX   (GROUND_Y - BALL_DIAMETER)

@interface GameView ()
{
    float ballElevation;
    BOOL touched;
}

@property (nonatomic, strong) CADisplayLink *displayLink;

- (void) _drawBackground;
- (void) _drawGround;
- (void) _drawBall;

@end


@implementation GameView


@synthesize displayLink;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(_displayLinkDidFire:)];
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)dealloc
{
    [displayLink invalidate];
}

// MARK: Sequencing
- (void) _displayLinkDidFire:(CADisplayLink *)sender
{
    const float kBallElevationIncrement = 8.0;
    
    if(touched)
    {
        ballElevation += kBallElevationIncrement;
        if(ballElevation > ELEVATION_MAX)
            ballElevation = ELEVATION_MAX;
    }
    else
    {
        ballElevation -= kBallElevationIncrement;
        if(ballElevation < 0.0)
            ballElevation = 0.0;
    }
    
    [self setNeedsDisplay];
}



// MARK: Drawing

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
    CGRect ballRect = CGRectMake(50.0, 
                                 GROUND_Y-BALL_DIAMETER-ballElevation, 
                                 BALL_DIAMETER, 
                                 BALL_DIAMETER);
    [[UIBezierPath bezierPathWithOvalInRect:ballRect] fill];
}

// MARK: Touch events
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    touched = YES;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    touched = NO;
}

@end
