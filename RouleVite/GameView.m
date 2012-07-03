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
#import "Ground.h"

#define GROUND_HEIGHT   48.0


@interface GameView ()
{

}

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) Ball *ball;
@property (nonatomic, strong) Ground *ground;

- (void) _drawBackground;

@end


@implementation GameView


@synthesize displayLink;
@synthesize ball;
@synthesize ground;

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
        ball.skyHeight = self.frame.size.height-GROUND_HEIGHT;
        
        ground = [[Ground alloc] init];
        ground.screenSize = self.frame.size;
        ground.height = GROUND_HEIGHT;
        
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
    [ball updateAtTimestamp:sender.timestamp];
    [ground updateAtTimestamp:sender.timestamp];
    
    [self setNeedsDisplay];
}



// MARK: Drawing

- (void)drawRect:(CGRect)rect
{
    [self _drawBackground];
    [ground draw];
    [ball draw];
}


- (void) _drawBackground
{
    [[UIColor colorWithRed:118.0/255.0 green:181.0/255.0 blue:252.0/255.0 alpha:1.0] setFill];
    UIRectFill(self.bounds);    
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
