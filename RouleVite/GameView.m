//
//  CeGameView.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "GameView.h"
#import "Ball.h"

#define SCREEN_HEIGHT   320.0
#define GROUND_Y    272.0


@interface GameView ()
{

}

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) Ball *ball;

- (void) _drawBackground;
- (void) _drawGround;

@end


@implementation GameView


@synthesize displayLink;
@synthesize ball;

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
    if (self) 
    {
        ball = [[Ball alloc] init];
        ball.skyHeight = GROUND_Y;
        
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
    [ball update];
    
    [self setNeedsDisplay];
}



// MARK: Drawing

- (void)drawRect:(CGRect)rect
{
    [self _drawBackground];
    [self _drawGround];
    [ball draw];
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


// MARK: Touch events
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [ball touchBegan];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [ball touchEnded];
}

@end
